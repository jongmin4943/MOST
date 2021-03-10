<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%
String userID = null;
if(session.getAttribute("userID") != null) {
	userID = (String)session.getAttribute("userID");
}
%>
<script type="text/javascript">
doubleCheck = () => {
	var check =	confirm('모든 정보가 삭제됩니다. 정말 탈퇴 하시겠습니까?');
	if(check) {
		location.href="user/delete.action";
	} else {
		return false;
	}
}

</script>
<title>Insert title here</title>
<!-- nav bar -->
	<nav class="navbar navbar-expand-sm bg-info navbar-dark">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="${pageContext.request.contextPath}">M<em style="color: #0037ffa1;">ovie</em> OST</a>
			</div>
			<div>
			<%if(userID == null) {%>
				<ul class="nav navbar-nav">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/login.action">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/join.action">회원가입</a></li>
				</ul>
			<%} else { %>
			<ul class="nav navbar-nav">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/logout.action">로그아웃</a></li>
				<li class="nav-item"><a class="nav-link" onclick="doubleCheck()">회원탈퇴</a></li>
			</ul>
			<%} %>
			</div>
		</div>
	</nav>
<!-- end nav -->