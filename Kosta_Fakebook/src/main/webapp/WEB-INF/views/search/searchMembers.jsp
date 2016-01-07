<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<style>

#middle { 
	width:100%; margin:auto; float:left; 
}
#left { 
	float: left; 
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
	float: left; 
	width: 70%; 
	height: 720px;  
	margin: 5px;
}
	
#center_top { 
	background: white; 
	padding:15px; 
	width: 650px; 
	-webkit-border-radius: 5px;
}

#search_detail {
	border: 1px solid #e9eaed; margin: 3px; 
}

.member_picture {
	width: 100px; 
	height: 100px; 
	display: inline-block; 
	border-right: 1px solid #e9eaed;
}

.proifle_info {
	width: 500px; 
	float: right;

}

#friend_info {
	float: left;  
	margin-top:20px;  
}

#friend_info > span {
	font-size:11pt; 
	color: #3b5998; 
	font-weight: bold; 
}

#friend_info > span > a {
	text-decoration:none; 
	color: #3b5998; 
}

#friend_state {
	float: right;
	margin-top:30px; 
	padding: 5px;
}
</style>

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
	<div id="right"><br> 
		<div id="center_top" >
			<div id="search_list" >
				<c:forEach var="searchCommand" items="${searchList}">
					<div id="search_detail" >
						<!--  ================ 프로필사진 ================ -->
						<div class="member_picture">
							<c:choose>
								<c:when test="${searchCommand.picture == null}">
									<img src="${pageContext.request.contextPath}/resources/img/noimg.jpg"  width="100px" height="100px">
								</c:when>
								<c:otherwise>
									<%-- <a href="profile?num=${member.m_num}&fnum=${myfriendPicture.m_num}"> --%>
									<a href="profile?num=${searchCommand.m_num }">
										<img src="${pageContext.request.contextPath}/resources/member_profile/${searchCommand.picture}" width="100px" height="100px">
									</a>
								</c:otherwise>
							</c:choose> 
						</div>
						<!--  ================ 상세 정보 ================ -->
						<div class="proifle_info">
							<div id="friend_info" >
								<span> <a href="profile?num=${searchCommand.m_num }"> ${searchCommand.name} </a> </span>
								<div>
									<span style="font-size:9pt; color: #9197a3; ">학교정보 및 직장정보</span>
								</div>
							</div>
							<div id="friend_state" >
								<c:if test="${searchCommand.isFriend==0}">
									<button class="btn_addFriend_search" m_num="${searchCommand.m_num}">친구신청</button>
								</c:if>
								<c:if test="${searchCommand.isFriend==1}">
									<button class="btn_deleteFriend" m_num="${searchCommand.m_num}">친구끊기</button>
								</c:if>
							</div>

						</div>
					</div>
					
				</c:forEach>
			</div>
		</div>			
	</div>
	<div style="width: 17%;  right:0px; height:620px; display: inline-block; border-left: 1px solid #B6B9C1;  position:fixed;">
		<%@include file="../friendList.jsp" %>
	</div>
</div>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	$(document).on('click','.btn_addFriend_search',function(){
		alert("친구신청");
		var obj = $(this);
		var m_num = obj.attr("m_num");
		$.ajax({
			type:'post',
			url:'friendInsert',
			data: {"m_num": m_num},
			success : function(data){
				obj.after("<button class='wait-friend'>친구 수락 대기 중</button>");
				obj.remove();
			},error : function(){
				alert('에러');
			}
		});
		
		$.ajax({
			type:'post',
			url:'insertFriendNoti',
			data: {"m_num": m_num},
			success : function(data){
				alert('알림발송');
			},error : function(){
				alert('알림발송-에러');
			}
		});
	});
	
	$(document).on('click', '.btn_deleteFriend', function(){
		var result = confirm('친구 관계를 끊습니다. \n다시 한번 확인해주세요.' );
		if(result){
			var m_num = $(this).attr('m_num');
			var obj = $(this);
			$.ajax({
				type : 'post',
				url : 'FriendDelete',
				data: {"m_num": m_num},
				success : function(data) {
					obj.after("<button class='btn_addFriend_search' m_num='"+m_num+"'}>친구신청</button>");
					obj.remove();
				},
				error : function() {
					alert('Error while request..');
				}
			});
		}
	});
});
</script>
</html>