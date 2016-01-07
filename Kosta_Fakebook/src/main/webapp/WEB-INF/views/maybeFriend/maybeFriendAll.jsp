<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 
<style>
body {
	background: #e9eaed;
}
	#newFriendRequestedDiv{
		background-color: white;
		border: solid #CBD6FC 1px;
		margin-top: 30px;
		width: 900px;
		height:auto;
		margin-left: 40px;
		border-radius:3px;
	}
	#newFriendRequestDiv{
		background-color: white;
		border: solid #CBD6FC 1px;
		margin-top: 30px;
		width: 900px;
		height:auto;
		margin-left: 40px;
		border-radius:3px;
	}
	#maybeFriendAllList{
		background-color: white;
		border: solid #CBD6FC 1px;
		margin-top: 30px;
		width: 900px;
		margin-left: 40px;
		border-radius:3px;
		height: 1000px;
		
	}
	a{
		color: #AABBF4;
	}
	#right { 
	position:fixed; 
	right: 0px;
	 top : 45px; 
	 background-color: #CBD4D7; 
	 width: 200px;
	 height: 600px; 
	 }
</style>	  
	  
</head>
<body>

<%-- <div id="right">
		<%@include file="../friendList.jsp" %>
</div> --%>

<!-- 친구요청 들어온 것들-->
<div id="newFriendRequestedDiv" style="display: none;"> 
	<!-- 친구요청 온게 있을때 -->
	<c:if test="${fn:length(requestedMemberInfo) > 0}">
		<span style="margin-left: 20px; "><font size="4px"><b>친구 요청을 받음</b></font></span><br>
		<a href="#" id="changeFriendRequestdiv" style="margin-left: 20px;"><font color="#AABBF4" size="2px">전송한 요청 보기</font></a>
				<c:forEach items="${requestedMemberInfo }" var="reqeustList">
						<div id="appendRequestedFriendDiv${reqeustList.m_num }" style=" margin-left:20px;  ">
							<div style="display:table-cell; vertical-align:middle; margin-top: 8px;">
								<c:if test="${reqeustList.picture eq null }">
									<img  src="resources/my_frofile/noimage.jpg" width="70px"  >
								</c:if>
								<c:if test="${reqeustList.picture ne null }">
									<img  src="resources/member_profile/${reqeustList.picture }" width="70px"  >
								</c:if>
							</div>
							<div style="text-align:left; width:600px; display:table-cell; vertical-align:middle;   margin-top:auto; margin-bottom:auto;">
								<a href="profile?num=${reqeustList.m_num}">${reqeustList.name }</a><br>
								
								<c:if test="${reqeustList.school ne null }">
		                           <img src="resources/friendIcon/school.png" width="15px"> ${reqeustList.school } <br>
		                        </c:if>
		                        <c:if test="${reqeustList.highschool ne null }">
		                           <img src="resources/friendIcon/school.png" width="15px"> ${reqeustList.highschool }/${reqeustList.highschoolmajor } 전공<br>
		                        </c:if>
		                        <c:if test="${reqeustList.job ne null }">
		                           <img src="resources/friendIcon/job.png" width="15px"> ${reqeustList.job }<br>
		                        </c:if>
		                        <c:if test="${reqeustList.born ne null }">
		                           <img src="resources/friendIcon/house.png" width="15px"> ${reqeustList.born }<br>
		                        </c:if>
								<%-- <c:choose>
									<c:when test="${reqeustList.school ne null }">
										<img src="resources/friendIcon/school.png" width="15px"> ${reqeustList.school } <br>
									</c:when>
									<c:when test="${reqeustList.highschool ne null }" >
										<img src="resources/friendIcon/school.png" width="15px"> ${reqeustList.highschool }/${reqeustList.highschoolmajor } 전공<br>
									</c:when>
									<c:when test="${reqeustList.job ne null }">
										<img src="resources/friendIcon/job.png" width="15px"> ${reqeustList.job }<br>
									</c:when>
									<c:when test="${reqeustList.born ne null }">
										<img src="resources/friendIcon/house.png" width="15px"> ${reqeustList.born }<br>
									</c:when>
								</c:choose> --%>
							</div>
							<div style="display:table-cell; vertical-align:middle;">
								<button class="requestFriendAcceptBtn btn-default" m_num="${reqeustList.m_num }">
									<img src="resources/friendIcon/requestFriend.png" width="20px">친구 수락
								</button>
								
								<!-- 친구 수락하지않고 살제 할때  -->
								<button class="requestedFriendCancleBtn btn-default"  m_num="${reqeustList.m_num }">
									<img src="resources/friendIcon/x.png" width="10px">삭제
								</button>
							</div>
							<hr style="margin-left: 10px; margin-right: 10px; color: #E0E7FC">
						</div>
						
				</c:forEach>
	</c:if>
	
	<!-- 친구요청 들어온게 없을때  -->
	<c:if test="${fn:length(requestedMemberInfo) == 0}">
		<span style="margin-left: 20px; "><font size="4px"><b>새로운 친구 요청 없음</b></font></span><br>
		<a href="#" id="changeFriendRequestdiv" style="margin-left: 20px;"><font color="#AABBF4" size="2px">전송한 요청 보기</font></a>
	</c:if>
	<div id="appendRequestedFriendDiv">
	</div>
</div>

<!-- 친구요청한 것들-->
<div id="newFriendRequestDiv" style="display: block; height: auto;"> 
	<!-- 친구 요청한게  있을때 -->
	<c:if test="${fn:length(requestMemberInfo) >0 }">
		<span style="margin-left: 20px; "><font size="4px"><b>친구 요청이 전송됨</b></font></span><br>
		<a href="#" id="changeFriendRequestdiv2" style="margin-left: 20px;"><font color="#AABBF4" size="2px">수신한 요청 보기</font></a>
			
				<c:forEach items="${requestMemberInfo }" var="reqeustList">
						<div id="appendRequestFriendDiv${reqeustList.m_num }" style="margin-left: 20px;  ">
							<div style="display:table-cell; vertical-align:middle;   ">
								<c:if test="${reqeustList.picture eq null }">
									<img  src="resources/my_frofile/noimage.jpg" width="70px" style="margin-top:auto; margin-bottom:auto; " >
								</c:if>
								<c:if test="${reqeustList.picture ne null }">
									<img  src="resources/member_profile/${reqeustList.picture }" width="70px"  >
								</c:if>
							</div>
							<div style="text-align:left; width:600px; display:table-cell; vertical-align:middle;   margin-top:auto; margin-bottom:auto; ">
								<a href="profile?num=${reqeustList.m_num}">${reqeustList.name }</a><br>
								
								
								<c:if test="${reqeustList.school ne null }">
		                           <img src="resources/friendIcon/school.png" width="15px"> ${reqeustList.school } <br>
		                        </c:if>
		                        <c:if test="${reqeustList.highschool ne null }">
		                           <img src="resources/friendIcon/school.png" width="15px"> ${reqeustList.highschool }/${reqeustList.highschoolmajor } 전공<br>
		                        </c:if>
		                        <c:if test="${reqeustList.job ne null }">
		                           <img src="resources/friendIcon/job.png" width="15px"> ${reqeustList.job }<br>
		                        </c:if>
		                        <c:if test="${reqeustList.born ne null }">
		                           <img src="resources/friendIcon/house.png" width="15px"> ${reqeustList.born }<br>
		                        </c:if>
								<%-- <c:choose>
									<c:when test="${reqeustList.school ne null }">
										<img src="resources/friendIcon/school.png" width="15px"> ${reqeustList.school } <br>
									</c:when>
									<c:when test="${reqeustList.highschool ne null }">
										<img src="resources/friendIcon/school.png" width="15px"> ${reqeustList.highschool }/${reqeustList.highschoolmajor } 전공<br>
									</c:when>
									<c:when test="${reqeustList.job ne null }">
										<img src="resources/friendIcon/job.png" width="15px"> ${reqeustList.job }<br>
									</c:when>
									<c:when test="${reqeustList.born ne null }">
										<img src="resources/friendIcon/house.png" width="15px"> ${reqeustList.born }<br>
									</c:when>
								</c:choose> --%>
							</div>
							<div style="display:table-cell; vertical-align:middle;">
								<button m_num="${reqeustList.m_num }" class="reqeustFriendCancleBtn btn-default" data-toggle="tooltip" data-placement="auto" title="클릭시 친구요청 취소">
								<img src="resources/friendIcon/response_Friend.png" width="20px">친구 요청 전송됨
								</button>
							</div>
							<hr style="size:1px; margin-left: 10px; margin-right: 10px; color: #E0E7FC">
						</div>
						
				</c:forEach>
	</c:if>
	<!-- 친구 요청한게 없을때  -->
	<c:if test="${fn:length(requestMemberInfo) == 0 }">
		<span style="margin-left: 20px;  "><font size="4px"><b>전송된 친구요청 없음</b></font></span><br>
		<a href="#" id="changeFriendRequestdiv2" style="margin-left: 20px;"><font color="#AABBF4" size="2px">수신한 요청 보기</font></a>
	</c:if>
</div>







<div id="maybeFriendAllList">
	<div style="margin-top: 20px; margin-left: 20px;">
		<strong>알수도 있는 사람</strong>
	</div>
	<hr>
	<c:forEach items="${maybeList }" var="list" varStatus="status">
		<c:if test="${status.index <6 }">
			<div id="appendMaybeFriendPan${list.m_num }" class="appendMaybeFriendPan${status.index }" style="margin-left: 20px; display: block;">
		</c:if>
		<c:if test="${status.index >=6 }">
			<div id="appendMaybeFriendPan${list.m_num }" class="appendMaybeFriendPan${status.index }" style="margin-left: 20px; display: none; ">
		</c:if>
			
			<div style="display:table-cell; vertical-align:middle;">
				
				<c:if test="${list.picture eq null }">
					<img  src="resources/my_frofile/noimage.jpg" width="70px" style="float:left;"  data-toggle="popover" data-trigger="click"
							title="
				</c:if>
				<c:if test="${list.picture ne null }">
					<img  src="resources/member_profile/${list.picture }" width="70px" style="float:left;"  data-toggle="popover" data-trigger="click"
							title="
				</c:if>	
						<c:if test="${list.picture eq null }">
							<img  src='resources/my_frofile/noimage.jpg' width='50px' >
						</c:if>
						<c:if test="${list.picture ne null }">
							<img  src='resources/member_profile/${list.picture }' width='50px'  >
						</c:if>	
							<a href='profile?num=${list.m_num}'>${list.name }</a> " 
							
							data-content="
								<div style='text-align:left;' >
									 <c:if test="${fn:length(list.together_friendNames) == 1 }">
									 	<img src='resources/friendIcon/together_friends.png' width='15px'>
									 	함께아는 친구 1명 :  
									 	
									 	<c:forEach items="${list.together_friendNames }" var="ff">
									 		
									 		<a href='profile?num=
									 			<fmt:parseNumber type='number' var='parsedNumber' value='${list.together_friendIds[0] } '/>
													${parsedNumber }
									 		'>${ff }</a>님 <br>
									 	
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
									 		<c:if test='${reson eq "같은 대학에 같은 전공이네요" }'>
									 			<img src='resources/friendIcon/school.png' width='15px'>${list.highschool }/${list.highschoolmajor }<br>
									 		</c:if>
									 	</c:forEach> 
								</div>
								<hr>
									<button type='button' class='btn_addFriend btn-default'   m_num='${list.m_num}'>
										<img src='resources/friendIcon/friend_plus3.png' width='20px'>친구 추가</button>
									 	">
						</div>
						
					
					
					
					<div style="display:table-cell; vertical-align:middle; width: 600px;">					
						<a href="profile?num=${list.m_num}">${list.name }</a> 
						<br>
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
									
									<a href="profile?num=
									<fmt:parseNumber type='number' var="parsedNumber" value='${list.together_friendIds[0] } '/>
									${parsedNumber }
									">
									
									${toghther_friendName }</a>님을 함께 알고 있습니다.<br>
								</c:forEach>
								
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
							 		<c:if test='${reson eq "같은 대학에 같은 전공이네요" }'>
							 			<img src='resources/friendIcon/school.png' width='15px'>${list.highschool }/${list.highschoolmajor }<br>
							 		</c:if>
						</c:forEach> 
						
						
					</div>
					
					<div id="friendReqeustBtn" style="display:table-cell; vertical-align:middle; ">
							<button type="button" class="btn_addFriend btn-default"    m_num="${list.m_num}">
								<img src="resources/friendIcon/friend_plus3.png" width="20px">친구 추가</button>
							<button type="button" class="btn_delFriend btn-default" m_num="${list.m_num}">삭제</button>
					</div>
					
					<div id="friendReqeustCancleBtn"  style="display:none;  vertical-align: middle;">
							<button type="button" class="maybeFriendRequestCancleBtn btn-default" data-toggle="tooltip" data-placement="auto" title="클릭시 친구요청 취소"    m_num="${list.m_num}">
								<img src="resources/friendIcon/response_Friend.png" width="20px">친구 요청 전송됨
								</button>
					</div>
					<hr style="margin-left: 10px; margin-right: 10px; color: #E0E7FC">
		</div>
		
	</c:forEach>
	
	<%-- <div id="right_friendList">
	<%@include file="../friendList.jsp" %>
	</div> --%>
</div>
</div>


<script>

//요청한 친구 친구신청 취소 -- 알수도있는 친구창에서 친구취소시
$('.maybeFriendRequestCancleBtn').click(function(){
	var m_num=$(this).attr("m_num");
	$('#appendMaybeFriendPan'+m_num).remove();
	$.ajax({
		type:'post',
		url:'deleteFrinedRequest',
		data: {"m_num": m_num},
		success : function(data){
		}
	});
})

//요청한 친구 친구신청 취소
$('.reqeustFriendCancleBtn').click(function(){
	var m_num=$(this).attr("m_num");
	$('#appendRequestFriendDiv'+m_num).remove();
	$.ajax({
		type:'post',
		url:'deleteFrinedRequest',
		data: {"m_num": m_num},
		success : function(data){
		}
	});
})


	//친구요청받은거  삭제 
	$('.requestedFriendCancleBtn').click(function(){
		var m_num=$(this).attr("m_num");
		$('#appendRequestedFriendDiv'+m_num).remove();
		$.ajax({
			type:'post',
			url:'deleteFrinedRequested',
			data: {"m_num": m_num},
			success : function(data){
			}
		});
	})//친구요청받은거  삭제   END
	
	//친구 요청받은거 수락
	$('.requestFriendAcceptBtn').click(function(){
		var m_num=$(this).attr("m_num");
		$('#appendRequestedFriendDiv'+m_num).remove();
		$.ajax({
			type : 'post',
			url : 'friendInsert',
			data : {
				"m_num" : m_num
			}
		});
		$.ajax({
			type : 'post',
			url : 'requestFriendReadNoti',
			data : {
				"m_num" : m_num
			}
		});
	})//친구 요청받은거 수락 End

//친구요청 받은 div 보기
$('#changeFriendRequestdiv').click(function(){
	$('#newFriendRequestedDiv').css("display","none");
	$('#newFriendRequestDiv').css("display","block");
})

//친구 요청한 div 보기
 $('#changeFriendRequestdiv2').click(function(){
	$('#newFriendRequestedDiv').css("display","block");
	$('#newFriendRequestDiv').css("display","none");
})
 

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
    $('[data-toggle="popover"]').popover({placement: "right",html: true});   
});



var index=6;
//알수도있는 친구목록에서 삭제 안보이게하기! 
$(document).on('click','.btn_delFriend',function(){
	var obj = $(this);
	var m_num = obj.attr("m_num");
	$('#appendMaybeFriendPan'+m_num).remove();
	
	
	$('.appendMaybeFriendPan'+index).css("display","block");
	index +=1;
});

//친구추가 버튼 클릭시!
$(document).on('click','.btn_addFriend',function(){
	var obj = $(this);
	var m_num = obj.attr("m_num");
	$.ajax({
		type:'post',
		url:'friendInsert_maybeout',
		data: {"m_num": m_num,"maybe":"maybe"},
		success : function(data){
			$('#appendMaybeFriendPan'+m_num+' #friendReqeustBtn').remove();
			$('#appendMaybeFriendPan'+m_num+' #friendReqeustCancleBtn').css("display","table-cell");
		},
		error : function(){
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

</script>


</body>
</html>