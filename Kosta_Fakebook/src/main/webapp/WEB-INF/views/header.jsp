<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page import ="java.util.*, edu.kosta.mybatis.*" %>
<%@ page import ="java.util.*, edu.kosta.com.*" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<title>FAKEBOOK</title>	
<style type="text/css">

html, body {
	height: 100%; margin: 0; padding:0;
	min-width:1000px;
	background: #e9eaed;
}

a, button {
	outline:none;
}

.wrap {background:#3a5795; height:50px; position:fixed; width:100%; z-index:10; }
#top { width:40px;  color: white;  position: fixed; top: 10px; left:120px;}


.header2_right_menu {
	display: inline-block; 
	border: solid 1px #ccc; 
	background-color: white;; 
	font-size: 9pt; 
	 position: fixed; top: 13px; left:165px;
}

.search { 
	background-color: transparent; 
	width: 320px; 
	padding: 3px; 
	border: 0;  
	font-size: 9pt; 
}

.header2_right_menu input{ outline-style:none;}
.header2_right_menu textarea{ outline-style:none;}

.search_btn { 
	background-color: #f6f7f8; 
	width: 50px; 
	padding: 3px; 
	border: solid 1px #f6f7f8;  
	font-size: 9pt; 
}


.header_right {
	width:500px;  
	margin:0 auto; 
	position: absolute; 
	color:white; 
	top:15px; 
	left:720px; 
	font-size:9pt;
	vertical-align: middle;
}

.header_right > ol {
	list-style-type:none;
}

.header_right > ol > li{
	display:inline;
	
}

.header_right > ol > li > a { 
	text-decoration:none; 
	color:white;
	
}

</style>

</head>
<body>

<div class="wrap">

	<div id="top">
		<a href="main"><img alt="" src="resources/mini_logo.jpg" width="40" height="28"></a>
	</div>

 	<div class="header2_right_menu">
 		<form action="searchMembers" method="get">
			<input type="text" name="keyword" class="search">
			<input type="submit" value="검색 " class="search_btn">
		</form>
	</div>

	<div class="header_right">
		<ol>
			<li >
				<a href="profile?num=${sessionScope.loginUser.m_num}"> 
					<c:if test="${sessionScope.loginUser.picture eq null }">
						<img alt="" src="${path}/resources/member_profile/noimage.jpg" width="21" height="21" style="vertical-align: middle;"> 
					</c:if>
					<c:if test="${sessionScope.loginUser.picture ne null }">
						<img alt="" src="${path}/resources/member_profile/${sessionScope.loginUser.picture}" width="21" height="21" style="vertical-align: middle;">
					</c:if>
					${sessionScope.loginUser.name}
				</a>
			</li>
			<li ><a href="main"> | 홈 | </a></li>
			<li ><a href="selectFriendNoti">친구찾기</a> | </li>
			<li><a href="notice_list">공지사항 | </a></li> 
			<li><a href="#" data-toggle="popover" data-trigger="click" data-html="true" title="
				<c:if test='${empty noti_List }'><font color='black'>알림이 없습니다</font></c:if>
			<c:forEach var='notify' items='${noti_List }'>

			<a href='detail2?board_num=${notify.board_num}&noti_num=${notify.noti_num}'>
				<div>
					<input type='hidden' value='${notify.noti_num }' name='noti_num' id='noti_num'>
					<font color='black'>
						<img src='resources/comment.png' width='16px' height='16px'>게시물에 댓글이 달렸습니다
					</font>
				</div>
			</a>
			</c:forEach>" 
			style="text-decoration: none; color: white;"><c:if test='${not empty noti_List }'>New!!!</c:if>알림</a> |
			<li><a href="#" data-html="true" class="likeNoti" data-toggle="popover3" data-placement="bottom" title="<font color='black'>좋아요 알림</font>" data-content="-----------------------------------------------------------------------" data-original-title="좋아요알림" container="body">좋아요알림</a> | </li>
			<li ><a href="logout">로그아웃</a></li>
		</ol>
	</div>
</div>
<div style="height:50px;"></div>
<span m_num="${sessionScope.loginUser.m_num}"></span>
<script type="text/javascript">

	function getLikeNotis(m_num) {
		$.ajax({
			url: "getLikeNotis",
			data: {"m_num":m_num},
			success: function(result){
				//alert(result);
				$('.popover-content').html(result);
			}
		});
	}	

	$(document).ready(function(){
		var m_num = $("[m_num]").attr("m_num");
		$(".likeNoti").click(function(){
	        $("[data-toggle='popover3']").popover('toggle');
	    });
		$("[data-toggle='popover3']").on('show.bs.popover', function(){
	        getLikeNotis(m_num);
	    });
	});
	
	$(document).on('click', '.delete_likenoti', function() {
		
		var noti_num = $(this).attr("noti_num");
		alert("readNoti : "+noti_num);
		$.ajax({
			type:'post',
			url:"readNoti",
			data:{"noti_num": noti_num},
			success: function(result) {
				alert("readNoti성공");
			},error : function(){alert('에러');}
		});
	});

</script>