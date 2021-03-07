
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	const axios = require("axios");
	const cheerio = require("cheerio");
	
	async function getHTML() {
		  try {
		    return await axios.get("https://chaewonkong.github.io");
		  } catch (error) {
		    console.error(error);
		  }
	}
	
	getHTML()
	  .then(html => {
	    let titleList = [];
	    const $ = cheerio.load(html.data);
	    // ul.list--posts를 찾고 그 children 노드를 bodyList에 저장
	    const bodyList = $("ul.list--posts").children("li.item--post");

	    // bodyList를 순회하며 titleList에 h2 > a의 내용을 저장
	    bodyList.each(function(i, elem) {
	      titleList[i] = {
	        title: $(this)
	          .find("h2 a")
	          .text()
	      };
	    });
	    return titleList;
	  })
	  .then(res => console.log(res));
	
</script>
</body>
</html>