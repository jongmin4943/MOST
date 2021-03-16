<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
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
			alert("선택된 회원이 없습니다.");
			return false;
		} else {
			var check = confirm(count+"명을 탈퇴 시키시겠습니까?");
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
<style type="text/css">
 a:link { color: red; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: underline;}
</style>
</head>
<body>
<jsp:include page="${initParam.navbar}"></jsp:include>
<form id="userList" action="delete.action">
<div style="margin:25px;">
	<div>
		<table style="margin-right:100px;">
			<tr>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>이름</td>
				<td>이메일</td>
				<td>가입일</td>
				<td>선택</td>
			</tr>
			<c:forEach items="${list}" var="user">
					<tr>
						<c:if test="${user.userID eq 'admin'}">
							<td><b>${user.userID}</b></td>
							<td><b>${user.userPassword}</b></td>
							<td><b>${user.userName}</b></td>
							<td><b>${user.userEmail}</b></td>
							<td><b>${user.joinedDate.substring(0,19)}</b></td>
							<td><b>운영자 입니다.</b></td>
						</c:if>
						<c:if test="${user.userID ne 'admin'}">
							<td>${user.userID}</td>
							<td>${user.userPassword}</td>
							<td>${user.userName}</td>
							<td>${user.userEmail}</td>
							<td>${user.joinedDate.substring(0,19)}</td>
							<td><input type="checkbox" name="selectedUser" value="${user.userID}" /></td>
						</c:if>
					</tr>
			</c:forEach>
			<tr>
				<td>총 회원수 : ${requestScope.total} 명</td>
				<td colspan="3"></td>
				<td colspan="2" style="text-align:right;">
					<input class="btn btn-info" id="selectAll" type="button" value="전체 선택"/>
					<input class="btn btn-info" id="unSelectAll" type="button" value="전체 선택 취소"/>
					<input class="btn btn-danger" type="submit" value="선택 탈퇴시키기"/>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<c:set var="page" value="${(param.p == null)?1:param.p}"/>
		<c:set var="startNum" value="${page-(page-1)%5}" />
		<c:set var="lastNum" value="${requestScope.cnt}"/>
		<div style="text-align: center">
			<c:if test="${startNum gt 1}">
				<a href="?p=${page-(page-1)%5-1}">이전</a>
			</c:if>
			
		 	<c:forEach begin="0" end="4" var="i">
		 		<c:if test="${startNum+i<=lastNum}">
		 			<c:if test="${page eq startNum+i }">
			 			<b style="color: blue;">[${startNum+i}]</b>
		 			</c:if>
		 			<c:if test="${page ne startNum+i }">
			 			<a href="?p=${startNum+i}">[${startNum+i}]</a>
		 			</c:if>
		 		</c:if>
		 	</c:forEach>
		 	
		 	<c:if test="${lastNum ge startNum+5}">
				<a href="?p=${startNum+5}">다음</a>
		 	</c:if>
		</div>
	</div>
</div>
</form>
	
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>