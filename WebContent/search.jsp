<%@page import="org.json.JSONObject"%>
<%@page import="api.server.NaverAPIreader"%>
<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search by Movie/OST</title>
</head>
<body>

<h2>Search Results:</h2>

<form action="search.jsp">
	<select name="type" id="type">
		<option value="OST">OST</option>
		<option value="영화">영화</option>
	</select>
	<input type="text" name="name" id="name"/>
	<input type="submit" name="sabumit" value="Search"/>
</form>

<script src="http://code.jquery.com/jquery.js"></script>

<script>
var name = $("#name").val();
console.log(name);
</script>

<hr />
<%
String result = "";
if(request.getParameter("sabumit") != null) {
	String name = "";
	if(request.getParameter("type").equals("OST")){
		name = request.getParameter("name");
	} else {
		name = request.getParameter("type")+ " " + request.getParameter("name");		
	}
	String encedTitle = "";
	
	try {
		encedTitle = URLEncoder.encode(name, "UTF-8");
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	String movie = "https://www.melon.com/search/song/index.htm?q="+encedTitle+"&section=&searchGnbYn=Y&kkoSpl=Y&kkoDpType=&linkOrText=T&ipath=srch_form";
	Document doc = Jsoup.connect(movie).get();
	
	Element songs = doc.body().getElementById("frm_defaultList");
	if(songs != null) {
		Elements song = songs.select("td");
		List<String> titles = new ArrayList<String>();
		List<String> artists = new ArrayList<String>();
		List<String> albums = new ArrayList<String>();
		
		int count = 0;
		String refinedTitle = "";
		
		for(Element e: song){
			if(!e.select(".fc_gray").text().trim().equals("California Dreamin' (Single Version)") && !e.select("#artistName").text().trim().substring(0, e.select("#artistName").text().trim().length()/2).equals("The Mamas & Papas") && !e.select(".fc_mgray").text().trim().equals("Zhong Qing Sen Lin ( Dian Ying Yuan Sheng Da Die ) (Original Motion Picture Soundtrack)")) {
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
			}
			if(titles.size() > 50){
				break;
			}
			count++;
		}
		
		int cnt = Math.min(titles.size(), Math.min(artists.size(), albums.size()));

		int numPrinted = 0;
		if(titles.size()>0){
			for(int i = 0; i<cnt; i++){
				System.out.println("album: "+ albums.get(i)+ " title: "+titles.get(i));
				if(NaverAPIreader.movieCheck(albums.get(i), titles.get(i))){
					numPrinted++;
%>
<h4><%=titles.get(i) %>  |  <%=artists.get(i) %>  |  <a href="movieInfo.jsp?album=<%=URLEncoder.encode(albums.get(i),"UTF-8") %>&title=<%=URLEncoder.encode(titles.get(i),"UTF-8") %>"><%=albums.get(i) %></a></h4>
<%
			}
		}
	}
	
	if(numPrinted == 0) {
		if(request.getParameter("sabumit") != null) {
			result = "No songs to print!!";			
		}
	}
	} else{
		if(request.getParameter("sabumit") != null) {
			result = "The movie name you entered does not exist!!!!!";			
		}
	}
}
%>
<p>
<%=result %>
</p>
</body>
</html>