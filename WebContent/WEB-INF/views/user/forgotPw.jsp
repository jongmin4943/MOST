<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOST</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery.js"></script>
</head>
<script type="text/javascript">
	function checkValue(){
		var emailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		var input = document.userInfo;
			if(!input.userID.value){
                alert("아이디를 입력하세요.");
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
<!-- nav bar -->
	<nav class="navbar navbar-expand-sm bg-info navbar-dark">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="${pageContext.request.contextPath}">M<em style="color: #0037ffa1;">ovie</em> OST</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="nav-item"><a class="nav-link" href="login.action">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="join.action">회원가입</a></li>
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
					<form action="confirmUser.jsp" method="GET" name="userInfo" onsubmit="return checkValue()">
					<h3 style="text-align: center;">비밀번호 찾기</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Name" name="userName" maxlength="10">
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="Email Address" name="userEmail" maxlength="50">
					</div>
					<input class="btn btn-primary btn-sm" type="submit" value="비밀번호 찾기"> 
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