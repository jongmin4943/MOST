<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.json.JSONObject"%>
<%@page import="api.server.NaverAPIreader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
    String title = request.getParameter("title");
	String album = request.getParameter("album");


        JSONObject jObj = NaverAPIreader.searchMovie(title, album);

        String imgUrl = "https://movie.naver.com/movie/bi/mi/photoViewPopup.nhn?movieCode="+jObj.get("link").toString().substring(jObj.get("link").toString().indexOf("code=", 1)+5, jObj.get("link").toString().length()); 
        System.out.println("imgUrl: "+imgUrl);

        Document imgLoc = Jsoup.connect(imgUrl).get();

        Element imgTag = imgLoc.body().getElementById("targetImage");

        System.out.print(imgTag);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Information</title>

</head>
<body>
	<div id="ex">
	
	</div>
	<div>
		<%=jObj %>
	</div>
	
	<div>
		<h2>Title: <%=jObj.get("title") %></h2>
		<h3>Title(ENG): <%=jObj.get("subtitle") %></h3>
		<hr />
		<h4>Directors: <%=jObj.get("director") %></h4>
		<h4>Actors: <%=jObj.get("actor") %></h4>
		<hr />
		<p>
			Image:
			<br />
			<%=imgTag %>
		</p>
	</div>
	<!-- <div>
		<img id="targetImage" style="width: 800px;" src="https://movie-phinf.pstatic.net/20150317_278/14265665566096Mg1U_JPEG/movie_image.jpg" alt="인서전트">
	</div> -->
</body>
</html>