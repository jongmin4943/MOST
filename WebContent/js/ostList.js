$(function() {
	$(document).ready(function() {
		function getComment() {
		$.get("comment.action?ostNum="+no,function(data,status) {
			var commentList = JSON.parse(data.trim()).sent;
			var start = "<div class = 'commentDetail'>";
			for(var i = 0; i<commentList.length; i++){
				item = commentList[i];
				if(i>0) {
					start +="<div class = 'commentDetail'>";
				}
				if(guestID != item.guestID && guestID != "admin") {
					option = "<p style='width: 70px;'></p>";
				} else if(guestID == "admin") {
					option = "<a class='commentDel' data-comment-no='"+item.commentNo+"' href=''>삭제</a>";
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
	if(no != "-1"){
		getComment();
	}
	
	$('.cBtn').click(function() {
		if(guestID == 'null' || guestID == "") {
			var c = confirm('로그인 하시겠습니까?.');
			if(c) {
				location.href = contextPath+'/user/login.action';
				return false;
			} else {
				return false;
			}
		} else if(no == "-1" || flag4 == false) { //나중에 db의 likedOst 아이디와 현재 세션의 아디와 비교해서 alert 바꾼다.
			alert("좋아요를 눌러야 댓글 작성이 가능합니다.");
			return false;
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
					if(guestID != item.guestID && guestID != "admin") {
						option = "<p style='width: 70px;'></p>";
					} else if(guestID == "admin") {
						option = "<a class='commentDel' data-comment-no='"+item.commentNo+"' href=''>삭제</a>";
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
	
	
	    $(".ost").click(function() {
	    	var imgUrl = null;
	    	if(!flag2) {
	    		flag2 = true;
	    		$(".ost td").each(function(index, item){
	    			$(item).children().children().unwrap();
	    			$(item).attr("style","vertical-align: middle")
	    		});
		    	var idx = $(this).attr("data-movie-no");
		    	var likeBtn = $(this).children().eq(3);
		    	var encodedAlbum = encodeURIComponent($(this).children().eq(2).text());
		    	var encodedTitle = encodeURIComponent($(this).children().eq(0).text());
		    	var artist = encodeURIComponent($(this).children().eq(1).text());
		    	var encodedUserID = encodeURIComponent(guestID);
		    	var commentOfOst = $(this).children().eq(0).text().substring(0, $(this).children().eq(0).text().indexOf("("));
		    	var curTd = $(this).children();
		    	$.get("listMovie.action?album="+encodedAlbum+"&title="+encodedTitle+"&artist="+artist+"&userID="+encodedUserID, function(data,status) {
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
					(curTd.eq(0)).html("<b><span>"+curTd.eq(0).text()+"</span></b>");
					(curTd.eq(0)).attr('style', 'vertical-align: middle; background-color: #98ecff');
					(curTd.eq(1)).html("<b><span>"+curTd.eq(1).text()+"</span></b>");
					(curTd.eq(1)).attr('style', 'vertical-align: middle; background-color: #98ecff');
					(curTd.eq(2)).html("<b><span>"+curTd.eq(2).text()+"</span></b>");
					(curTd.eq(2)).attr('style', 'vertical-align: middle; background-color: #98ecff');
					(curTd.eq(3)).attr('style', 'vertical-align: middle; background-color: #98ecff');
					$("#movie").html(start);
					$("#movieImg").html(movie.imgSrc[0]);
					no = movie.no[0];
					currUserStatus = movie.currUserStatus[0];
					if(currUserStatus == "like") {
			    		flag4 = true;
			    	} else {
			    		flag4 = false;
			    	}
					$("#ostComment").html(commentOfOst+"의 댓글");
					likeBtn.html(movie.likeIcon); // 꽉찬 하트면 댓글 작성 가능
			    	if(no == "-1"){
				    	$("#comment").html('<div class=\"commentDetail\"></div>');
					}
			    	if(no != "-1"){
			    		getComment();
			    	}
		    	});
		    	flag2 = false;
	    	}
		    $(this).children().eq(3).off().click(function(){
		    	if(guestID == 'null' || guestID == "") {
					var c = confirm('로그인 하시겠습니까?.');
					if(c) {
						location.href = contextPath+'/user/login.action';
						return false;
					}
		    	} else {
			    	$.get("listLike.action?title="+encodedTitle+"&artist="+artist+"&album="+encodedAlbum+"&imgSrc="+imgUrl+"&userID="+encodedUserID, function(data,status) {
			    		var likey = JSON.parse(data);
			    		no = likey.no[0];
			    		//console.log("children clicked "+no);
			    		currUserStatus = likey.currUserStatus[0];
			    		if(currUserStatus == "like") {
			    			flag4 = true;
			    		} else {
			    			flag4 = false;
			    		}
			    		$(likeBtn).html(likey.likeIcon); // 꽉찬 하트면 댓글 작성 가능
			    		if(no == "-1"){
				    		$("#comment").html('<div class=\"commentDetail\"></div>');
						}
				    	if(no != "-1"){
				    		getComment();
				    	}
			    	});
			    	return false;
		    	}
		    }); // end of like btn
	    });
	});
})