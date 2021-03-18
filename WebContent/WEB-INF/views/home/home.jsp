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
</head>

<style>
body{
	background-color:#e0f3f9;
}
.currentOST{
	float:left;
	width: 30%;
	margin: 15px;
	padding: 15px;
	max-height: 700px;
	overflow: hidden;
}
.userInfo{
	border-radius:8px;
	background-color:#f0f8ff;
	text-align: center;
	vertical-align: middle;
}
.movieImg{
	text-align: center;
}
.weeklyOST{
	margin-top : 300px;
}
.top3{
	float:left;
	max-width: 30%;
	max-height: 700px;
	min-height: 400px;
	overflow: hidden;
	margin: 20px;
}
.top3_list{
	min-height: 700px;
}
img{
	max-width: 100%;
}
.top3Det {
	max-width: 300px;
	text-align: left;
	margin-left: 100px; 
}
.sidebar {
	width: 100%;
	background:#c0e4e4;
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
									<td style="width: 65%"><a href="${pageContext.request.contextPath}/notice/detail.action?no=${notice.no}">${notice.title}</a></td>
									<td style="width: 30%">${notice.date.substring(0,11)}</td>
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
				<div id="top3Wrap" style="text-align:center">
					<div class="top3">
						<h1 style="text-align: center;">🥇 ${top3Likes[0]} likes</h1><b>1위! ${top3Names[0]}</b>	
						<div class="top3_list">
							${top3Imgs[0]}
						</div>	
					</div>
					<div class="top3">
						<h1 style="text-align: center;">🥈 ${top3Likes[1]} likes</h1><b>2위! ${top3Names[1]}</b>
						<div class="top3_list">
							${top3Imgs[1]}			
						</div>
					</div>
					<div class="top3">
						<h1 style="text-align: center;">🥉 ${top3Likes[2]} likes</h1><b>3위! ${top3Names[2]}</b>
						<div class="top3_list">
							${top3Imgs[2]}
						</div>
					</div>
				</div>
				<div>
					<div class="weeklyOST"> <!-- 윗줄 -->
					<h1>이번주 <span style="color:RED;">HOT</span> OST</h1>
						<div class="currentOST">
							<h2>${hot6Likes[0]} likes</h2>
							<div class="movieImg"> <!-- 사진 div -->
								${hot6Imgs[0]}
							</div>
							<div> <!-- ost목록 div  -->
								<h4>Ost title:</h4> 
								<h6>${hot6Names[0]}</h6>
								<h4>Artist(s):</h4>
								<h6>${hot6Artists[0]}</h6>
							</div>
						</div>
						<div class="currentOST">
							<h2>${hot6Likes[1]} likes</h2>
							<div class="movieImg"> <!-- 사진 div -->
								${hot6Imgs[1]}
							</div>
							<div> <!-- ost목록 div  -->
								<h4>Ost title:</h4> 
								<h6>${hot6Names[1]}</h6>
								<h4>Artist(s):</h4>
								<h6>${hot6Artists[1]}</h6>
							</div>
						</div>
						<div class="currentOST">
							<h2>${hot6Likes[2]} likes</h2>
							<div class="movieImg"> <!-- 사진 div -->
								${hot6Imgs[2]}
							</div>
							<div> <!-- ost목록 div  -->
								<h4>Ost title:</h4> 
								<h6>${hot6Names[2]}</h6>
								<h4>Artist(s):</h4>
								<h6>${hot6Artists[2]}</h6>
							</div>
						</div>
					</div>
					<div><!-- 아랫줄 -->
						<div class="currentOST">
							<h2>${hot6Likes[3]} likes</h2>
							<div class="movieImg"> <!-- 사진 div -->
								${hot6Imgs[3]}
							</div>
							<div> <!-- ost목록 div  -->
								<h4>Ost title:</h4> 
								<h6>${hot6Names[3]}</h6>
								<h4>Artist(s):</h4>
								<h6>${hot6Artists[3]}</h6>
							</div>
						</div>
						<div class="currentOST">
							<h2>${hot6Likes[4]} likes</h2>
							<div class="movieImg"> <!-- 사진 div -->
								${hot6Imgs[4]}
							</div>
							<div> <!-- ost목록 div  -->
								<h4>Ost title:</h4> 
								<h6>${hot6Names[4]}</h6>
								<h4>Artist(s):</h4>
								<h6>${hot6Artists[4]}</h6>
							</div>
						</div>
						<div class="currentOST">
							<h2>${hot6Likes[5]} likes</h2>
							<div class="movieImg"> <!-- 사진 div -->
								${hot6Imgs[5]}
							</div>
							<div> <!-- ost목록 div  -->
								<h4>Ost title:</h4> 
								<h6>${hot6Names[5]}</h6>
								<h4>Artist(s):</h4>
								<h6>${hot6Artists[5]}</h6>
							</div>
						</div>
					</div>
				</div> 
			</div>
		</div>
	</div>	
	
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>