<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">

<div style="float: right; margin-top: 10px;">
	<form action="${pageContext.request.contextPath}/ost/list.action" method="POST">
		<select name="option" id="option">
			<option value="OST" selected>OST</option>
			<option value="영화">영화</option>
		</select> 
		<input type="search" id="search" name="search" placeholder="검색" maxlength="50" /> 
		<input class="btn btn-primary btn-sm" type="submit" value="검색" />
	</form>
</div>
