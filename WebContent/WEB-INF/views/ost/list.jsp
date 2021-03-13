<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.cID {
	max-width: 150px;
	width:100%;
	margin : 10px;
	float: left;
}
.cContent{
	max-width: 550px;
	width: 100%;
	margin : 10px;	
	float: left;
}
.cDate{
	max-width: 100px;
	width: 100%;
	margin : 10px;
	float: left;
}
</style>
<script src="https://code.jquery.com/jquery.js"></script>
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
				<img src="${pageContext.request.contextPath}/img/Ex1.jpg" class="img-thumbnail" width="450">
				<table>
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
					<table>
						<tr>
							<th>Ost Title</th>
							<th>Artist</th>
							<th>Movie Title</th>
							<th style="width: 55px;">Likes</th>
						</tr>
						<tr>
							<td>Alfreds Futterkiste</td>
							<td>Maria Anders</td>
							<td>Maria Anders</td>
							<td>999</td>
						</tr>
						<tr>
							<td>Berglunds snabbköp</td>
							<td>Christina Berglund</td>
							<td>Christina Berglund</td>
							<td>888</td>
						</tr>
						<tr>
							<td>Centro comercial</td>
							<td>Francisco Chang</td>
							<td>Francisco Chang</td>
							<td>777</td>
						</tr>
						<tr>
							<td>Ernst Handel</td>
							<td>Roland Mendel</td>
							<td>Roland Mendel</td>
							<td>666</td>
						</tr>
						<tr>
							<td>Island Trading</td>
							<td>Helen Bennett</td>
							<td>Helen Bennett</td>
							<td>555</td>
						</tr>
					</table>
				</div>
				<div align="center">
					<span class="btn btn-prev" onclick="alert('이전 페이지가 없습니다')">이전</span>
					<span class="btn btn-next" onclick="alert('다음 페이지가 없습니다')">다음</span>
				</div>
				<!-- ost list 끝 댓글 시작 -->
				<hr/>
				<div class = "commentArea">
					<div class = "commentTitle">
						<div>댓글</div>
					</div>
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
					<div>
						<div class = "commentDetail">
							<span class="cID">윤종민</span>
							<span class="cContent">이 노래 진짜 좋아연</span>
							<span class="cDate">2021-03-13</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>