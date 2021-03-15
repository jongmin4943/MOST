<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">

<script src="https://code.jquery.com/jquery.js"></script>
</head>
<script type="text/javascript">
</script>
<body>
<jsp:include page="${initParam.navbar}"></jsp:include>
<table>
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>이메일</td>
		<td>메뉴</td>
	</tr>
	<c:forEach items="${list}" var="user">
		<c:if test="${user.userID ne 'admin'}">
			<tr>
				<td>${user.userID}</td>
				<td>${user.userPassword}</td>
				<td>${user.userName}</td>
				<td>${user.userEmail}</td>
				<td><a href="delete.action?userID=${user.userID}" onclick="return confirm('정말 탈퇴 시키시겠습니까?')">탈퇴시키기</a></td>
			</tr>
		</c:if>
	</c:forEach>

</table>
	
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>