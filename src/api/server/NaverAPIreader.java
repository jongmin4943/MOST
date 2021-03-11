package api.server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;


public class NaverAPIreader {
	private final static String CLIENT_ID = "PIie9DCNwGKUlCOeHVQ1";
	private final static String CLIENT_SECRET = "IGuYQGDM6k";
	
	public static void main(String[] args) {
		JSONObject ans = getInfos("Coco");
		System.out.println(ans);
	}
	
	public static boolean yOrNo(String movieNm) {
		if(getInfos(movieNm) != null) {
			return true;
		}
		return false;
	}
	
	public static JSONObject getInfos(String movieNm) {
		
		String encName = "";
		
		try {
			encName = URLEncoder.encode(movieNm,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String url = "https://openapi.naver.com/v1/search/movie.json?query="+encName+"&display=20";
		Map<String, String> headers = new HashMap<String, String>();
		headers.put("X-Naver-Client-Id", CLIENT_ID);
		headers.put("X-Naver-Client-Secret", CLIENT_SECRET);
		JSONObject res = get(url, headers);
		
		String pans = res.get("items").toString();
		//System.out.println("pans "+pans);
		
		
		JSONObject jsonAns = null;
		JSONArray jarr = new JSONArray(pans);
		for(Object job : jarr) {
			JSONObject jsonObj = new JSONObject(job.toString());
			//System.out.println("movieName made : <b>"+movieNm+"</b>");
			//System.out.println("actual subtitle: " + jsonObj.get("subtitle"));
			if(("<b>"+movieNm+"</b>").equals(jsonObj.get("title"))) {
				jsonAns = jsonObj;
				break;
			} else if (("<b>"+movieNm+"</b>").toLowerCase().equals(jsonObj.get("subtitle").toString().toLowerCase())) {
				jsonAns = jsonObj;
				break;
			}
		}
		return jsonAns;
	}

	private static JSONObject get(String url, Map<String, String> headers) {
		HttpURLConnection conn = connect(url);
		
		try {
			conn.setRequestProperty("X-Naver-Client-Id", headers.get("X-Naver-Client-Id"));
			conn.setRequestProperty("X-Naver-Client-Secret", headers.get("X-Naver-Client-Secret"));
		
			int respCode = conn.getResponseCode();
			if(respCode == HttpURLConnection.HTTP_OK) {
				return readContents(conn.getInputStream());
			}
		} catch (ProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			conn.disconnect();
		}
		
		return null;
	}

	private static JSONObject readContents(InputStream inputStream) throws IOException {
		InputStreamReader is = new InputStreamReader(inputStream,"UTF-8");
		BufferedReader streamReader = new BufferedReader(is);
		StringBuilder built = new StringBuilder();
		String si = "";
		
		while((si = streamReader.readLine()) != null) {
		       built.append(si);
		}
		JSONObject res = new JSONObject(built.toString());
		return res;
	}

	private static HttpURLConnection connect(String url) {
		try {
			URL apiURL = new URL(url);
			return (HttpURLConnection)apiURL.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + url, e);
		} catch (IOException e) {
			throw new RuntimeException("connection failed for some reason. : " + url, e);
		}
	}
}
