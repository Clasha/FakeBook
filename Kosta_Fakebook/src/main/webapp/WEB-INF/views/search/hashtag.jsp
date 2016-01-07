<%@ include file="../header.jsp" %>
<%@ page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" pageEncoding="UTF-8"%>


<html>

<style type="text/css">
#scroll_page {	width: 500px;	background: #666666; }

#middle { width: 100%; height: 100%; top:200px;}

#left { 
	float: left; 
	width: 17%; 
}

#center { 
	float: left; 
	width: 59.5%; 
	height: 720px; 
}

#center_top { 
	width:520px; 
	 background: white;
	-webkit-border-radius: 5px;  
	border: 1px solid white;  
	padding:0.5em;
	margin:10px; 
 }

#right { 
	width: 15%; 
	border-left: 1px solid #B6B9C1;
	right:0px; 
	height:620px; 
	display: inline-block; 
	position:fixed;
}

#boardListContainer {
	width:517px; 
	margin:10px;
}

#known{
	position: fixed; 
	right: 18%; 
	top: 50px; 
 	background-color: white; 
	width: 300px; 
	height: 87%;
	-webkit-border-radius: 5px;  
	padding:0.5em;
	margin:10px; 
}
#editTextarea{width : 500px; white-space: pre-wrap; word-break:break-all;}
.highlight b {
	background: linear-gradient(#dce6f8, #bdcff1);
    border-radius: 2px;
    box-shadow: 0 0 0 1px #a3bcea;
    font-weight: normal;
}
#test {
	position: absolute;
	/* color: transparent; */
	width : 500px;
	padding-top: 2px; 
	padding-left: 2px;
	z-index: 1;
	white-space: pre-wrap;
	word-break: break-all;	
}
.test2 {
	position: absolute;
	/* color: transparent; */
	width : 500px;
	z-index: 1;
	white-space: pre-wrap;
	word-break: break-all;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">
	
	
	// 게시글 [수정] 버튼 클릭
	$(document).on('click', '.btn_board_edit', function() {
		var board_num = $(this).attr("board_num");
		alert("board_num: " + board_num);
		$('div.editDiv[board_num="'+board_num+'"]').show();
		$('td.content[board_num="'+board_num+'"]').hide();
		$('button.btn_board_edit[board_num="'+board_num+'"]').hide();
		$('button.btn_board_delete[board_num="'+board_num+'"]').hide();
	});

	// 게시글 [수정 취소] 버튼 클릭
	$(document).on('click', '#btn_edit_cancle', function() {
		var board_num = $(this).attr("board_num");
		alert('취소:'+board_num);
		$('div.editDiv').hide();
		$('button.btn_board_edit').show();
		$('button.btn_board_delete').show();
		$('td.content').show();
	});
	
	// 게시글 [수정 완료] 버튼 클릭
	$(document).on('click', '#btn_editComplete', function() {
		//alert('수정완료 버튼 클릭');
		var board_num = $(this).attr('board_num');
		var editContent = $('div#editTextarea[board_num="' + board_num + '"]').html();
		var openLevel = $('select.openLevel[board_num="' + board_num + '"] option:selected').val();
		var openLevelText = $('select.openLevel[board_num="' + board_num + '"] option:selected').text();
		alert('board_num: '+board_num +'\neditContent: '+editContent + '\nopenLevel: ' + openLevel + '\nopenLevelText: ' + openLevelText);
		$.ajax({
			type : 'post',
			url : 'updateBoard',
			data : {"board_num": board_num, "editContent": editContent, "openLevel":openLevel},
			success : function(data) {
				//alert('게시글 수정 성공!');
				$('div.editDiv').hide();
				$('button.btn_board_edit').show();
				$('button.btn_board_delete').show();
				
				var pattern = /#[a-zA-Z0-9가-힣_]+\s/gim;
				var txt = editContent.match(pattern);
				var result, i;
				if(txt != null) {
					for(i=0; i<txt.length; i++) {
						if(i==0){
				            result = editContent.replace(txt[i], '<a href="searchyoyo?hashtag='+txt[i]+'">'+txt[i]+'</a>');
				        }        
				        if(i>0) {
				            result = result.replace(txt[i], '<a href="searchyoyo?hashtag='+txt[i]+'">'+txt[i]+'</a>');
				        }
				        alert(result);
					}
					editContent = result;
				}
				
				$('td.content[board_num="'+board_num+'"]').html(editContent);
				$('td.content[board_num="'+board_num+'"]').show();
				$('span.openLevel[board_num="' + board_num + '"]').html(openLevelText);
			},
			error : function() {
				alert('Board Update Error');
			}
		});
	});
	
	// 게시글 [삭제] 버튼 클릭
	$(document).on('click', '.btn_board_delete', function() {
		var board_num = $(this).attr('board_num');
		//alert('삭제버튼 클릭: ' + board_num);
		var check = confirm('정말 삭제하시겠습니까?');
		var obj = $(this);
		if(check) {
			//location.replace('deleteBoard?board_num='+board_num);
			$.ajax({
				type : 'post',
				url : 'deleteBoard',
				data : {"board_num": board_num},
				success : function(data) {
					//alert('delete success!');					
					obj.parent().parent().parent().parent().parent().parent().parent().remove();
					obj.parent().parent().parent().parent().parent().remove();
				},
				error : function() {
					alert('Board Delete Error');
				}
			}); 
		}		
	});
	
	
	// 게시글 [좋아요] 버튼 클릭
	$(document).on('click', '.bLike', function() {
		var board_num = $(this).attr('board_num');
		var obj = $(this);
		var bLikeCount = $(this).attr('bLikeCount');
		//alert('좋아용: ' + board_num);
		$.ajax({
			type : 'post',
			url : 'boardLike',
			data : {"board_num": board_num},
			success : function(data) {
				//alert('Board Like : ' + board_num);
				bLikeCount = eval(bLikeCount) + 1;
				obj.attr('class', 'bLikeCancel');
				obj.attr('bLikeCount', bLikeCount);
				obj.html('좋아요('+bLikeCount+')취소');
			},
			error : function() {
				alert('Board Like Error');
			}
		}); 
	});	
	
	// 게시글 [좋아요 취소] 버튼 클릭
	$(document).on('click', '.bLikeCancel', function() {
		var board_num = $(this).attr('board_num');
		var obj = $(this);
		var bLikeCount = $(this).attr('bLikeCount');
		//alert('좋아요 취소: ' + board_num);
		$.ajax({
			type : 'post',
			url : 'boardLikeCancel',
			data : {"board_num":board_num},
			success : function(data) {
				//alert('좋아요 취소!');
				bLikeCount -=1;
				obj.attr('class', 'bLike');
				obj.attr('bLikeCount', bLikeCount);				
				obj.html('좋아요('+bLikeCount+')');
			},
			error : function() {
				alert('Board Like Cancle Error');
			}
		});
	});
	
	// 해시태그 패턴 입력되면 강조표시 하기
	$(document).on('input', 'textarea', function() {
		//alert('input');
		var str = $('textarea').val();
		var pattern = /#[a-zA-Z0-9가-힣_]+\s/gim;
		var txt = str.match(pattern);
		
		var result, i;
		if(txt != null) {
			for(i=0; i<txt.length; i++) {
				if(i==0){
		            result = str.replace(txt[i], '<b>'+txt[i]+'</b>');
		        }        
		        if(i>0) {
		            result = result.replace(txt[i], '<b>'+txt[i]+'</b>');
		        }
		        
			}
			str = result;
		}
		//str = str.replace(/\s+\n/g, '<br>');
		str = str.replace(/\n/g, '<br>');
		str = str.replace(/\s/g, ' ');
		$('#test').html(str);
	});
	
	// 해시태그 패턴 입력되면 강조표시 하기
	$(document).on('input', '#editTextarea', function() {
		//alert('input');
		var str = $('#editTextarea').html();
		var pattern = /#[a-zA-Z0-9가-힣_]+\s/gim;
		var txt = str.match(pattern);
		
		var result, i;
		if(txt != null) {
			for(i=0; i<txt.length; i++) {
				if(i==0){
		            result = str.replace(txt[i], '<b>'+txt[i]+'</b>');
		        }        
		        if(i>0) {
		            result = result.replace(txt[i], '<b>'+txt[i]+'</b>');
		        }
		        //$('.board_item_container').prepend('<input type="text" value="'+txt[i]+'">');
			}
			str = result;
		}
		
		//str = str.replace(/\n/g, '<br>');
		//str = str.replace(/\s/g, '&nbsp;');
		//$('.test2[board_num="'+board_num+'"]').html(str);
		$('.test2').html(str);
	});
</script>

<div id="middle">
	<div id="left">
		<div style="margin: 10px;">
			<ul >
				<li style="margin: 10px;"><a href="profilePage" ><img alt="" src="resources/img/profile_icon.png" width="13" height="15"> 프로필</a></li>
				<li style="margin: 10px;" ><a href="profile?num=${sessionScope.loginUser.m_num}" ><img alt="" src="resources/img/profile_icon.png" width="13" height="15"> 타임라인</a></li>
				<li style="margin: 10px;"><a href="main" ><img alt="" src="resources/img/newsfeed_icon.png" width="13" height="15"> 뉴스피드</li>
				<li style="margin: 10px;"><a href="profile?num=${sessionScope.loginUser.m_num}#info-3" ><img alt="" src="resources/img/friend_icon.png" width="13" height="15"> 친구</li>
				<li style="margin: 10px;"><a href="logout"><img alt="" src="resources/img/setting.png" width="18" height="18">로그아웃</a></li>
			</ul>
		</div>
	</div>
	<div id="center"> 
		<div id="center_top">
			<jsp:include page="../write_form.jsp"></jsp:include>
		</div>	
		<div id="boardListContainer">
			<jsp:include page="read_board.jsp"></jsp:include>
		</div>
	</div>
	<div id="right">
		<%@include file="../friendList.jsp" %>
	</div>
</div>

<div id="known"> 
		<%@include file="../maybe_friendList.jsp" %>
</div>

</html>
