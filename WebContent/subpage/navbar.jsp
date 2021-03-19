<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta charset="UTF-8">
<style>
.modalHead {
	display: inline-block;
	vertical-align: middle;
}
.modalNo {
	margin-left: 5px;
	width: 3%;
}
.modalTitle {
	width: 35%;
}
.modalArtist {
	width: 17%;
}
.modalMovie {
	width: 34%;
}
.modalDate {
	width: 8%;
}
.mh{
	color: #153d73;
	font-weight: bold;
}
</style>
<script type="text/javascript">
doubleCheck = () => {
	var check =	confirm('모든 정보가 삭제됩니다. 정말 탈퇴 하시겠습니까?');
	if(check) {
		location.href="user/delete.action";
	} else {
		return false;
	}
}
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
				<div class="modal-header" style="text-align: left;">
					<h4 class="modal-title">${sessionScope.userID}님의OST list</h4>
				</div>
				<div class="modal-body">
					<div style="text-align: center;">총 <b>${applicationScope.userChoice.size()}개</b>의 list</div>
					<div style="border-collapse: collapse; text-align: left; width:100%; border: 1px solid #ccc; border-left: 3px solid #369; ">
						<div style="border-bottom: 1px solid #ccc;">
							<div class="modalHead modalNo mh">No</div>
							<div class="modalHead modalTitle mh">Title</div>
							<div class="modalHead modalArtist mh">Artist</div>
							<div class="modalHead modalMovie mh">Movie</div>
							<div class="modalHead modalDate mh">Date</div>
						</div>
						<c:forEach items="${applicationScope.userChoice}" var="choice"
							varStatus="vs">
							<div>
								<div class="modalHead modalNo">${vs.count}.</div>
								<div class="modalHead modalTitle"><a href="https://www.youtube.com/results?search_query=${applicationScope.eon[vs.index]}" target="_blank">${choice.ostName}</a></div>
								<div class="modalHead modalArtist">${choice.artist}</div>
								<div class="modalHead modalMovie">${choice.movieTitle}</div>
								<div class="modalHead modalDate">${choice.likedDate.substring(0,11)}</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>