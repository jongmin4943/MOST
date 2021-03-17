<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 게시판</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$("#userList").submit(function() { 
		var count = 0;
		$('input[type="checkbox"]:checked').each(function() {
	        count++;
		});
		if(count == 0) {
			alert("선택된 글이 없습니다.");
			return false;
		} else {
			var check = confirm(count+"개의 공지글을 삭제 하시겠습니까?");
			if(!check) {
				return false;
			} else {
				this.method="POST";
				this.action="delete.action";
				this.submit();
			}
		}
	});
	$("#selectAll").click(function(){
		$('input[type="checkbox"]').prop('checked', true);
	});
	$("#unSelectAll").click(function(){
		$('input[type="checkbox"]').prop('checked', false);
	});
})
</script>
</head>
<body>
<jsp:include page="${initParam.navbar}"></jsp:include>
<div style="margin:25px;">
	<div>
		<table style="margin-right:100px;">
			<tr>
			<c:if test="${sessionScope.userID eq 'admin'}">
				<td style="width: 10%;">번호</td>
				<td style="width: 45%;">제목</td>
				<td style="width: 20%;">작성일</td>
				<td style="width: 15%;">조회수</td>
				<td style="width: 5%;">선택</td>
			</c:if>
			<c:if test="${sessionScope.userID ne 'admin'}">
				<td style="width: 10%;">번호</td>
				<td style="width: 50%;">제목</td>
				<td style="width: 20%;">작성일</td>
				<td style="width: 15%;">조회수</td>
			</c:if>
			</tr>
			
			<tr>
				<td>1</td>
				<td><a href="#">첫 공지글입니다</a></td>
				<td>2021-03-18</td>
				<td>1</td>
			<c:if test="${sessionScope.userID eq 'admin'}">
				<td><input type="checkbox" name="selectedBoard" value="" /></td>
			</c:if>
			</tr>			
			
			
			<c:if test="${sessionScope.userID eq 'admin'}">
				<tr>
					<td><input class="btn btn-info" type="button" value="글쓰기" id="write"></td>
					<td colspan="1"></td>
					<td colspan="3" style="text-align:right;">
						<input class="btn btn-info" id="selectAll" type="button" value="전체 선택"/>
						<input class="btn btn-info" id="unSelectAll" type="button" value="전체 선택 취소"/>
						<input class="btn btn-danger" type="submit" value="선택 삭제하기"/>
					</td>
				</tr>
			</c:if>
		</table>
	</div>
</div>	
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>