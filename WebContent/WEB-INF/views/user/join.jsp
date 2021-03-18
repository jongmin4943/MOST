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
var duplicateCheck = false;
if(!(loginCheck == "")) {
	alert('이미 로그인 상태입니다.');
	history.back();
}
loginCheck = "${requestScope.exist}";
if(!(loginCheck == "")) {
	alert('이미 존재하는 아이디 입니다.');
	history.back();
}

function checkValue(){
	var input = document.userInfo;
	var emailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
    if(!input.userID.value){
        alert("아이디를 입력하세요.");
        return false;
    }
    if(!duplicateCheck){
        alert("아이디 중복체크가 완료 되지않았습니다.");
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

$(function(){
	$("#userID").keyup(function(){
		$.ajax({
			type: "POST",
			url: "duplicateCheck.action",
			data: { 
				userID: $(this).val()
			},
			success: function(data){
				var possible = JSON.parse(data).possible;
				if(possible == "short") {
					$("#showResult").css('color','red');
					$("#showResult").html("아이디는 최소 4자입니다.");
					$("#userID").focus();
					duplicateCheck = false;
				} else if (possible == "special") {
					$("#showResult").css('color','red');
					$("#showResult").html("아이디는 영어만 가능합니다.");
					$("#userID").focus();
					duplicateCheck = false;
				} else if (possible == "duplicate") {
					$("#showResult").css('color','red');
					$("#showResult").html("이미 존재하는 아이디");
					$("#userID").focus();
					duplicateCheck = false;
				} else {
					$("#showResult").css('color','blue');
					$("#showResult").html("사용 가능한 아이디");
					duplicateCheck = true;
				}
			}
		})
	});
});
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
					<form method="POST" action="join.action" name="userInfo" onsubmit="return checkValue()">
					<h3 style="text-align: center;">회원가입</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID" name="userID" maxlength="20" id="userID">
						<div id="showResult" style="text-align:right; text-shadow: none; color:gray">영어 4자 이상</div><!--아이디 중복체크 결과 넣기-->
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