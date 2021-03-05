<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MOST</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery.js"></script>
</head>
<script type="text/javascript">
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
	location.href="join.jsp";
}
function goForgotPwForm() {
	location.href="forgotPw.jsp";
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
<!-- nav bar -->
	<nav class="navbar navbar-expand-sm bg-info navbar-dark">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp">M<em>ovie</em> OST</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="nav-item"><a class="nav-link" href="login.jsp">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="join.jsp">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>
<!-- end nav -->
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="jumbotron" style="padding-top: 10px;">
					<form method="post" action="signUpCheck.jsp" name="userInfo"
					onsubmit="return checkValue()">
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
					<input class="btn btn-primary btn-sm" type="button" value="취소" onclick="goSignInForm()">
				</form>
				</div>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
</body>
</html>