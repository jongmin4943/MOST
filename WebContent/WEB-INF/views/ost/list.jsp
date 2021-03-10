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
<script src="https://code.jquery.com/jquery.js"></script>
</head>
<body>
	<%
	String navbarPath = "/subpage/navbar.jsp";
	String searchbarPath = "/subpage/searchbar.jsp";
	%>
	<jsp:include page="<%=navbarPath%>"></jsp:include>
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
					<jsp:include page="<%=searchbarPath %>"></jsp:include>
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
						<tr>
							<td>Königlich Essen</td>
							<td>Philip Cramer</td>
							<td>Philip Cramer</td>
							<td>444</td>
						</tr>
						<tr>
							<td>Laughing Bacchus</td>
							<td>Yoshi Tannamuri</td>
							<td>Yoshi Tannamuri</td>
							<td>333</td>
						</tr>
						<tr>
							<td>Magazzini Alimentari</td>
							<td>Magazzini Alimentari</td>
							<td>Giovanni Rovelli</td>
							<td>222</td>
						</tr>
						<tr>
							<td>North/South</td>
							<td>Simon Crowther</td>
							<td>Simon Crowther</td>
							<td>111</td>
						</tr>
						<tr>
							<td>Paris spécialités</td>
							<td>Marie Bertrand</td>
							<td>Marie Bertrand</td>
							<td>0</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>