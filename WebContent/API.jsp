<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
var names = []
$(function() {
	$.get("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=db246ec70452ef24e848a2ae14c1c5c7&targetDt=20210228", function(data, status) {  
		if(status == "success") {
			var content = data.boxOfficeResult.weeklyBoxOfficeList;
			console.log(content);
			for(var i = 0; i < 10; i++){
				console.log(content[i]['movieNm']);
				$('#movies').append('<h4>'+content[i]['movieNm']+'</h4>');
			}
		}
	});
});
</script>

<h2>Top ten movies of last week!</h2>
<div id="movies">

</div>


</body>
</html>