<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->
<html>
<head></head>
<body>
<c:forEach var="details" items="${detail}">
   <div id="image&video"
      style="float: left; width: 650px; height: 600px;">
      <c:if test="${details.picture!='picture'}">
         <img src="./resources/upload/${details.picture }" style="width: 600px; height: 500px; visible: true;" name="image">
      </c:if>
      <c:if test="${details.video!='video'}">
         <video src="./resources/upload/${details.video }" controls="controls" autoplay="autoplay" id="videos" name="videos" width="600px;" height="500px;">
      </c:if>
      <c:if test="${details.place!='place'}">
         <label name="place">${details.place}</label>
      </c:if>
   </div>
   
   <div id="text" style="height:500px; width: 450px; position:absolute; right: 10px;">

   	<table style="border: 1px solid white;  background-color: rgb(225, 227, 228);">

		<div style=" border: 1px solid #ECECEC; height: 170px;">
			<input type="hidden" name="board_num"  value="${details.board_num}"> 
			<input type="hidden" name="m_num" value="${details.m_num}">
			<div>
				<a href="profile?num=${details.m_num}">
						<c:if test="${details.memberPicture eq null }">
							<img alt="" src="resources/member_profile/noimage.jpg" width="40" height="40" style="margin: 10px;">
						</c:if>	
						<c:if test="${details.memberPicture ne null }">	
							<img alt="" src="resources/member_profile/${details.memberPicture }" width="40" height="40" style="margin: 10px;">
						</c:if>
					</a>
				<a href="profile?num=${details.m_num}">${details.writer_name } </a>
		    	
			    	${details.reg_date}
			    	<c:choose>
						<c:when test="${details.open_level==0}">
							<span style="font-size:9pt; color: #9197a3;">· 전체공개</span>
						</c:when>
						<c:when test="${details.open_level==1}">
							<span style="font-size:9pt; color: #9197a3;">· 친구공개</span>
						</c:when>
						<c:when test="${details.open_level==2}">
							<span style="font-size:9pt; color: #9197a3;">· 나만보기</span>
						</c:when>
					</c:choose>
		    	
			</div>
	
			<div style="padding: 5px;">
				<label name="content">${details.content}</label>
			</div>
		</div>
      
      <tr>
         <td>
           <form action="replyinsert" method="post" id="reply_form">
           		<input type="hidden" value="${details.board_num }" name="board_num" id="board_num">
				<input type="hidden" value="${board.m_num }" name="w_m_num" id="m_num2">
				
				<div style="background-color: #E1E3E4; border-bottom: 1px solid #D2D6DA;">
					<c:if test="${sessionScope.loginUser.picture eq null}">
								<img alt="" src="resources/img/noimg.jpg" width="38" height="38">
							</c:if>
							<c:if test="${sessionScope.loginUser.picture ne null}">
								<img alt="" src="resources/member_profile/${sessionScope.loginUser.picture}" width="38" height="38">
							</c:if>
					<input type="text" size="40" name="reply" id="reply" onkeyup="javaScript:replyinsert(${details.board_num})"> 
				</div>
			</form>
						
						
						<!-- 댓글 리스트 -->
						<div class="reply_list_container"
							style="overflow: scroll; height: 300px;  background-color: #ECECEC;">
							<c:forEach var="reply" items="${details.replyList}" varStatus="i">
								<div class="reply_item"
									style="border: 1px solid yellw; margin: 1px; margin-top: 5px;">
									<div style="float: left; width: 38px; height: 38px;">
										<c:if test="${reply.r_picture eq null }">
											<img alt="" src="resources/img/noimg.jpg" width="38" height="38">
										</c:if>
										<c:if test="${reply.r_picture ne null }">
											<img alt="" src="resources/member_profile/${reply.r_picture}" width="38" height="38">
										</c:if>
									</div>
									<div>
										<a href="profile?num=${reply.m_num }">${reply.r_name}</a>
										${reply.r_date }
									</div>
									<script type="text/javascript">
											function removereply(num){
												if (confirm("댓글을 정말 삭제하시겠습니까?") == true){    //확인
												    location.href='deletereply?reply_num='+num
												}else{   //취소
												    return;
												}
											}
											</script>
									<div>${reply.r_content}
										<c:if test="${reply.m_num==sessionScope.loginUser.m_num }">
											<div style="float: right;">
												<button id="modi${reply.reply_num}">수정</button>
											<input type="button" value="삭제"
													onclick="removereply(${reply.reply_num })">
											</div>
										</c:if>
									</div>
									<%-- <div style="float: left;">
										<button>좋아요</button>
										<button id="r_comment${reply.reply_num }">답글달기</button>
									</div> --%>
									<c:set var="i" value="${reply.reply_num}" />

									<br>
									<div id="update${reply.reply_num}" style="display: none;">
										<form action="updatereply?reply_num=${reply.reply_num }"
											method="post" id="update_reply_form">
											<img alt="" src="resources/img/noimg.jpg" width="38"
												height="38" style="float: left"><input type="text"
												size="40" name="update_reply" id="update_reply"
												value="${reply.r_content}" style="float: left"><input
												type="hidden" value="${reply.reply_num }"
												name="up_reply_num" id="up_reply_num"><input
												type="hidden" value="${reply.board_num }" name="board_num"
												id="board_num">
										</form>
										<img src="resources/cancel.png"
											id="cancel_update${reply.reply_num }" width="20px"
											height="20px" style="float: left; margin-left: 5px;" />
									</div>
									<script>
										$("#modi${i}").click(function(){
								       	 	$("#update${i}").show();
								    	});
									
										$("#cancel_update${i}").click(function(){
								       		 $("#update${i}").hide();
										});
									</script>
									
									<div id="r_coment_area${reply.reply_num }"
										style="display: none;">
										<div width="30px"></div>
										<form action="replyinsert_sub" method="post">
											<img alt="" src="resources/img/noimg.jpg" width="38"
												height="38" onkeyup="replyinsert2"><input
												type="hidden" value="${reply.board_num }" name="board_num"
												id="board-num"><input type="hidden"
												value="${reply.reply_num }" name="r_co" id="r_co"><input
												type="hidden" value="${reply.m_num }" name="m_num"
												id="m_num"><input type="text" size="40"
												name="replycoment" id="replycoment"><img
												src="resources/cancel.png"
												id="cancel_r_comment${reply.reply_num }" width="20px"
												height="20px" style="margin-left: 5px;" />
										</form>

									</div>
									<script>
										$("#r_comment${i}").click(function(){
								       	 	$("#r_coment_area${i}").show();
								    	});
									
										$("#cancel_r_comment${i}").click(function(){
								       		 $("#r_coment_area${i}").hide();
								    	});
									</script>
								</div>
								
							</c:forEach>
         </td>
      </tr>
   </table>
   </div>
</c:forEach>
</body>
</html>