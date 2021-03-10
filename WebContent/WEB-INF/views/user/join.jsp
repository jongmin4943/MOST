<%@page import="java.io.PrintWriter"%>
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
<%
String userID = null;
PrintWriter pr = response.getWriter();
if(session.getAttribute("userID") != null) {
	pr.print("<script>");
	pr.print("<alert('잘못된 접근입니다.')>");
	pr.print("<history.back()>");
	pr.print("</script>");
}
%>
<script type="text/javascript">
function checkValue(){
	var input = document.userInfo;
	var emailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
    if(!input.userID.value){
        alert("아이디를 입력하세요.");
        return false;
    }
    if(!input.userPassword.value){
        alert("비밀번호를 입력하세요.");
        return false;
    } else if (input.userPassword.value.length < 4) {
    	alert("비밀번호가 너무 짧습니다.(4자 이상)")
    	return false;
    }
    if(input.userPassword.value != input.userPasswordCheck.value ){
        alert("비밀번호를 동일하게 입력하세요.");
        return false;
    }
    if(!input.userName.value){
        alert("이름을 입력하세요.");
        return false;
    }
    if(!input.userEmail.value){
        alert("이메일을 입력하세요.");
        return false;
    } else if(!(emailCheck.test(input.userEmail.value))){
    	alert("이메일 형식이 틀렸습니다.")
    	return false;
    }
}
function goLogInForm() {
	location.href="login.action";
}
</script>
<style>
body{
	background-color:#e0f3f9;
}
.jumbotron{
	text-shadow: black 0.2em 0.2em 0.2em;
	color:white;
	background-color:#8dcaff;
}
</style>
<body>
<%
request.getContextPath();
String navbarPath = "/subpage/navbar.jsp";
%>
<jsp:include page="<%=navbarPath %>"></jsp:include>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="jumbotron" style="padding-top: 10px;">
					<form method="POST" action="join.action" name="userInfo" onsubmit="return checkValue()">
					<h3 style="text-align: center;">회원가입</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID" name="userID" maxlength="20" id="userID">
						<div id="showResult"></div><!--아이디 중복체크 결과 넣기-->
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="Password" name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="Confirm Password" name="userPasswordCheck" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Name" name="userName" maxlength="10">
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="Email Address" name="userEmail" maxlength="30">
					</div>
					<input class="btn btn-primary btn-sm" type="submit" value="회원가입"> 
					<input class="btn btn-primary btn-sm" type="button" value="취소" onclick="goLogInForm()">
				</form>
				</div>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>