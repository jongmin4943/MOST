<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script>
$(function(){
	function modalOn(){
		$("#onBtn").click();
	}
	modalOn();
});
</script>
<body>

<div id="ex1" class="modal">
  <p>Thanks for clicking. That felt good.</p>
  <img src="../img/Ex1.jpg" class="img-thumbnail" width="300">
  <a href="#" rel="modal:close">Close</a>
</div>

<!-- Link to open the modal -->
<p><a id="onBtn" href="#ex1" rel="modal:open">Open Modal</a></p>
</body>
</html>