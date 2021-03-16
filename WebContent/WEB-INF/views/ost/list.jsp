<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MOST</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/table.css">
<style type="text/css">
.commentArea {
	border: 1px solid #bcbcbc;
	overflow:auto;
	border-left: 3px solid #369;
	
}
#commentHeader {
	overflow:auto;
	border-bottom:1px solid #bcbcbc;
	font-weight: bold;
}
.commentDetail {
	overflow:auto;
	/* border-bottom:1px solid #bcbcbc; */
	margin: 4px 0px;
}
.cID {
	width: 15%;
	float: left;
	margin-left: 6px;
}
.cContent {
	width: 53%;
	float: left;
}
.cDate {
	width: 15%;
	float: right;
}
.cOption {
	width: 15%;
	float: left;
}

.ost :hover {
	background-color: #ddd;
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery.js"></script>
<script>
var contextPath = "${pageContext.request.contextPath}";
var flag = false;
var flag2 = false;
var no = 1;
var guestID = "${sessionScope.userID}";

$(function() {
	$(document).ready(function() {
	    $(".ost").click(function() {
	    	var imgUrl = null;
	    	if(!flag2) {
	    		flag2 = true;
		    	var idx = $(this).attr("data-movie-no");
		    	var likeBtn = $(this).children().eq(3);
		    	var encodedAlbum = encodeURIComponent($(this).children().eq(2).text());
		    	var encodedTitle = encodeURIComponent($(this).children().eq(0).text());
		    	var commentOfOst = $(this).children().eq(0).text().substring(0, $(this).children().eq(0).text().indexOf("("));
		    	$.get("listMovie.action?album="+encodedAlbum+"&title="+encodedTitle, function(data,status) {
					var movie = JSON.parse(data.trim());
					var movDir = movie.director.replace(/\|/g, ", ");
					var movActors = movie.actor.replace(/\|/g, ", ");
					movDir.trim();
					movActors.trim();
					movDir = movDir.substring(0,movDir.length-2);
					movActors = movActors.substring(0, movActors.length-2);
					var start = "<tr><th style='width: 120px;'></th><th>Detail</th></tr><tr><th scope='row'>제목</th><td>"+movie.title+"</td></tr>";
					start += "<tr><th scope='row'>감독</th><td>" +movDir + "</td></tr>";
					start += "<tr><th scope='row'>주연배우</th><td>"+movActors+ "</td></tr>";
					start += "<tr><th scope='row'>평점</th><td>"+movie.userRating+ "</td></tr>";
					start = start.replace(/<b>/gi, "");
					start = start.replace(/<\/b>/gi, "");
					imgUrl = encodeURIComponent(movie.imgSrc[0]);
					$("#movie").html(start);
					$("#movieImg").html(movie.imgSrc[0]);
					$("#ostComment").html(commentOfOst+"의 댓글");
					likeBtn.html("<a>❤ </a>0");
		    	});
		    	flag2 = false;
	    	}
	    	
	    	var artist = encodeURIComponent($(this).children().eq(1).text());
	    	var encodedUserID = encodeURIComponent(guestID);
		    $(this).children().eq(3).click(function(){
		    	if(guestID == 'null' || guestID == "") {
					var c = confirm('로그인 하시겠습니까?.');
					if(c) {
						location.href = contextPath+'/user/login.action';
						return false;
					}
		    	} else {
			    	$.get("listLike.action?title="+encodedTitle+"&artist="+artist+"&album="+encodedAlbum+"&imgSrc="+imgUrl+"&userID="+encodedUserID, function(data,status) {
			    		alert("Successfully added to " +guestID+ "'s liked list!");
			    	});
			    	return false;
		    	}
		    });
	    });
	});
})
	function addLike(pushed){
		console.log("Clicked!!");
		
		return false;
	}
</script>
<script src="${pageContext.request.contextPath}/js/comment.js"></script>
</head>
<body>
	<jsp:include page="${initParam.navbar}"></jsp:include>
	<div class="container-fulid pt-2">
		<div class="row">
			<div class="col-lg-1"></div>
			<!-- 왼쪽 컨테이너 -->
			
			<div class="col-lg-4">
				<div>
					<h2>MovieInfo</h2>
				</div>
				<div id="movieImg" style="text-align: center;">
					<img src="${pageContext.request.contextPath}/img/Ex1.jpg" class="img-thumbnail" width="100%">
				</div>
				
				<table id="movie">
					<tr>
						<th style="width: 120px;"></th>
						<th>Detail</th>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td>내용이 들어갑니다.</td>
					</tr>
					<tr>
						<th scope="row">감독</th>
						<td>내용이 들어갑니다.</td>
					</tr>
					<tr>
						<th scope="row">주연배우</th>
						<td>내용이 들어갑니다.</td>
					</tr>
					<tr>
						<th scope="row">평점</th>
						<td>내용이 들어갑니다.</td>
					</tr>
				</table>
			</div>
			<!-- 오른쪽 컨테이너 -->
			<div class="col-xl-6">
				<div>
					<!-- 검색창 -->
					<jsp:include page="${initParam.searchbar}"></jsp:include>
					<div>
						<h2>Ost List</h2>
					</div>
					<div></div>
					<table id="ostList">
						<tr>
							<th style="width: 34%;">Ost Title</th>
							<th style="width: 20%;">Artist</th>
							<th style="width: 34%;">Movie Title</th>
							<th style="width: 10%;">Likes</th>
						</tr>
						<c:if test="${empty requestScope.list}">
							<tr>
								<td colspan=4 style="text-align: center">
									<h2>No songs searched!</h2>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${requestScope.list}" var="outer" varStatus="vs">
							<tr class="ost" data-movie-no="${vs.index}">
								<td class="title${vs.index}">${outer[0]}</td>
								<td class="artist${vs.index}">${outer[1]}</td>
								<td class="album${vs.index}">${outer[2]}</td>
								<td class="likeBtn">0</td>
								
							</tr>
						</c:forEach>
					</table>
				</div>
				<div align="center">
					<span class="btn btn-prev" onclick="alert('이전 페이지가 없습니다')">이전</span>
					<span class="btn btn-next" onclick="alert('다음 페이지가 없습니다')">다음</span>
				</div>
				<div id="ostComment" style="text-align: center;">
					~OST 의 댓글
				</div>
				<!-- ost 클릭시 해당 ost의 이름값과 번호가 필요하다. -->
				<div class = "commentArea">
					<div>
						<div id = "commentHeader">
							<div class="cID">
								<span>작성자</span>
							</div>
							<div class="cContent">
								<span>내용</span>
							</div>
							<div class="cDate">
								<span>작성날짜</span>
							</div>
						</div>
					</div>
					<div id = "comment">
					<!--코멘트 반복  -->
					</div>
					<!--댓글 작성 해당 ost가 db안에 들어있으면 나오게 바궈야한다.-->
					<div id = "commentWrite" style="margin-left:5px;">
						<form action="" method="POST">
							<textarea id="textarea" style="width:85%; resize: none; float: left;" maxlength="1000"></textarea>
							<input class="btn btn-primary cBtn" type="button" value="댓글등록" style="margin:7px 0 0 4px">
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>