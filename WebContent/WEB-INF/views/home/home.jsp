<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MOST</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var musics = new Array(
		'${pageContext.request.contextPath}/music/Emile Mosseri, Han Ye-ri - Rain Song Minari (Original Motion Picture Soundtrack).mp3',
		'${pageContext.request.contextPath}/music/Naomi Scott - Speechless (from Aladdin) (Official Video).mp3',
		'${pageContext.request.contextPath}/music/La La Land Cast - Another Day of Sun.mp3'
		);

var minari = new Audio(musics[0]);
var aladdin = new Audio(musics[1]);
var lalaland = new Audio(musics[2]);
$(function(){
	$("#0music").mouseover(function(){minari.play()});
	$("#0music").mouseleave(function(){minari.pause(); minari.currentTime = 0;});
	$("#1music").mouseover(function(){aladdin.play()});
	$("#1music").mouseleave(function(){aladdin.pause(); aladdin.currentTime = 0;});
	$("#2music").mouseover(function(){lalaland.play()});
	$("#2music").mouseleave(function(){lalaland.pause(); lalaland.currentTime = 0;});
});
</script>
</head>

<style>
body{
	background-color:#e0f3f9;
}
.currentOST{
	float:left;
	width: 31%;
	margin: 10px;
	padding: 15px;
	max-height: 1000px;
	overflow: hidden;
}
.userInfo{
	border-radius:8px;
	background-color:#f0f8ff;
	text-align: center;
	vertical-align: middle;
}
.weeklyOST{
	max-height: 900px;
	float:left;
	overflow: hidden;
	text-align: center;
}
.top3{
	float:left;
	max-width: 30%;
	max-height: 700px;
	min-height: 500px;
	overflow: hidden;
	margin: 0 15px 15px 15px;
}
.top3_list{
	min-height: 550px;
}
.top3 img{
	max-width: 88%;
}
.weeklyOST img{
	max-width: 70%;
}
.sidebar {
	width: 100%;
	background:#c0e4e4;
}
.sa {
	font-weight: bold;
}
.likeNum {
	font-size: 30px;
	font-weight: 600;
	color: blue;
}
</style>

<body>
<jsp:include page="${initParam.navbar}"></jsp:include>
	<div class="container-fluid">
		<div class="row">
		<!--회원정보가 표시될곳  -->
			<div class="col-md-2 sidebar">
				<div>
					<h1 style="text-align:center;">회원정보</h1>
				</div>
				<div>
					<c:choose>
						<c:when test="${empty sessionScope.userID}">
							<h3 style="text-align:center;"><a class="btn btn-success" href="${pageContext.request.contextPath}/user/login.action">로그인</a></h3>							
						</c:when>
						<c:when test="${not empty sessionScope.userID}">
							<h3 style="text-align:center;">${sessionScope.userID}님</h3>
							<h5 style="text-align:center;">어서오세요</h5>							
							<div class="userInfo">
								<p>나의 ost 내공 : ${requestScope.cnt} 점</p>
							</div>
						</c:when>
					</c:choose>
					<div>
						<div>
							<img src="../img/Ex1.jpg" class="img-thumbnail" width="300">
							<hr>
						</div>
						<div>
							<h3>Recent Notice</h3>
							<table style="width: 100%">
							<c:forEach items="${requestScope.Notices}" var="notice" varStatus="vs">
								<tr>
									<th style="width: 5%">${vs.count}.</th>
									<td style="width: 56%"><a href="${pageContext.request.contextPath}/notice/detail.action?no=${notice.no}">${notice.title}</a></td>
									<td style="width: 40%; text-align: right">${notice.date.substring(0,11)}</td>
								</tr>
							</c:forEach>
							</table>
						</div>
						<div style="text-align:right;">
							<a href="${pageContext.request.contextPath}/notice/list.action">전체 목록으로</a>
						</div>
					</div>
				</div>
			</div>
			
			
		<!--회원정보 끝 메인시작  -->
			<div class="col-md-10">
			<!-- 검색창 -->
				<jsp:include page="${initParam.searchbar}"></jsp:include>	
				
							
				<h1>역대 <span style="color:RED;">최고</span> 인기 OST</h1>
				<div id="top3Wrap" style="text-align:center; overflow: hidden;">
					<c:forEach var="i" begin="0" end="2">
						<div id="${i}music" class="top3">
							<c:if test="${i eq 0}">
								<span style="font-size:50px; font-weight: 700">🥇</span>
								<span style="font-size:40px; font-weight: 600; color: gold">${top3Likes[i]}</span><span style="font-size:20px; font-weight: 500">likes</span><br>
								<span style="font-weight: bold; font-size: 17px;">${i+1}위!</span><span style="font-weight: bold; font-size: 20px;"> ${top3Names[i]}</span>
							</c:if>
							<c:if test="${i eq 1}">
								<span style="font-size:50px; font-weight: 700">🥈</span>
								<span style="font-size:40px; font-weight: 600; color: #cccccc">${top3Likes[i]}</span><span style="font-size:20px; font-weight: 500">likes</span><br>
								<span style="font-weight: bold; font-size: 17px;">${i+1}위!</span><span style="font-weight: bold; font-size: 20px;"> ${top3Names[i]}</span>
							</c:if>
							<c:if test="${i eq 2}">
								<span style="font-size:50px; font-weight: 700">🥉</span>
								<span style="font-size:40px; font-weight: 600; color: #f7894a">${top3Likes[i]}</span><span style="font-size:20px; font-weight: 500">likes</span><br>
								<span style="font-weight: bold; font-size: 17px;">${i+1}위!</span><span style="font-weight: bold; font-size: 20px;"> ${top3Names[i]}</span>
							</c:if>	
							<div class="top3_list">
								${top3Imgs[i]}
							</div>	
						</div>
					</c:forEach>
				</div>
				
				
				<div>
					<h1>오늘의 <span style="color:RED;">HOT</span> OST</h1>
					<div class="weeklyOST"> <!-- 윗줄 -->
						<c:forEach var="i" begin="0" end="2">
							<div class="currentOST">
								<span class="sa">${i+1}위.</span> <span class="likeNum">${hot6Likes[i]}</span><span class="sa"> likes</span>
								<div class="movieImg"> <!-- 사진 div -->
									${hot6Imgs[i]}
								</div>
								<div> <!-- ost목록 div  -->
									<h4>:::::::Ost title:::::::</h4> 
									<h6>${hot6Names[i]}</h6>
									<h4>:::::::Artist(s):::::::</h4>
									<h6>${hot6Artists[i]}</h6>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="weeklyOST"> <!-- 아랫줄 -->
						<c:forEach var="i" begin="3" end="5">
							<div class="currentOST">
								<span class="sa">${i+1}위.</span> <span class="likeNum">${hot6Likes[i]}</span><span class="sa"> likes</span>
								<div class="movieImg"> <!-- 사진 div -->
									${hot6Imgs[i]}
								</div>
								<div> <!-- ost목록 div  -->
									<h4>:::::::Ost title:::::::</h4> 
									<h6>${hot6Names[i]}</h6>
									<h4>:::::::Artist(s):::::::</h4>
									<h6>${hot6Artists[i]}</h6>
								</div>
							</div>
						</c:forEach>
					</div>
				</div> 
			</div>
		</div>
	</div>	
	
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>