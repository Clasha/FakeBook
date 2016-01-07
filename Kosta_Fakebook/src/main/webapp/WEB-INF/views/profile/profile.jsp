<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
  jQuery( document ).ready( function() {
    $( '#jb-tabs' ).tabs();
  } );
</script>
 
 <script type="text/javascript">
/*  	$(window).scroll(
	function() {
		if ($(window).scrollTop() >= $(document).height()
				- $(window).height()-1) {
			var count = $('.board_item_container').size();
			lastPostFunc(count);
		}
	});

	var stateOfSscroll = false;
	function lastPostFunc(count) {
		if (!stateOfSscroll) {
			stateOfSscroll = true;
			$.ajax({
				type : "get",
				url : "selectMoreBoard",
				data : "count=" + count,
				dataType : "html",
				success : function(data) {
					if (data.trim() == "") {
						alert("return null");
					} else {
						$('#boardListContainer').append(data);
						stateOfSscroll = false;
					}
				},
				error : function() {
					alert('스크롤 에러 :error while request..');
				}
			});
		}
	}; 
	 */

	//게시글 [좋아요] 버튼 클릭
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
				//obj.html('좋아요'+bLikeCount);
				obj.html(" <img src='resources/img/like.png' width='15' height='15' style='vertical-align: middle;'> " 
				+ "좋아요 <span style='vertical-align: middle;'>" +bLikeCount +"</span>");
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
				//obj.html(" <span style='vertical-align: middle;'>좋아요  "+bLikeCount +"</span>");
				obj.html(" <img src='resources/img/notlike.png' width='15' height='15' style='vertical-align: middle;'> " 
						+ "좋아요 <span style='vertical-align: middle;'>" +bLikeCount +"</span>");
			},
			error : function() {
				alert('Board Like Cancle Error');
			}
		});
	});
</script>

 <style type="text/css">
body {
	background: #dddddd;
}

.proifile_left {
	float:left; 
	width: 290px; 
	height:720px;
}

.proifile_center {
	float:left; 
	width:870px; 
	padding:1px;
}

.proifle_main {
	background-image:url("resources/img/prayforparis.png");

	height:270px;
	 background-color:#FCFCFC; 
}

.timeLine {
	height: 65px; background-color:white; position: relative; top: 53px; 
}

.proifle_mypicture {
	width:150px; 
	height:150px; 
	left:40px;  
	position: relative; 
	top: 100px; 
	z-index:2; 
	background-color:#FFBABA;
}

.member_name {
	display: inline-block;
	position: absolute;
	margin-left:250px;
	font-size: 20pt;
}

.member_friendBtn{
	display: inline-block;
	position: absolute;
	margin-left:500px;
	cursor: pointer;
}

.proifle_info {
	width: 320px; 
	height: 700px; 
	float: left;
}

.brithTitle {
	border: 1px solid red; 
	margin: 1px; 
	height: 40px; 
	line-height: 40px; 
	border: 1px solid; 
	background-color: white;
	border-color: white;
}

.brithTitle span {
	margin-left: 20px;
	font-size: 10pt;
}

.friendTitle {
	background-color: #f6f7f8;
	height:40px; 
	line-height:40px; 
	border:1px solid; 
	border-color: #e5e6e9 #dfe0e4 #d0d1d5; 
}

.friendTitle span {
 	color: black;
 	font-size: 10pt;
 	margin-left: 20px;
}


.friendName {
	color: white;
}

.proifle_sub {
	border:1px solid; 
	background-color: #FCFCFC ; 
	font-family:Times ; 
	font-size:10.5pt; 
	border-color: #e5e6e9 #dfe0e4 #d0d1d5; 
	text-align:center; 
	height:25px;
}

ul{ 
	list-style-type:none;	/* 점 없애기*/
 	font-size: 20px;
	padding: 0px;
}

li{ 
	display:inline;		/*  메뉴 모양(세로 -> 가로) 변경 */
	float:left;
	margin:0px;
	padding: 1px;
	font-size: 9pt;
	text-align: center;
	bottom:125px; 
	color: white;

}


 .myFrofileList {
	padding-left: 250px; 
	height: 65px;
}



.Liststyle {
	border-right: 1px solid #e9eaed; 
	font-size: 15px; 
	line-height: 4.37; 
	padding: 0 17px;  
	float: left;
}

 .myFrofileList a { 
 	text-decoration:none; 
	color: black;
	font-weight: bold;
	
}

.myFrofileList span {
	color: gray;
	font-size:8pt;
}

.profile_FriendAdd {
  background: #f6f7f8;
  color: black;
  font-size: 12px;
  font-weight:bold;
  padding: 3px 11px 4px 11px;
  border: solid  1px;
      border-color: #cccccc #c5c6c8 #b6b7b9;
  text-decoration: none;
  text-align: center;
  }
  
  .profile_FriendDel {
  background: #f6f7f8;
  color: black;
  font-size: 12px;
  font-weight:bold;
  padding: 3px 11px 4px 11px;
  border: solid  1px;
      border-color: #cccccc #c5c6c8 #b6b7b9;
  text-decoration: none;
  text-align: center;
  }
</style>
</head>


<body>
<div class="proifile_left"></div>

<c:forEach items="${myProfile}" var="member">
	<div class="proifile_center"  id="jb-tabs">
		<div class="proifle_main" > 
			<div class=proifle_mypicture>
				<c:if test="${member.picture eq null}">
					<img alt="" src="${pageContext.request.contextPath}/resources/member_profile/noimage.jpg" width="150" height="150">
				</c:if>
				<c:if test="${member.picture ne null}">
					<img alt="" src="${pageContext.request.contextPath}/resources/member_profile/${member.picture }" width="150" height="150">
				</c:if>
			</div>
			
			<div class=member_name>${member.name}</div>
			
			<c:if test="${!flag }">
				<c:if test="${!requestingFriend }">
					<c:if test="${sessionScope.loginUser.m_num != member.m_num}">
					<div class="member_friendBtn">
						<button style="margin-left: 200px;" m_num=${member.m_num } class="profile_FriendAdd">
						<img src="resources/friendIcon/check.png" width="15px">친구추가</button>
					</div>
					</c:if>
				</c:if>
				<c:if test="${requestingFriend }">
					<div class="member_friendBtn">
							<button style="margin-left: 200px;" m_num=${member.m_num } class="profile_FriendAdd" id="friendRequest">
							<img  src="resources/friendIcon/response_Friend.png" width="20px">친구전송 요청중</button>
					</div>
				</c:if>
			</c:if>
			
			<c:if test="${flag }">
				<div class="member_friendBtn">
					<button style="margin-left: 200px;" m_num=${member.m_num } class="profile_FriendDel">
					<img  src="resources/friendIcon/friendOut.png"   width="20px">친구 끊기
					</button>
				</div>
			</c:if>
			
			<div  class="timeLine" >
				<div  class="myFrofileList"  style=" padding-left: 250px; height: 65px;">
					<div class="Liststyle">&nbsp;</div>
					<ul>
				        <li><a href="#info-1" class="Liststyle">타임라인</a></li>
				        <li><a href="#info-3"  class="Liststyle">친구 
				        <c:if test="${sessionScope.loginUser.m_num != member.m_num}">
					        <c:if test="${fn:length(friend_profile_togetherList) > 0  }">
					        	<span style="size: 1px;">함께 아는 친구 ${fn:length(friend_profile_togetherList) } 명</span>
					        </c:if>
					        <c:if test="${fn:length(friend_profile_togetherList) == 0  }">
					        	<span >${fn:length(no_togetherFriends)}<span> 
					        </c:if>
					      </c:if>
				        </a></li>
				        <li><a href="#info-4"  class="Liststyle">사진</a></li>
				      </ul>
				</div>
			</div>
		</div>
		
		<br />
		
		<div  id="info-1" >
			<div class="proifle_info"  >	
			
				<div style="height: 5px;"></div>
				
				<div class="brithTitle">
					<span><fmt:formatDate value="${member.birthday}" type="both" pattern="yyyy년 MM월 dd일"/> 출생 </span>
				</div>
				
				<div style="height: 5px;"></div>
				
				<div style="margin: 1px; ">
				
				<div class="friendTitle" >
					<span> 
						친구 
						<c:if test="${fn:length(my_profile_friendList) > 0 }">
							 · <font color="#BDBDBD" size="1px">${fn:length(my_profile_friendList)}</font>
						</c:if>
						<c:if test="${fn:length(friend_profile_togetherList) > 0 }">
							 · <font color="#BDBDBD" size="1px"> ${fn:length(friend_profile_togetherList) + fn:length(no_togetherFriends)}
							(함께아는 친구 ${fn:length(friend_profile_togetherList)})</font>
						</c:if>
					</span>
				</div>
				
				<ul style=" height:317px; background-color: white; margin: 0px; padding: 3px; ">
					<!-- 내프로필일시 돌리기! -->
					<c:if test="${fn:length(my_profile_friendList) > 0 }">
						<c:forEach items="${my_profile_friendList}" var="myfriendPicture" begin="0" end="8">
							<li style="margin: 2px;">
								<a href="profile?num=${sessionScope.loginUser.m_num}&fnum=${myfriendPicture.m_num}">
									<div style="background: #BDBDBD; opacity: 0.8;">
										<span style=" color: white; text-align: center;">
										<img src="resources/friendIcon/together_friends.png" width="15px" >${myfriendPicture.name}</span>
									</div>
								</a>	
								
								<c:if test="${myfriendPicture.picture eq null }">
									<img alt="" src="resources/my_frofile/noimage.jpg" width="97" height="81" 
								</c:if>
								
								<c:if test="${myfriendPicture.picture ne null }">
									<img alt="" src="resources/member_profile/${myfriendPicture.picture}" width="97" height="81" 
								</c:if>
								
								data-toggle="popover" data-trigger="click"
									title="
						 		<div style='display:table-cell; vertical-align:middle;'>
									<c:if test='${myfriendPicture.picture eq null }'>
										<img  src='resources/my_frofile/noimage.jpg' width='80px'>
									</c:if>
									<c:if test='${myfriendPicture.picture ne null }'>
										<img  src='resources/member_profile/${myfriendPicture.picture}' width='80px'>
									</c:if>
								</div>
								<!-- popover안에 개인 이름과 정보들 -->
								<div style='display:table-cell; vertical-align:middle; width: 200px;'>
									<a href='profile?num=${myfriendPicture.m_num}'>${myfriendPicture.name }</a>
									<br><br>
									<font color='black'>
									<h6>
									<c:if test='${fn:length(myfriendPicture.recentlyNotiNames) > 1  }'>
											<img src='resources/friendIcon/together_friends.png' width='15px'>
											<a href='profile?num=${myfriendPicture.recentlyNotiIds[0] }'>${myfriendPicture.recentlyNotiNames[0] }</a> 
											외 ${fn:length(myfriendPicture.recentlyNotiNames) }명과 친구가 되었습니다.<br>
									</c:if>
									<c:if test='${fn:length(myfriendPicture.recentlyNotiNames) == 1  }'>
											<img src='resources/friendIcon/together_friends.png' width='15px'>
											최근 친구 관계를 맺었습니다 : <a href='profile?num=${myfriendPicture.recentlyNotiIds[0] }'>${myfriendPicture.recentlyNotiNames[0] }</a>님<br>
									</c:if>
									<c:if test='${fn:length(myfriendPicture.togetherFriendNames) > 1  }'>
											<img src='resources/friendIcon/together_friends.png' width='15px'>
											<a href='profile?num=${myfriendPicture.togetherFriendIds[0] }'>${myfriendPicture.togetherFriendNames[0] }</a> 
											님을 포함하여 함께아는 친구 ${fn:length(myfriendPicture.togetherFriendNames) }명<br>
									</c:if>
									<c:if test='${fn:length(myfriendPicture.togetherFriendNames) == 1  }'>
											<img src='resources/friendIcon/together_friends.png' width='15px'>
											함께 아는 친구 : <a href='profile?num=${myfriendPicture.togetherFriendIds[0] }'>${myfriendPicture.togetherFriendNames[0] }</a>님<br>
									</c:if>
									</h6>
									</font>
								</div>
							</div>
						">
								
							</li>
							</c:forEach>
						</c:if>
						
						
						<!-- 친구의 프로필일시!!! -->
						<c:if test="${fn:length(friend_profile_togetherList) > 0 }">
							<c:forEach items="${friend_profile_togetherList}" var="myfriendPicture" begin="0" end="8">
								<li>
									<a href="profile?num=${sessionScope.loginUser.m_num}&fnum=${myfriendPicture.m_num}">
										<div style="background: #BDBDBD; opacity: 0.8;">
											<span style=" color: white; text-align: center;">
											<img src="resources/friendIcon/together2.png" width="15px" >${myfriendPicture.name}</span>
										</div>
									</a>
									<c:if test="${myfriendPicture.picture eq null }">
											<img alt="" src="resources/my_frofile/noimage.jpg" width="97" height="81" 
									</c:if>
									<c:if test="${myfriendPicture.picture ne null }">
											<img alt="" src="resources/member_profile/${myfriendPicture.picture}" width="97" height="81" 
									</c:if>
									data-toggle="popover" data-trigger="click"
														title="
														 		<div style='display:table-cell; vertical-align:middle;'>
																	<c:if test='${myfriendPicture.picture eq null }'>
																		<img  src='resources/my_frofile/noimage.jpg' width='80px'>
																	</c:if>
																	<c:if test='${myfriendPicture.picture ne null }'>
																		<img  src='resources/member_profile/${myfriendPicture.picture}' width='80px'>
																	</c:if>
																</div>
																<!-- popover안에 개인 이름과 정보들 -->
																<div style='display:table-cell; vertical-align:middle; width: 200px;'>
																	<a href='profile?num=${myfriendPicture.m_num}'>${myfriendPicture.name }</a>
																	<br><br>
																	<font color='black'>
																	<h6>
																	<c:if test='${fn:length(myfriendPicture.recentlyNotiNames) > 1  }'>
																			<img src='resources/friendIcon/together_friends.png' width='15px'>
																			<a href='profile?num=${myfriendPicture.recentlyNotiIds[0] }'>${myfriendPicture.recentlyNotiNames[0] }</a> 
																			외 ${fn:length(myfriendPicture.recentlyNotiNames) }명과 친구가 되었습니다.<br>
																	</c:if>
																	<c:if test='${fn:length(myfriendPicture.recentlyNotiNames) == 1  }'>
																			<img src='resources/friendIcon/together_friends.png' width='15px'>
																			최근 친구 관계를 맺었습니다 : <a href='profile?num=${myfriendPicture.recentlyNotiIds[0] }'>${myfriendPicture.recentlyNotiNames[0] }</a>님<br>
																	</c:if>
																	<c:if test='${fn:length(myfriendPicture.togetherFriendNames) > 1  }'>
																			<img src='resources/friendIcon/together_friends.png' width='15px'>
																			<a href='profile?num=${myfriendPicture.togetherFriendIds[0] }'>${myfriendPicture.togetherFriendNames[0] }</a> 
																			님을 포함하여 함께아는 친구 ${fn:length(myfriendPicture.togetherFriendNames) }명<br>
																	</c:if>
																	<c:if test='${fn:length(myfriendPicture.togetherFriendNames) == 1  }'>
																			<img src='resources/friendIcon/together_friends.png' width='15px'>
																			함께 아는 친구 : <a href='profile?num=${myfriendPicture.togetherFriendIds[0] }'>${myfriendPicture.togetherFriendNames[0] }</a>님<br>
																	</c:if>
																	</h6>
																	</font>
																</div>
															</div>
														">
								</li>
							</c:forEach>
						</c:if>
						
						<c:if test="${fn:length(no_togetherFriends) > 0 }">
							<c:forEach items="${no_togetherFriends}" var="myfriendPicture" begin="0" end="8">
								<li>
									<a href="profile?num=${sessionScope.loginUser.m_num}&fnum=${myfriendPicture.m_num}">
										<div style="background: black; opacity: 0.8;">
											<span style=" color: white; text-align: center;">${myfriendPicture.name}</span>
										</div>
									</a>
									<c:if test="${myfriendPicture.picture == null }">
											<img alt="" src="resources/my_frofile/noimage.jpg" width="97" height="81" 
									</c:if>
									<c:if test="${myfriendPicture.picture != null }">
											<img alt="" src="resources/member_profile/${myfriendPicture.picture}" width="97" height="81" 
									</c:if>
									data-toggle="popover" data-trigger="click"
														title="
																<!-- popover안에 이미지틀!! -->
														 		<div>
																<div style='display:table-cell; vertical-align:middle;'>
																	<c:if test='${myfriendPicture.picture eq null }'>
																		<img  src='resources/my_frofile/noimage.jpg' width='80px'>
																	</c:if>
																	<c:if test='${myfriendPicture.picture ne null }'>
																		<img  src='resources/member_profile/${myfriendPicture.picture}' width='80px'>
																	</c:if>
																</div>
																<!-- popover안에 개인 이름과 정보들 -->
																<div style='display:table-cell; vertical-align:middle; width: 200px;'>
																	<a href='profile?num=${myfriendPicture.m_num}'>${myfriendPicture.name } </a>
																	<br><br>
																	<font color='black'><h6>
																		<c:if test='${flag }'>
																			<img src='resources/friendIcon/together_friends.png' width='15px'>
																			함께아는 친구 :
																			<c:forEach items='${myProfile }' var='f'>
																				<a href='profile?num=${f.m_num }'>${f.name }</a>
																			</c:forEach>님 <br>
																		</c:if>
																		<c:if test='${myfriendPicture.school ne null }'>
																			<img src='resources/friendIcon/school.png' width='15px'>${myfriendPicture.school }<br>
																		</c:if>
																		<c:if test='${myfriendPicture.highschool ne null }'>
																			<img src='resources/friendIcon/school.png' width='15px'>${myfriendPicture.highschool }/${myfriendPicture.highschoolmajor }<br>
																		</c:if>
																		<c:if test='${myfriendPicture.job ne null }'>
																			<img src='resources/friendIcon/job.png' width='15px'>${myfriendPicture.job } 근무<br>
																		</c:if>
																		<c:if test='${myfriendPicture.born ne null }'>
																			<img src='resources/friendIcon/house.png' width='15px'>${myfriendPicture.born } 거주<br>
																		</c:if>
																	</h6></font>
																</div>
															</div>
														">
								</li>
							</c:forEach>
						</c:if>
						<!-- 친구의 프로필일시!!! 끝!! -->

					</ul>
				</div>
			</div>

			<div style="width:545px; height:700px; display: inline-block; ">
				<c:if test="${sessionScope.loginUser.m_num == member.m_num}">
				<div style="padding:0px; margin: 5px; width: 545px;">
					<div style=" background: white; -webkit-border-radius: 5px; border: 1px solid white; padding:0.5em; margin:0px; ">
						<jsp:include page="../write_form.jsp"></jsp:include>
					</div>
				</div>
				</c:if>
				
				<div style="padding:1px; margin: 0px;">
					<div  id="boardListContainer" style="width: 550px; -webkit-border-radius: 1px; padding:0.2em; margin:1px; ">
						<jsp:include page="../read_board.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>

		<div id="info-3">
			<%@include file="friendList.jsp" %>
		</div>
			
		<div id="info-4">
			<jsp:include page="photo.jsp"></jsp:include>
		</div>

	</div>
	
	<div class="mw_layer">
	      <div class="bg"></div>
	      <div id="layer"><jsp:include page="../detail.jsp"></jsp:include></div>
	</div>
	
	<div style="width: 17%;  right:0px; height:620px; display: inline-block; border-left: 1px solid #B6B9C1;  position:fixed;">
		<%@include file="../friendList.jsp" %>
	</div>

</c:forEach>

</body>
</html>