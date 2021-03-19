<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 
<meta charset="UTF-8">
<script type="text/javascript">
doubleCheck = () => {
	var check =	confirm('모든 정보가 삭제됩니다. 정말 탈퇴 하시겠습니까?');
	if(check) {
		location.href="user/delete.action";
	} else {
		return false;
	}
}
$(function(){
	$("#ex1").hide();
	$("#onBtn").click(function(){
		$("#ex1").fadeIn();
	});
	
})
</script>
<!-- nav bar -->
	<nav class="navbar navbar-expand-sm bg-info navbar-dark">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="${pageContext.request.contextPath}">M<em style="color: #0037ffa1;">ovie</em> OST</a>
			</div>
			<div>
			<c:choose>
				<c:when test="${sessionScope.userID eq 'admin'}">
				<ul class="nav navbar-nav">
					<li class="nav-item nav-link" data-toggle="modal" data-target="#myModal">나의 OSTs</li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list.action">회원관리</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/notice/list.action">공지관리</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/logout.action">로그아웃</a></li>
				</ul>
				</c:when>
				
				<c:when test="${empty sessionScope.userID}">
					<ul class="nav navbar-nav">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/login.action">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/join.action">회원가입</a></li>
					</ul>
				</c:when>
				
				<c:otherwise>
					<ul class="nav navbar-nav">
						<li class="nav-item nav-link" data-toggle="modal" data-target="#myModal">나의 OSTs</li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/logout.action">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" onclick="doubleCheck()">회원탈퇴</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</nav>
<!-- end nav -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-xl">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="text-align:left;">
          <h4 class="modal-title" >${sessionScope.userID}님의 OST list</h4>
        </div>
        <div class="modal-body">
        <table border="1">
        	<tr>
        		<th>Title</th>
        		<th>Artist</th>
        		<th>Date</th>
          	</tr>
          <c:forEach items="${applicationScope.userChoice}" var="choice">
          	<tr>
          		<td>${choice.ostName}</td>
          		<td>${choice.artist}</td>
          		<td>${choice.likedDate}</td>
          	</tr>
          </c:forEach>        
        </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>