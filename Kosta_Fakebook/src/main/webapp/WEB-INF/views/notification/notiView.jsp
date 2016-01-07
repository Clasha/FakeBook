<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
	$(document).ready(function() {

		$(document).on('click', '.btn_accept', function() {
			alert("친구수락");
			var obj = $(this);
			var m_num = obj.attr("m_num");
			$.ajax({
				type : 'post',
				url : 'friendInsert',
				data : {
					"m_num" : m_num
				},
				success : function(data) {
					obj.siblings().remove();
					obj.remove();
				},
				error : function() {
					alert('친구수락에러');
				}
			});
			var noti_num = obj.attr("noti_num");
			$.ajax({
				type : 'post',
				url : 'readNoti',
				data : {
					"noti_num" : noti_num
				},
				success : function(data) {
					alert('알림읽음');
				},
				error : function() {
					alert('알림읽음-에러');
				}
			});
		});

		$(document).on('click', '.btn_reject', function() {
			var obj = $(this);
			var noti_num = obj.attr("noti_num");
		
			$.ajax({
				type : 'post',
				url : 'readNoti',
				data : {
					"noti_num" : noti_num
				},
				success : function(data) {
					obj.siblings().remove();
					obj.remove();
				},
				error : function() {
					alert('친구 거절 에러..');
				}
			});
			var noti_num = obj.attr("noti_num");
			$.ajax({
				type : 'post',
				url : 'readNoti',
				data : {
					"noti_num" : noti_num
				},
				success : function(data) {
					alert('알림읽음');
				},
				error : function() {
					alert('알림읽음-에러');
				}
			});
		});
	});
	
	
	
	function changeBackground(object){
		var obj = object;
		$(obj).css("background-color","#f6f7f8");
		$(obj).css("color","black");
	}
	
	function changeBackground2(object){
		var obj = object;
		$(obj).css("background-color","#f6f7f8");
		$(obj).css("color","black");
	}
	
	
	var index=6; //for문의 index번호 이번호부터 새로 보여주기시작한다.
	//알수도있는 친구목록에서 삭제 안보이게하고 새로운 판넬 넣어주기! 
	function delete_maybe_friendPanel(object){
		var obj = object;
		var m_num=$(obj).attr("m_num");
		$('#maybe_friendPanel'+m_num).remove();
		
		
		$('.maybe_friendPanel'+index).css("display","block");
		index +=1;
	};
	
	
	$(document).on('click','.btn_addFriend',function(){
		var obj = $(this);
		var m_num = obj.attr("m_num");
		$.ajax({
			type:'post',
			url:'friendInsert_maybeout',
			data: {"m_num": m_num,"maybe":"maybe"},
			success : function(data){
				$('#maybe_friendPanel'+m_num).remove();
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
	
	
	$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip();   
	    $('[data-toggle="popover"]').popover({placement: "left",html: true});   
	});
	
	
</script>

<style type="text/css">
#middle { width:100%; margin:auto; float:left;  }
#left { width:20%; float:left;}
#center{ width: 50%;  float:left;  }
#center_top { width:670px; background-color: white; -webkit-border-radius: 5px;  margin: 10px; padding: 10px; }

#search_detail {
	margin: 3px; 
}

.member_picture {
	width: 100px; 
	height: 100px; 
	display: inline-block; 
	border-right: 1px solid #e9eaed;
}


.proifle_info {
	width: 530px; 
	float: right;
	height: 100px; 
}

#friend_info {
	float: left;  
	margin-top:30px;  
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

.btn_accept {
	  background: #4e69a2;
	  color: white;
	  font-size: 12px;
	  padding: 3px 11px 4px 11px;
	  border: solid #1f628d 1px;
	  text-decoration: none;
	  text-align: center;
	  cursor: pointer;
}

.btn_reject {
  background: #f6f7f8;
  color: black;
  font-size: 12px;
  padding: 3px 11px 4px 11px;
  border: solid 1px;
  border-color: #cccccc #c5c6c8 #b6b7b9;
  text-decoration: none;
  text-align: center;
  cursor: pointer;
}


#maybeFriend_info {
	margin-left: 10px;
	float: left;  
	margin-top:15px;  
	font-size: 10pt;
	color: #9197a3; 
}

#maybeFriend_info > span {
	font-size:11pt; 
	color: #3b5998; 
	font-weight: bold; 
}

#maybeFriend_info > span > a {
	text-decoration:none; 
	color: #3b5998; 
}


a {
	text-decoration:none; 
	color: #9197a3; 
}

#right_friendList {
	width: 15%; 
	border-left: 1px solid #B6B9C1;
	right:0px; 
	height:620px; 
	display: inline-block; 
	position:fixed;
}

#allRequest {
	font-size: 9pt; display: inline-block;
	padding: 1px;
	margin: 1px;
}

#allRequest > a {
	text-decoration:none; 
	color: #3b5998;
	font-weight: lighter;
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
	font-size: 10.5pt;
} 
</style>

<div id="middle">
	<div id="left">
		<div style="margin: 10px;">
			<ul >
				<li style="margin: 10px;"><a href="profilePage" ><img alt="" src="resources/img/profile_icon.png" width="13" height="15" style="vertical-align: middle;"> 프로필</a></li>
				<li style="margin: 10px;" ><a href="profile?num=${sessionScope.loginUser.m_num}" ><img alt="" src="resources/img/profile_icon.png" width="13" height="15" style="vertical-align: middle;"> 타임라인</a></li>
				<li style="margin: 10px;"><a href="main" ><img alt="" src="resources/img/newsfeed_icon.png" width="13" height="15" style="vertical-align: middle;"> 뉴스피드</li>
				<li style="margin: 10px;"><a href="profile?num=${sessionScope.loginUser.m_num}#info-3" ><img alt="" src="resources/img/friend_icon.png" width="13" height="15" style="vertical-align: middle;"> 친구</li>
				<li style="margin: 10px;"><a href="logout"><img alt="" src="resources/img/setting.png" width="18" height="18" style="vertical-align: middle;">로그아웃</a></li>
			</ul>
		</div>
	</div>
	
	<div id="center">
		
		<div id="center_top">
			<!-- 프로필사진/이름/친구수락/거절 버튼 -->
			<h5 style="font-weight: bold;">새로운 친구 요청
			<br/>
				<span id="allRequest" ><a href="maybeAllFriendPage">요청 모두보기</a></span>
			</h5>
			
			
			<c:forEach var="searchCommand" items="${searchList}">
				<div id="search_detail">
					<!--  ================ 프로필사진 ================ -->
					<div class="member_picture">
						<c:choose>
							<c:when test="${searchCommand.picture == null}">
								<img
									src="${pageContext.request.contextPath}/resources/img/noimg.jpg"
									width="100px" height="100px">
							</c:when>
							<c:otherwise>
								<img
									src="${pageContext.request.contextPath}/resources/member_profile/${searchCommand.picture}"
									width="100px" height="100px">
							</c:otherwise>
						</c:choose>
					</div>
					<!--  ================ 상세 정보 ================ -->
					<div class="proifle_info" >
						<div id="friend_info">
							<span>${searchCommand.name } </span>
						</div>
						<div id="friend_state">
							<c:forEach var="f_noti" items="${f_notiList }">
							<c:if test="${f_noti.f_num == searchCommand.m_num }">								
								<button class="btn_accept" m_num="${searchCommand.m_num}"
									noti_num="${f_noti.noti_num}">요청 수락</button>
								<button class="btn_reject" noti_num="${f_noti.noti_num}">요청 거절</button>
							</c:if>
							</c:forEach>
						</div>
					</div>

				</div>

			</c:forEach>
		</div>

		<div >

			<div id="center_top">
				<!-- 프로필사진/이름/친구수락/거절 버튼 -->
				<h5 style="font-weight: bold;">알수도 있는 친구</h5>
				<c:forEach items="${my_maybeFriendList }" var="list" varStatus="status">
				 	<!-- div 5개만 보여주기 삭제 눌렀을시에 새로운것 보여주기위해서 -->
				 	<c:if test="${status.index <6 }">
						<div id="maybe_friendPanel${list.m_num }" class="maybe_friendPanel${status.index }" style="margin-bottom:20px; display: block;">
					</c:if>
					<c:if test="${status.index >=6 }">
						<div id="maybe_friendPanel${list.m_num }" class="maybe_friendPanel${status.index }" style="margin-bottom:20px; display: none; ">
					</c:if>

					<a href="#" data-toggle="popover" data-trigger="click" title="
					<c:if test='${list.picture ==null }'>  <!-- popover title 사진 없을시 -->
						<img  src='resources/my_frofile/noimage.jpg' width='50px'>
					</c:if>
					<c:if test='${list.picture ne null }'> <!-- popover title 사진 있을때 -->
						<img  src='resources/member_profile/${list.picture }' height='50px' width='50px'>
					</c:if>
					
					 <a href='profile?num=${list.m_num}'>${list.name }</a>" 
					data-content="
					<div style='text-align:left;' >
							 <c:if test="${fn:length(list.together_friendNames) == 1 }">
							 	<img src='resources/friendIcon/together_friends.png' width='15px'>함께아는 친구 1명 :  
							 	<c:forEach items="${list.together_friendNames }" var="ff">
							 		<a href='profile?num=${list.together_friendIds[0]}'>${ff }</a>님 <br>
							 	</c:forEach> 
							 </c:if>
							 <c:if test="${fn:length(list.together_friendNames) > 1 }">
							 	<img src='resources/friendIcon/together_friends.png' width='15px'>
							 	<c:forEach items="${list.together_friendNames }" var="ff" end="0">
							 		<a href='profile?num=${list.together_friendIds[0]}'>${ff }</a> 님
							 	</c:forEach> 
							 	을 포함하여 함께아는 친구 ${fn:length(list.together_friendNames) }명<br>
							 </c:if>
							 	<c:forEach items="${list.resons }" var="reson" >
							 		<c:if test='${reson eq "같은 구에 사시네요" }'> 
							 			<img src='resources/friendIcon/house.png' width='15px'>${list.born }거주<br>
							 		</c:if>
							 		<c:if test='${reson eq "같은 직장이네요" }'>
							 			<img src='resources/friendIcon/job.png' width='15px'>${list.job } 근무<br>
							 		</c:if>
							 		<c:if test='${reson eq "같은 고등학교네요" }'>
							 			<img src='resources/friendIcon/school.png' width='15px'>${list.school }<br>
							 		</c:if>
							 		<c:if test='${reson eq "같은 대학에 같은 학년이네요" }'>
							 			<img src='resources/friendIcon/school.png' width='15px'>${list.highschool } / ${list.highschoolmajor }<br>
							 		</c:if>
							 	</c:forEach> 
						</div>
						
							<button type='button' class='btn_addFriend btn-default'   m_num='${list.m_num}'>
								<img src='resources/friendIcon/friend_plus3.png' width='20px'>친구 추가</button>
							 	">
							 	
						<c:if test="${list.picture == null }"> 
							<img  src="resources/my_frofile/noimage.jpg" width="100px" style="display: inline;">
						</c:if>
						<c:if test="${list.picture ne null }"> 
							<img  src="resources/member_profile/${list.picture }" height="100px" width="100px" style="display: inline;">
						</c:if>	
					</a>
					

					<div style="display: inline-block; position: absolute;  font-size: 11pt; padding: 3px; ">
						<div id="maybeFriend_info">
							<div style="display: inline-block; width: 400px;">
								<span><a href="profile?num=${list.m_num}">${list.name }</a></span>
								<br/>
								
								<c:if test="${fn:length(list.together_friendNames) >1 }">
								<span id="maybe_friendsList" class="test" href="#" data-toggle="tooltip" data-html="true"   data-placement="top" 
								title="함께아는 친구 <br>
								  <c:forEach items="${list.together_friendNames }" var="friends">
								 		${friends } <br>
								 	</c:forEach>">
									<img src='resources/friendIcon/together_friends.png' width='15px'>
									함께아는 친구 ${fn:length(list.together_friendNames) }명
								</span><br>
								</c:if>
								
								<c:if test="${fn:length(list.together_friendNames) == 1 }">
									<img src='resources/friendIcon/together_friends.png' width='15px'>
									<c:forEach items="${list.together_friendNames }" var="toghther_friendName">
										<a href="profile?num=${list.together_friendIds[0]}">${toghther_friendName }</a>
										님을 함께 알고 있습니다.<br>
									</c:forEach>
								</c:if>
							</div>
							
								
							<div style=" display: inline; border: none; display: inline-block; float: right;">
								<button type="button" class="btn_addFriend btn-default"   m_num="${list.m_num}" 
								style="  background: #4e69a2; color: white; font-size: 12px; padding: 3px 11px 4px 11px; border: solid #1f628d 1px; text-decoration: none; cursor: pointer;">
								<!-- <img src="resources/friendIcon/friend_plus3.png" width="18" style="vertical-align: middle;"> -->친구 추가</button>
								<span  m_num="${list.m_num }" onclick="delete_maybe_friendPanel(this)" onmouseover="changeBackground(this)" onmouseout="changeBackground2(this)"  
					style="  background: #f6f7f8; color: black; font-size: 12px; padding: 3px 11px 4px 11px; border: solid 1px; border-color: #cccccc #c5c6c8 #b6b7b9; cursor: pointer; ">삭제</span>
							</div>
							
						</div>
					</div>

				</div>

			</c:forEach>
		</div>
	</div>
</div>


<div id="right_friendList">
	<%@include file="../friendList.jsp" %>
</div>


</html>