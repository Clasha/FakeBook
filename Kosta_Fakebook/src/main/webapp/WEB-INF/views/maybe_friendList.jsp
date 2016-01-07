<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>

<style>
html, body {
	background: #dddddd;
}
.tooltip-inner {width: 650px; !important; }
</style>

<body>
<div style="width: 280px; height: 20px; border-bottom: 1px solid #e6e6e6; "></div>
<div style="margin: 5px;">
	<span style="margin: 2px; font-weight: bold; color: #9197a3; font-size: 10pt;">알수도 있는 사람</span> 
	<span style="font-weight: bold; font-size: 10pt;"> <a href="maybeAllFriendPage">모두보기</a></span>
</div>

<!-- <h6>
	<font color="#9197a3">알수도 있는 사람   <a href="maybeAllFriendPage">모두보기</a></font>
</h6> -->
			 <c:forEach items="${my_maybeFriendList }" var="list" varStatus="status">
			 	<!-- div 5개만 보여주기 삭제 눌렀을시에 새로운것 보여주기위해서 -->
			 	<c:if test="${status.index <6 }">
					<div id="maybe_friendPanel${list.m_num }" class="maybe_friendPanel${status.index }" style="margin-bottom:20px; display: block;">
				</c:if>
				<c:if test="${status.index >=6 }">
					<div id="maybe_friendPanel${list.m_num }" class="maybe_friendPanel${status.index }" style="margin-bottom:20px; display: none; ">
				</c:if>
				
				<span  m_num="${list.m_num }" onclick="delete_maybe_friendPanel(this)" onmouseover="changeBackground(this)" onmouseout="changeBackground2(this)"  style="float: right;  margin-right: 30px; color: #9CC0FF; cursor: pointer;">x</span>
					<a href="#" data-toggle="popover" data-trigger="click"
					title="
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
						<hr>
							<button type='button' class='btn_addMaybeFriend btn-default'   m_num='${list.m_num}'>
								<img src='resources/friendIcon/friend_plus3.png' width='20px'>친구 추가</button>
							 	">
							 	
						<c:if test="${list.picture == null }"> 
							<img  src="resources/my_frofile/noimage.jpg" width="50px" style="display: inline;">
						</c:if>
						<c:if test="${list.picture ne null }"> 
							<img  src="resources/member_profile/${list.picture }" height="50px;" width="50px" style="display: inline;">
						</c:if>	
					</a>
					
	
					
					<div style="display: inline-block; position: absolute;  font-size: 9pt; padding: 3px; ">					
						<a href="profile?num=${list.m_num}">${list.name }</a> 
						<br>

						<c:if test="${fn:length(list.together_friendNames) >1 }">
							<span id="maybe_friendsList" class="test" href="#" data-toggle="tooltip" data-html="true"   data-placement="top" 
							title="함께아는 친구 <br>
							  <c:forEach items="${list.together_friendNames }"  end="4" var="friends">
							 		${friends } <br>
							 	</c:forEach>">
								<img src='resources/friendIcon/together_friends.png' width='15px'>
								함께아는 친구 ${fn:length(list.together_friendNames) }명
							</span><br>
						</c:if>
						
						<c:if test="${fn:length(list.together_friendNames) == 1 }">
								<img src='resources/friendIcon/together_friends.png' width='15px'>
								<c:forEach items="${list.together_friendNames }" var="toghther_friendName">
									<a href="profile?num=${list.together_friendIds[0]}">${toghther_friendName }</a>님을 함께 알고 있습니다.<br>
								</c:forEach>
						</c:if>
						
						<div style=" display: inline; position: fixed; border: non">
							<button type="button" class="btn_addMaybeFriend btn-default"   m_num="${list.m_num}" 
							style="height: 25px; background: #FBFBFB; color: black; font-size: 12px; padding: 5px; border: solid #E9E9EA 1px; text-decoration: none; ">
							<img src="resources/friendIcon/friend_plus3.png" width="18" style="vertical-align: middle;">친구 추가</button>
						</div>
						
					</div>
				</div>
		</c:forEach>
		
		
		<script>
		
		
		function changeBackground(object){
			var obj = object;
			$(obj).css("background-color","#CEDEFB");
			$(obj).css("color","white");
		}
		
		function changeBackground2(object){
			var obj = object;
			$(obj).css("background-color","white");
			$(obj).css("color","#9CC0FF");
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
		
		
	
		
		
		$(document).ready(function(){
		    $('[data-toggle="tooltip"]').tooltip({placement: "right"});   
		    $('[data-toggle="popover"]').popover({placement: "left",html: true});   
		});
		</script>
</body>
</html>