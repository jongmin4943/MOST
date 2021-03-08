<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="https://www.melon.com/search/song/index.htm?q=original+soundtrack&section=&searchGnbYn=Y&kkoSpl=N&kkoDpType=&ipath=srch_form#params%5Bq%5D=original%2Bsoundtrack&params%5Bsort%5D=hit&params%5Bsection%5D=all&params%5BsectionId%5D=&params%5BgenreDir%5D=GN1501&params%5Bsq%5D=&params%5BsubLinkOrText%5D=L&po=pageObj&startIndex=1">멜론</a>

<%
Document doc = Jsoup.connect("https://www.melon.com/search/song/index.htm?q=original+soundtrack&section=&searchGnbYn=Y&kkoSpl=N&kkoDpType=&ipath=srch_form#params%5Bq%5D=original%2Bsoundtrack&params%5Bsort%5D=hit&params%5Bsection%5D=all&params%5BsectionId%5D=&params%5BgenreDir%5D=GN1501&params%5Bsq%5D=&params%5BsubLinkOrText%5D=L&po=pageObj&startIndex=1").get();

Element songs = doc.body().getElementById("frm_defaultList");

Elements song = songs.select("td");
String speechless = song.select(".fc_gray").text();
List<String> titles = new ArrayList<String>();
List<String> artists = new ArrayList<String>();
List<String> albums = new ArrayList<String>();
int count = 0;
for(Element e: song){
	if(e.select(".fc_gray").text().trim() != null && !e.select(".fc_gray").text().trim().equals("")){
		titles.add(e.select(".fc_gray").text().trim());
	}
	if(e.select("#artistName").text().trim() != null && !e.select("#artistName").text().trim().equals("")){
		artists.add(e.select("#artistName").text().trim().substring(0, e.select("#artistName").text().trim().length()/2));
	}
	if(e.select(".fc_mgray").text().trim() != null && !e.select(".fc_mgray").text().trim().equals("")){
		if(count%2 == 0){
			albums.add(e.select(".fc_mgray").text().trim());
		}
	}
/* 	System.out.println("wrap.right_none = "+e.select(".wrap.right_none").text());
	if(e.select(".wrap.right_none").text().trim() != null && !e.select(".wrap.right_none").text().trim().equals("")){
		//System.out.println("wrap.right_none #Q= "+e.select(".wrap.right_none#text").text());
		likes.add(e.select(".wrap.right_none").text().trim());
	} */
	if(titles.size() > 10){
		break;
	}
	count++;
}
/* System.out.println(titles);
System.out.println(artists);
System.out.println(albums); */

/* for(int i = 0; i<10; i++){
	System.out.println(titles.get(i)+"\t"+artists.get(i)+"\t"+albums.get(i)+"\t"+"\n");
} */

String url = "https://www.melon.com/commonlike/getSongLike.json?contsIds=31815967%2C32180585%2C31815962%2C5629425%2C5599568%2C32180594%2C4389943%2C4342899%2C30307111%2C8202307%2C4342898%2C30721530%2C30887127%2C5689709%2C8202296%2C33147062%2C33270426%2C30437847%2C31815961%2C30173058%2C32180584%2C30696441%2C33270430%2C30226383%2C31935722%2C8096989%2C31815956%2C32411670%2C30721532%2C31937918%2C33328696%2C31815960%2C106792071%2C32180582%2C32449352%2C1925006%2C30173060%2C30173057%2C5475721%2C5444125%2C30465579%2C4342896%2C30801603%2C5599566%2C1925007%2C30144618%2C3961092%2C32180591%2C30801607%2C31937932";
	/* Document docc = null;
	try{
		docc = Jsoup.connect(url)
				.header("host", "https://www.melon.com")
				.header("referer", "https://www.melon.com/search/song/index.htm?q=original+soundtrack&section=&searchGnbYn=Y&kkoSpl=N&kkoDpType=&ipath=srch_form")
				.ignoreContentType(true)
				.get();
	} catch(IOException e) {
		e.printStackTrace();
	} */
	
	Document cr = Jsoup.connect(url).ignoreContentType(true).get();
	
	
	String asda = cr.body().text();
	
	JSONObject outjobj = new JSONObject(asda);
	
	
	//System.out.println(outjobj.get("contsLike"));
	String a = outjobj.get("contsLike").toString();
	JSONArray jarr = new JSONArray(a);
	
	List<String> likes = new ArrayList<String>();
	
	for(int i = 0; i<10; i++){
		String cnt = jarr.get(i).toString();
		JSONObject b = new JSONObject(cnt);
		likes.add(b.get("SUMMCNT").toString());
	}
	
	System.out.println(likes);
	
	
%>

	<div id="titles">
		<%
			for(int i = 0; i<10; i++){
				String info = titles.get(i)+"\t"+artists.get(i)+"\t"+albums.get(i)+"\t"+likes.get(i)+"\n";
		%>
				<h2> <%=info %> </h2>
		<%	
			}
		%>

</body>
</html>