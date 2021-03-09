<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
}
.userInfo{
	background-color:#f0f8ff;
}
</style>
<body>
<%
String navbarPath = "/subpage/navbar.jsp";
%>
<jsp:include page="<%=navbarPath %>"></jsp:include>
	<div class="container-fluid">
		<div class="row">
		<!--회원정보가 표시될곳  -->
			<div class="col-md-2">
				<div>
					<h1 style="text-align:center;">회원정보</h1>
				</div>
				<div>
					<h3 style="text-align:center;">~님 어서오세요</h3>
					<div class="userInfo">
						<p>OST 내공</p>
						<p>movie 내공</p>
					</div>
					<div>
						<img src="img/Ex1.jpg" class="img-thumbnail" width="300">
						표 올곳
					</div>
					<div>
						<a href="ost.action">OstList</a>
					</div>
				</div>
			</div>
		<!--회원정보 끝 메인시작  -->
			<div class="col-md-10">
				<div style="float:right; margin-top:12px;">
				<!-- 검색 -->
					<form action="#" method="get">
						<input type="search" id="search" name="search" placeholder="검색" maxlength="20" />
						<input class="btn btn-primary btn-sm" type="submit" value="검색" />
					</form>
				</div>
				<div>
					<h1>역대 최고 인기 OST</h1>
					<img src="img/Ex1.jpg" class="img-thumbnail" width="500">
					<img src="img/Ex2.jpg" class="img-thumbnail" width="500"> 
					<img src="img/Ex3.jpg" class="img-thumbnail" width="500">
				</div>
				<div>
					<h1>현재 상영작의 OST</h1>
					<div class="currentOST">
						<img src="img/Ex3.jpg" class="img-thumbnail" width="250">
						<h3>1번 ost</h3>
						<h3>2번 ost</h3>
						<h3>3번 ost</h3>
					</div>
					<div class="currentOST">
						<img src="img/Ex3.jpg" class="img-thumbnail" width="250">
						<h3>1번 ost</h3>
						<h3>2번 ost</h3>
						<h3>3번 ost</h3>
					</div>
					<div class="currentOST">
						<img src="img/Ex3.jpg" class="img-thumbnail" width="250">
						<h3>1번 ost</h3>
						<h3>2번 ost</h3>
						<h3>3번 ost</h3>
					</div>
					<div class="currentOST"> 
						<img src="img/Ex3.jpg" class="img-thumbnail" width="250">
						<h3>1번 ost</h3>
						<h3>2번 ost</h3>
						<h3>3번 ost</h3>
					</div>
					<div class="currentOST"> 
						<img src="img/Ex3.jpg" class="img-thumbnail" width="250">
						<h3>1번 ost</h3>
						<h3>2번 ost</h3>
						<h3>3번 ost</h3>
					</div>
					<div>
						<img src="img/Ex3.jpg" class="img-thumbnail" width="250">
						<h3>1번 ost</h3>
						<h3>2번 ost</h3>
						<h3>3번 ost</h3>
					</div>
				</div> 
			</div>
		<!--메인 끝  -->
		</div>
		
	</div>	
	
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>