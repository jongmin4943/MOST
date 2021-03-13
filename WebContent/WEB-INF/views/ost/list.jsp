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
.commentArea {
	border: 1px solid #bcbcbc;
	overflow:auto;
	border-left: 3px solid #369;
	
}
#commentHeader{
	overflow:auto;
	border-bottom:1px solid #bcbcbc;
	font-weight: bold;
}
.commentDetail {
	overflow:auto;
	boarder-bottom:1px solid #bcbcbc;
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
</style>
<script src="https://code.jquery.com/jquery.js"></script>
<script>
var no = 1//${param.no}
var guestID = "${sessionScope.userID}";
var flag = false;
$(function() {
	function getComment() {
		$.get("comment.action?ostNum="+no,function(data,status) {
			var commentList = JSON.parse(data.trim()).sent;
			var start = "<div class = 'commentDetail'>";
			for(var i = 0; i<commentList.length; i++){
				item = commentList[i];
				if(i>0) {
					start +="<div class = 'commentDetail'>";
				}
				if(guestID != item.guestID) {
					option = "<p style='width: 70px;'></p>";
				} else {
					option = "<a class='commentModi' data-comment-no='"+item.commentNo+"' href=''>수정</a><a class='commentDel' data-comment-no='"+item.commentNo+"' href=''>삭제</a>";
				}
				start += '<span class="cID">'+item.guestID+'</span>';
				start += '<span class="cContent modifying" data-comment-no="'+item.commentNo+'">'+item.content+'</span>';
				start += "<span class='cOption' style='text-align:right'>"+option+"</span>";
				start += '<span class="cDate">'+item.date.substring(0,11)+'</span>';
				start += "</div>";
			}//end for
			$("#comment").html(start);
			
			$('.commentDel').click(function(event) { 	//삭제 링크 클릭
			    event.preventDefault(); 
			    var commentNo = $(this).attr("data-comment-no");
			    deleteComment(commentNo);	//해당 코멘트 삭제
			    return false;
			});//end Del
			
			$('.commentModi').click(function(event) { 	//수정 링크 클릭
				if(!flag) {
					flag = true;
				    event.preventDefault();
				    var commentNo = $(this).attr("data-comment-no");
				    var where = $('span[data-comment-no^='+commentNo+']'); // content와 option 둘다 해당되지만 content가 먼저 나오는걸 이용, 선택한다.
					var modi = "<textarea class = 'form-control' name='modiarea' id='modiarea' rows='2' cols='50' style='width:100%' maxlength='1000'>"+where.text()+"</textarea><input type='button' id='modiBtn' value='댓글 수정' />";
					where.html(modi);
					$('#modiBtn').click(function() {
						event.preventDefault();
						if($("#modiarea").val() == "") {
						alert("수정할 댓글을 입력해주세요.");
							return false;
						}
						var modiTxt = $("#modiarea").val();
					    modifyComment(commentNo,modiTxt);	//해당 코멘트 수정
					});
				} else {
					alert("수정은 한번에 하나만 가능합니다.");
				}
			    return false;
			}); //end Modi
		}) 
	}//end get Function
	getComment();
	
	$('.cBtn').click(function() {
		if(guestID == 'null') {
			var c = confirm('로그인 하시겠습니까?.');
			if(c) {
				location.href = 'login.action';
				return false;
			} else {
				return false;
			}
		} else {
			event.preventDefault();
			if($("#textarea").val() == "") {
				alert("댓글을 입력해주세요.");
				return false;
			}
		} //end if
		
		var textarea = $("#textarea").val();
		$.ajax({ //댓글 작성 ajax
			type: "POST",
			url: "comment.action?ostNum="+no,
			data: {content : textarea,
					ostNum : no		
			},  
			success: function(data) {
				var commentList = JSON.parse(data.trim()).sent;
				var start = "<div class = 'commentDetail'>";
				for(var i = 0; i<commentList.length; i++){
					item = commentList[i];
					if(i>0) {
						start +="<div class = 'commentDetail'>";
					}
					if(guestID != item.guestID) {
						option = "<p style='width: 70px;'></p>";
					} else {
						option = "<a class='commentModi' data-comment-no='"+item.commentNo+"' href=''>수정</a><a class='commentDel' data-comment-no='"+item.commentNo+"' href=''>삭제</a>";
					}
					start += '<span class="cID">'+item.guestID+'</span>';
					start += '<span class="cContent modifying" data-comment-no="'+item.commentNo+'">'+item.content+'</span>';
					start += "<span class='cOption' style='text-align:right'>"+option+"</span>";
					start += '<span class="cDate">'+item.date.substring(0,11)+'</span>';
					start += "</div>";
				}//end for
				$("#comment").html(start);
				$("#textarea").val("");
				
				$('.commentDel').click(function(event) { 	//삭제 링크 클릭
				    event.preventDefault(); 
				    var commentNo = $(this).attr("data-comment-no");
				    deleteComment(commentNo);	//해당 코멘트 삭제
				    return false;
				});//end Del
				
				$('.commentModi').click(function(event) { 	//수정 링크 클릭
					if(!flag) {
						flag = true;
					    event.preventDefault();
					    var commentNo = $(this).attr("data-comment-no");
					    var where = $('span[data-comment-no^='+commentNo+']');
						var modi = "<textarea class = 'form-control' name='modiarea' id='modiarea' rows='2' cols='50' style='width:100%' maxlength='1000'>"+where.text()+"</textarea><input type='button' id='modiBtn' value='댓글 수정' />";
						where.html(modi);
						$('#modiBtn').click(function() {
							event.preventDefault();
							if($("#modiarea").val() == "") {
							alert("수정할 댓글을 입력해주세요.");
								return false;
							}
							var modiTxt = $("#modiarea").val();
						    modifyComment(commentNo,modiTxt);	//해당 코멘트 수정
						});
					} else {
						alert("수정은 한번에 하나만 가능합니다.");
					}
				    return false;
				}); //end Modi
			}
		})
	})
	function deleteComment(commentNo) {	//댓글 삭제 함수
		var check = confirm("삭제 하시겠습니까?");
		if(check == false) {
			return false;
		} else {
			$.ajax({
				type: "POST",
				url: "commentDele.action",
				data: {
					commentNo : commentNo,
					ostNum : no
					},  
				success: function(data) {
					var suc = data.trim();
					getComment();	//삭제 후 댓글 리스트 호출
				},
				error: function(jqxhr, textStatus, errorThrown) {
					alert("ERROR, STATUS : "+textStatus +", Error thrown : "+errorThrown);
				}
			});
		}
	}
	function modifyComment(commentNo,modiTxt) {	//댓글 수정 함수
		$.ajax({
			type: "POST",
			url: "commentModi.action",
			data: {
				commentNo : commentNo,
				modiText : modiTxt,
				ostNum : no
				},  
			success: function(data) {
				var suc = data.trim();
				flag = false;
				getComment();	//수정 후 댓글 리스트 호출
			},
			error: function(jqxhr, textStatus, errorThrown) {
				alert("ERROR, STATUS : "+textStatus +", Error thrown : "+errorThrown);
			}
		});
	}
})
</script>
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
				<img src="${pageContext.request.contextPath}/img/Ex1.jpg" class="img-thumbnail" width="100%">
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
				<div style="text-align: center;">
					${param.name}~OST 의 댓글
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