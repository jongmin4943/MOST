<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function checkValue(){
	var input = document.userInfo;
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
}
function goLoginForm() {
	location.href="login.action";
}
</script>
<body>
<%
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
					<form action="resetPw.action" method="POST" name="userInfo"
						onsubmit="return checkValue()">
						<h3 style="text-align: center;">비밀번호 변경</h3>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="new Password"
								name="userPassword" maxlength="20">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="confirm Password"
								name="userPasswordCheck" maxlength="20">
						</div>
						<input class="btn btn-primary btn-sm" type="submit" value="비밀번호 바꾸기"> 
						<input class="btn btn-primary btn-sm" type="button" value="취소" onclick="goLoginForm()">
					</form>
				</div>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>