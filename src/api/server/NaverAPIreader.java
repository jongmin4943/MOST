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
		System.out.println(searchMovie("Into The Unknown (from ' Frozen 2' 영화 '겨울왕국 2')", "영화음악 ~70년대 편 베스트"));
	}
	
	public static boolean movieCheck(String albumNm, String titleNm) {
		if(searchMovie(titleNm, albumNm) != null) {
			return true;
		}
		return false;	
	}
	
	// Refining title name to extract movie's name (if there is one.)
	// Refining Album name to extract movie's name (if there is one.)
	public static JSONObject searchMovie(String titleNm, String albumNm) {
		JSONObject res = null;
		String titleAfter = "";
		String albumAfter = "";
		if(titleNm.contains("영화")) {
			if(titleNm.substring(titleNm.indexOf("영화")+4).contains("'")) {
				titleAfter = titleNm.substring(titleNm.indexOf("영화")+4);
				titleAfter = titleAfter.substring(0, titleAfter.indexOf("'"));
				titleAfter = titleAfter.replaceAll("[^a-zA-Zㄱ-ㅎ가-힣]+"," ");
				res = getInfo(titleAfter);
				if(res != null) {
					return res;
				}				
			}
		}
		if(albumNm.contains("영화")) {
			if(albumNm.substring(albumNm.indexOf("영화")+4).contains("'")) {
				albumAfter = albumNm.substring(albumNm.indexOf("영화")+4);
				albumAfter = albumAfter.substring(0, albumAfter.indexOf("'")+1);
				albumAfter = albumAfter.replaceAll("[^a-zA-Zㄱ-ㅎ가-힣]+"," ");
				res = getInfo(albumAfter);
				if(res != null) {
					return res;
				}				
			}
		}
		
		if(titleNm.toLowerCase().contains("from")) {
			titleAfter = titleNm.substring(titleNm.toLowerCase().indexOf("from")+6);
			titleAfter = titleAfter.replaceAll("[^a-zA-Zㄱ-ㅎ가-힣]+"," ");
			titleAfter.trim();
			res = getInfo(titleAfter);
			if(res != null) {
				return res;
			}
		}
		if(albumNm.toLowerCase().contains("from")) {
			albumAfter = albumNm.substring(albumNm.toLowerCase().indexOf("from")+6);
			albumAfter = albumAfter.replaceAll("[^a-zA-Zㄱ-ㅎ가-힣]+"," ");
			albumAfter.trim();
			res = getInfo(albumAfter);
			if(res != null) {
				return res;
			}
		}
		
		if(albumNm.contains("(")) {
			albumAfter = albumNm.substring(0, albumNm.indexOf("(", 1));
			albumAfter = albumAfter.trim();
			res = getInfo(albumAfter);
			if(res != null) {
				return res;
			}
		} 
		if(titleNm.contains("(")) {
			titleAfter = titleNm.substring(0, titleNm.indexOf("(", 1));
			titleAfter = titleAfter.trim();
			res = getInfo(titleAfter);
			if(res != null) {
				return res;
			}
		} 
		
		return res;
	}

	
	public static JSONObject getInfo(String movieNm) {
		movieNm = movieNm.trim();
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
		if(res == null) {
			return null;
		}
		String pans = res.get("items").toString();
		
		
		JSONObject jsonAns = null;
		JSONArray jarr = new JSONArray(pans);
		
		for(Object job : jarr) {
			JSONObject jsonObj = new JSONObject(job.toString());
			if(("<b>"+movieNm+"</b>").toLowerCase().equals(jsonObj.get("title").toString().toLowerCase())) {
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
