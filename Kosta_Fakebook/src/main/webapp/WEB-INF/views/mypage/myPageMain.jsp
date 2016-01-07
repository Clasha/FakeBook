<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script>
  jQuery( document ).ready( function() {
    $( '#tab-menu' ).tabs();
  } );
</script>
    
<style type="text/css">
html, body {
	background-color: #dddddd;
}

.proifile_center {
	display: inline-block;
	padding:1px;
	width: 620px;
	margin-top: 10px;
}

#left { 
	float: left; 
	display: inline-block;
	width: 17%; 
}

 ul {
	list-style-type:none;
}


 li > a { 
	text-decoration:none; 
	color: black;
}

#right { 
	display: inline-block;
	width: 15%; 
	border-left: 1px solid #B6B9C1;
	right:0px; 
	height:620px; 
	display: inline-block; 
	position:fixed;
} 

</style>


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

<div class="proifile_center"  id="tab-menu">
	<div class="select_content">
		<%@include file="memberInfomation.jsp" %>
	</div>
</div>

<div id="right">
		<%@include file="../friendList.jsp" %>
	</div>