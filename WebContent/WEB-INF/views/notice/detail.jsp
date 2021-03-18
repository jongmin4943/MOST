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
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
function goList() {
	location.href="list.action";
}
function deleteNotice() {
	if(confirm("정말 삭제 하시겠습니까?")){
		location.href="delete.action?no=${notice.no}";
	} else {
		return false;
	}
}
function goModify() {
	location.href="modify.action?no=${notice.no}";
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
					<h3 style="text-align: center;">공지 보기</h3>
					<table>
						<tr>
							<th style="width:8%; border-left:2px solid #369;">글번호</th>
							<td style="width:10%; border-left:1px solid #ccc;">${notice.no}</td>
							<th style="width:8%; border-left:2px solid #369;">작성일</th>
							<td style="width:25%; border-left:1px solid #ccc;">${notice.date.substring(0,19)}</td>
							<th style="width:8%; border-left:2px solid #369;">조회수</th>
							<td style="width:25%; border-left:1px solid #ccc;">${notice.hit}</td>
						</tr>
						<tr>
							<th style="border-left:2px solid #369;">제목</th>
							<td style="border-left:1px solid #ccc;" colspan="5">${notice.title}</td>
						</tr>
						<tr>
							<th>내용</th>
							<td style="border-left:1px solid #ccc;" colspan="5"><span style='white-space:pre-wrap; word_wrap:break-word; word-break: break-all;'>${notice.content}</span></td>
						</tr>
					</table>
					<div style="text-align: right; margin: 20px 5px;">
							<input class = "btn btn-info" type="button" value="목록" onclick="return goList()">
						<c:if test="${sessionScope.userID eq 'admin'}">
							<input class = "btn btn-info" type="button" value="수정" onclick="return goModify()">
							<input class = "btn btn-danger" type="button" value="삭제" onclick="return deleteNotice()">
						</c:if>
					</div>
				</div>
			</div>
	</div>
</div>




<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>