<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MOST</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery.js"></script>

</head>
<body>
<%
request.getContextPath();
String navbarPath = "/subpage/navbar.jsp";
%>
<jsp:include page="<%=navbarPath %>"></jsp:include>
<div class="container">
	<div class="row">
	<!-- 왼쪽 컨테이너 -->
		<div class="col-lg-6">
			<div>MovieInfo</div>
		</div>
	<!-- 오른쪽 컨테이너 -->
		<div class="col-lg-6">
			<div>Ost List</div>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>