<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 작성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var adminCheck = ${sessionScope.userID};
if(adminCheck != 'admin') {
	alert("잘못된 접근!");
	location.href="list.action";
}
function checkValue(){
	var input = document.board;
    if(!input.title.value){
        alert("제목을 입력하세요.");
        return false;
    }
    if(!input.content.value){
        alert("내용을 입력하세요.");
        return false;
    }
}
function goList() {
	location.href="list.action";
}
</script>

<style type="text/css">
body{
	background-color:#e0f3f9;
}
</style>
</head>
<body>
<jsp:include page="${initParam.navbar}"></jsp:include>
<div class="container">
	<div class="row">
			<div class="col-md-12">
				<div class="jumbotron" style="vertical-align: center;">
					<form action="write.action" method="POST" name="board" onsubmit="return checkValue()">
						<h3 style="text-align: center;">공지 작성</h3>
						<table>
							<tr>
								<th style="width:10%">제목</th>
								<td><input type="text" maxlength="40" id="title" name="title" style="width:100%"></td>
							</tr>
							<tr>
								<th style="width:10%">내용</th>
								<td><textarea maxlength="2040" id="content" name="content" style="width:100%; resize: none" rows="20" ></textarea></td>
							</tr>
						</table>
						<div style="text-align: right; margin: 20px 5px;">
							<input class = "btn btn-info" type="submit" value="작성">
							<input class = "btn btn-danger" type="button" value="취소" onclick="return goList()">
						</div>
					</form>
				</div>
			</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>