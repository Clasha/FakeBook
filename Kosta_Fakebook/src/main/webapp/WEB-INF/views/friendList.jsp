<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
html, body {
	background: #dddddd;
}
</style>
</head>
<body>

<c:forEach items="${sessionScope.friendList }" var="list" varStatus="status">
	<div id="friendPan${list.m_num }" onmouseout="backGroundChange2(${list.m_num})"  onmouseover="backGroundChange(${list.m_num})"  style="margin-bottom:5px; margin-top:5px; display: block;"
	data-toggle="popover2" data-trigger="click"  data-content="
		<div style='display: table-cell; vertical-align: middle;'>
			<c:if test="${list.picture ==null }">
				<img src='resources/my_frofile/noimage.jpg' width='70px'>
			</c:if>
			<c:if test="${list.picture != null }">
				<img src='resources/member_profile/${list.picture }' width='70px'>
			</c:if>
		</div>
		<div style='display: table-cell; vertical-align: middle;'>
			<a href='profile?num=${list.m_num }'>${list.name }</a> <br>
			<c:if test="${fn:length(list.recentlyNotiIds) >1 }" >
						<c:forEach items="${list.recentlyNotiNames }" var="recentlyNotiNames" end="0">
							<h6><img src='resources/friendIcon/together_friends.png' width='15px'>
							<a href='profile?num=${list.recentlyNotiIds[0] }'>${recentlyNotiNames }</a>님 
							 포함  ${fn:length(list.recentlyNotiIds) }명과 친구가 되었습니다.</h6>
						</c:forEach>
					</c:if>
					<c:if test="${fn:length(list.recentlyNotiIds) == 1 }" >
						<c:forEach items="${list.recentlyNotiNames }" var="recentlyNotiNames" end="0">
							<h6><img src='resources/friendIcon/together_friends.png' width='15px'>
							<a href='profile?num=${list.recentlyNotiIds[0] }'>${recentlyNotiNames }</a>님 
							과 친구가 되었습니다.</h6>
						</c:forEach>
					</c:if>
			<c:if test="${fn:length(list.togetherFriendNames) >1 }" >
				<c:forEach items="${list.togetherFriendNames }" var="togetherFriendNames" end="0">
					<h6><img src='resources/friendIcon/together_friends.png' width='15px'>
					<a href='profile?num=${list.togetherFriendIds[0] }'>${togetherFriendNames }</a>
					님  포함  ${fn:length(list.togetherFriendIds) }명을 함께 알고 있습니다.</h6>
				</c:forEach>
			</c:if>
			<c:if test="${fn:length(list.togetherFriendNames) ==1 }" >
				<c:forEach items="${list.togetherFriendNames }" var="togetherFriendNames" end="0">
					<h6><img src='resources/friendIcon/together_friends.png' width='15px'>
					함께 아는 친구 : <a href='profile?num=${list.togetherFriendIds[0] }'>${togetherFriendNames }</a> 님 </h6>
				</c:forEach>
			</c:if>
		</div>
		
	">				
			<c:if test="${list.picture ==null }">
				<div style="display: table-cell; vertical-align: middle; padding: 2px;">
					<img src="resources/my_frofile/noimage.jpg" width="35" height="35" style=" margin: 3px ">
				</div>
			</c:if>
			<c:if test="${list.picture !=null }">
				<div style="display: table-cell; vertical-align: middle; padding: 2px;">
					<img src="resources/member_profile/${list.picture }" width="35" height="35" style=" margin: 3px ">
				</div>
			</c:if>
			
			<div style="display: table-cell; vertical-align: middle; margin-left: 20px;">
				<span style="margin: 10px; font-size: 9pt; ">${list.name }</span>
			</div>
		</div>
</c:forEach>


<script>
function backGroundChange(m_num){
	$('#friendPan'+m_num).css("background-color","#C7CBC3");
}
function backGroundChange2(m_num){
	$('#friendPan'+m_num).css("background-color","#dddddd");
}

$(document).ready(function(){
    $('[data-toggle="popover2"]').popover({placement: "bottom",html: true}); 
    
});
$(document).ready(function(){
    $('[data-toggle="popover"]').popover({placement: "bottom",html: true});   
    $( '#jb-tabs' ).tabs();
});

$(document).on('click','.btn_outFriend',function(){
	var obj = $(this);
	var m_num = obj.attr("m_num");
	$.ajax({
		type:'post',
		url:'FriendDelete',
		data: {"m_num": m_num},
		success : function(data){
			$('#FriendPan'+m_num).remove();
			$('#noneFriendPan'+m_num).css("display","table-cell");
		},
		error : function(){
			alert('에러');
		}
	});
});


//알수도있는 친구목록에서 친구추가시
$(document).on('click','.btn_addMaybeFriend',function(){
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


//친구추가 버튼 클릭시!
$(document).on('click','.btn_addFriend',function(){
	var obj = $(this);
	var m_num = obj.attr("m_num");
	$.ajax({
		type:'post',
		url:'friendInsert_maybeout',
		data: {"m_num": m_num,"maybe":"maybe"},
		success : function(data){
			$('#FriendPan'+m_num).remove();
			$('#noneFriendPan'+m_num).css("display","table-cell");
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

//친구추가 버튼 클릭시!
$(document).on('click','.profile_FriendAdd',function(){
   var obj = $(this);
   var m_num = obj.attr("m_num");
   var flag = obj.attr("id");
   if(flag == "friendRequest"){
      alert("내가건 친구 삭제하자 id :"+flag +" m_num : "+m_num);
      $.ajax({
         type:'post',
         url:'deleteFrinedRequest',
         data: {"m_num": m_num},
         success : function(data){
         }
      });
      
      $('.profile_FriendAdd').attr("id"," ");
      $('.profile_FriendAdd').html("<img src='resources/friendIcon/friend_plus3.png' width='20px'>친구 추가");
   }else{
      $.ajax({
         type:'post',
         url:'friendInsert_maybeout',
         data: {"m_num": m_num,"maybe":"maybe"},
         success : function(data){
            $('.profile_FriendAdd').attr("id","friendRequest");
            $('.profile_FriendAdd').html("<img src='resources/friendIcon/response_Friend.png' width='20px'>친구전송 요청중");
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
   }
   
});
  

//친구삭제 버튼 클릭시!
$(document).on('click','.profile_FriendDel',function(){
   var obj = $(this);
   var m_num = obj.attr("m_num");
   
      $.ajax({
         type:'post',
         url:'FriendDelete',
         data: {"m_num": m_num},
         success : function(data){
            $('.profile_FriendDel').html("<img src='resources/friendIcon/friend_plus3.png' width='20px'>친구추가");
            $('.profile_FriendDel').attr("class","profile_FriendAdd");
         },
         error : function(){
            alert('에러');
         }
      });
});
</script>
</body>
</html>