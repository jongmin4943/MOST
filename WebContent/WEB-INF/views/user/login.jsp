<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript">
var loginCheck = "${sessionScope.userID}";
if(!(loginCheck == "")) {
	alert('이미 로그인 상태입니다.');
	history.back();
}
loginCheck = "${requestScope.loginFail}";
if(!(loginCheck == "")) {
	alert('아이디나 비밀번호가 틀렸습니다.');
	history.back();
}

function checkValue(){
	var input = document.userInfo;
    if(!input.userID.value){
        alert("아이디를 입력하세요.");
        return false;
    }
    if(!input.userPassword.value){
        alert("비밀번호를 입력하세요.");
        return false;
    }
}
function goSignUpForm() {
	location.href="join.action";
}
function goForgotPwForm() {
	location.href="forgotPw.action";
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
<jsp:include page="${initParam.navbar}"></jsp:include>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="jumbotron" style="padding-top: 10px;">
					<form action="login.action" method="POST" name="userInfo"
						onsubmit="return checkValue()">
						<h3 style="text-align: center;">로그인</h3>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="ID"
								name="userID" maxlength="20">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="Password"
								name="userPassword" maxlength="20">
						</div>
						<input class="btn btn-primary btn-sm" type="submit" value="로그인"> 
						<input class="btn btn-primary btn-sm" type="button" value="회원가입" onclick="goSignUpForm()">
						<input class="btn btn-primary btn-sm" type="button" value="비밀번호 찾기" onclick="goForgotPwForm()">
					</form>
				</div>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>