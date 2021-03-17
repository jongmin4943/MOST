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
	margin-top : 25px;
}
.top3{
	display: inline-block;
}
.top3_list {
	max-width: 300px;
	margin: 0 50px;
	max-height: 400px;
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
						<img src="../img/Ex1.jpg" class="img-thumbnail" width="300">
						<hr>
						<h3>Recent Notice</h3>
						<table style="width: 100%">
							<tr>
								<th>1.</th>
								<td><a href="#">세번째 공지글</a></td>
							</tr>
							<tr>
								<th>2.</th>
								<td><a href="#">두번째 공지글</a></td>
							</tr>
							<tr>
								<th>3.</th>
								<td><a href="#">첫번째 공지글</a></td>
							</tr>
						</table>
					</div>
					<div style="text-align: right;">
						<a href="${pageContext.request.contextPath}/notice/list.action">공지사항 게시판</a>
					</div>
				</div>
			</div>
		<!--회원정보 끝 메인시작  -->
			<div class="col-md-10">
			<!-- 검색창 -->
				<jsp:include page="${initParam.searchbar}"></jsp:include>				
				<h1>역대 최고 인기 OST</h1>
				<div id="top3Wrap" style="text-align:center">
					<div class="top3">
						<h1 style="text-align: center;">🥇 ${top3Likes[0]} likes</h1>1위!! ${top3Names[0]}	
						<div class="top3_list" style="text-align: center">
							<a href="https://www.youtube.com/results?search_query=${top3EncodedNames[0]}" > ${top3Imgs[0]}</a>
						</div>	
					</div>
					<div class="top3">
						<h1 style="text-align: center;">🥈 ${top3Likes[1]} likes</h1>2위!! ${top3Names[1]}
						<div class="top3_list" style="text-align: center">
							<a href="https://www.youtube.com/results?search_query=${top3EncodedNames[1]}" > ${top3Imgs[1]}</a>				
						</div>
					</div>
					<div class="top3">
						<h1 style="text-align: center;">🥉 ${top3Likes[2]} likes</h1>3위!! ${top3Names[2]}
						<div class="top3_list" style="text-align: center">
							<a href="https://www.youtube.com/results?search_query=${top3EncodedNames[2]}" > ${top3Imgs[2]}</a>
						</div>
					</div>
				</div>
				<br />
				<div>
					<div class="weeklyOST"> <!-- 윗줄 -->
					<h1>이번주 HOT OST</h1>
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