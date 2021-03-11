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
var idx = 0;
var movies = []
$(function() {
	$.get("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=db246ec70452ef24e848a2ae14c1c5c7&targetDt=20210228", 
			function(data, status) {  	
				if(status == "success") {
					console.log(data);
					var content = data.boxOfficeResult.weeklyBoxOfficeList;
					for(var i = 0; i < 10; i++){
						names[i] = content[i]['movieNm'];
						$('#movies').append('<div id="ranking'+i+'"><h4>'+content[i]['movieNm']+'</h4></div>');
						$.get("API_Server.jsp?name="+content[i]['movieNm'], function(data, status) {  
							if(status == "success") {
								movies[idx] = JSON.parse(data);
								for(var i = 0; i<10; i++){
									if(movies[idx].title == ("<b>"+names[i]+"</b>")){
										$('#ranking'+i).append(data);
										break;
									}//inner if end
								}//inner for end
								idx++;
							}//success end if
						});//end get
					}//end for
					
				}//end if
			})//end get
			
});
</script>

<h2>Top ten movies of last week!</h2>
<div id="movies">

</div>


</body>
</html>