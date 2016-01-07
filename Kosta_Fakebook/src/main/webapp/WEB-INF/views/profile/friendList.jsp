<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*, edu.kosta.com.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"/>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
/* html, body  {
	margin:0px;
} */

.proifile_left {
	float:left; 
	width:90px; 
	height:720px;
}

.proifile_center {
	float:left; 
	width:870px; 
	padding:1px;
}

.friendList {
	border:1px solid #e5e6e9;
	height:720px;
	font-size: 14px;
	background-color: white;
}

.friendList a { 
 	text-decoration:none; 
	color: #3b5998;
	font-weight: bold;
}

.friendListBox {
	border:1px solid #e5e6e9;
	width:380px; 
	height:100px; 
	margin:15px; 
	display:inline-block;
}

.friendListBoxPicture {
	border:1px solid #e9eaed;  
	width:120px; 
	height:100px; 
	display:inline-block;
}

#friend_del {
  background: #f6f7f8;
  color: black;
  font-size: 12px;
  padding: 3px 11px 4px 11px;
  border: solid  1px;
      border-color: #cccccc #c5c6c8 #b6b7b9;
  text-decoration: none;
  text-align: center;
}

</style>

	<div class="proifile_center" >
		
		<div style="height:80px; background-color:#f6f7f8; ">
			<span style="font-size:16pt;  display: inline-block; margin-left: 20px; margin-top: 10px; font-weight: bold; color: #373e4d;">
			<img src='resources/friendIcon/together_friends.png' width='35x'>친구</span>
			<span style="display: block; margin-left: 20px; margin-top: 12px; font-size: 10pt; font-weight: bold; color: #373e4d;">모든친구 
			<c:if test="${fn:length(my_profile_friendList) >0}">
				${fn:length(my_profile_friendList)}
			</c:if>
			<c:if test="${fn:length(friend_profile_togetherList) >0}">
				${fn:length(friend_profile_togetherList) + fn:length(no_togetherFriends)}
			</c:if>
			</span>
		</div>
	
		<div class="friendList"  >
			<table   width: 830px;">
				
				<!-- 내프로필일시!!내프로필일시!!내프로필일시!!내프로필일시!!내프로필일시!!내프로필일시!!내프로필일시!!
				START START START START START START START START START START START START START -->
				<c:if test="${fn:length(my_profile_friendList) >0}">  
					<c:forEach items="${my_profile_friendList }" var="list"  varStatus="staus">
						
						<!-- @@@@@@@왼쪽줄@@@@@@@@@@@@ -->
						<c:if test="${staus.index %2 == 0 }"> 
							<tr style="width: 100%; margin: 10px;">
								<td width="40%" style=" margin: 5px;">
									<div style="margin-left: 5px; margin-top: 10px; border : solid #e9eaed 1px; ">   <!-- 친구 하나의 전체틀 -->
										<div style="display:table-cell; vertical-align:middle;"> <!-- 이미지 틀! -->
											<!-- popOver!!! -->
											<!-- 겉에 popover아닌것 밖에 이미지! -->
												<c:if test="${list.picture eq null }">
													<!-- popover image -->
													<img  src="resources/my_frofile/noimage.jpg" width="90px" height="90px" data-toggle="popover" data-trigger="click"
													title="
													
												</c:if>
												<c:if test="${list.picture ne null }">
													<!-- popover image -->
													<img  src="resources/member_profile/${list.picture}" height="90px" width="90px" data-toggle="popover" data-trigger="click"
													title="
												</c:if>
														<div>
															<!-- popover안에 이미지틀!! -->
															<div style='display:table-cell; vertical-align:middle;'>
																<c:if test='${list.picture eq null }'>
																	<img  src='resources/my_frofile/noimage.jpg' width='80px'>
																</c:if>
																<c:if test='${list.picture ne null }'>
																	<img  src='resources/member_profile/${list.picture}' width='80px'>
																</c:if>
															</div>
															<!-- popover안에 개인 이름과 정보들 -->
															<div style='display:table-cell; vertical-align:middle; width: 200px;'>
																<a href='profile?num=${list.m_num}'>${list.name }</a>
																<br><br>
																<h6>
																<c:if test='${fn:length(list.recentlyNotiNames) > 1  }'>
																		<img src='resources/friendIcon/together_friends.png' width='15px'>
																		<a href='profile?num=${list.recentlyNotiIds[0] }'>${list.recentlyNotiNames[0] }</a> 
																		외 ${fn:length(list.recentlyNotiNames) }명과 친구가 되었습니다.
																</c:if>
																<c:if test='${fn:length(list.recentlyNotiNames) == 1  }'>
																		<img src='resources/friendIcon/together_friends.png' width='15px'>
																		최근 친구 관계를 맺었습니다 : <a href='profile?num=${list.recentlyNotiIds[0] }'>${list.recentlyNotiNames[0] }</a>님
																</c:if>
																<c:if test='${fn:length(list.togetherFriendNames) > 1  }'>
																		<img src='resources/friendIcon/together_friends.png' width='15px'>
																		<a href='profile?num=${list.togetherFriendIds[0] }'>${list.togetherFriendNames[0] }</a> 
																		님을 포함하여 함께아는 친구 ${fn:length(list.togetherFriendNames) }명
																</c:if>
																<c:if test='${fn:length(list.togetherFriendNames) == 1  }'>
																		<img src='resources/friendIcon/together_friends.png' width='15px'>
																		함께 아는 친구 : <a href='profile?num=${list.togetherFriendIds[0] }'>${list.togetherFriendNames[0] }</a>님
																</c:if>
																</h6>
															</div>
															
														</div>
													">
										</div>
										
										<!-- 이름과 정보 부분 div -->
										<div style="display:table-cell; vertical-align:middle; width: 200px; padding: 10px;">
											<a href="profile?num=${list.m_num}" '>${list.name }</a><br>
											<c:if test="${list.friendCount > 0  }">
												<font color="#C1BCBC" size="2px">친구 ${list.friendCount }명 </font>
											</c:if>
										</div>
										
										<!-- 버튼 부분 div -->
										<div id="FriendPan${list.m_num }" style="display:table-cell; vertical-align:middle; padding: 10px;">
												<button class="btn_outFriend btn-default" m_num="${list.m_num }" id="friend_del">
												<img src="resources/friendIcon/check.png" width="15px">친구 끊기</button>
										</div>
										<div id="noneFriendPan${list.m_num }" style="display:none; vertical-align:middle; padding: 10px;">
											<button class="friendadd_Btn btn-default" m_num="${list.m_num }"  id="friend_del">
											<img src="resources/friendIcon/friend_plus.png" width="20px">친구 추가</button>
										</div>
									</div>
								</td>
						</c:if>
						
						 <!-- @@@@@@@@@오른쪽줄@@@@@@@@@@ -->
						<c:if test="${staus.index %2 == 1 }"> 
								<td width="40%" style=" margin: 0px; padding: 5px;">
									<div style="margin-left: 0px; margin-top: 10px; border : solid #e9eaed 1px;">   <!-- 친구 하나의 전체틀 -->
										<div style="display:table-cell; vertical-align:middle;"> <!-- 이미지 틀! -->
											<!-- popOver!!! -->
											<!-- 겉에 popover아닌것 밖에 이미지! -->
												<c:if test="${list.picture eq null }">
													<!-- popover image -->
													<img  src="resources/my_frofile/noimage.jpg" width="90px" height="90px" data-toggle="popover" data-trigger="click"
													title="
													
												</c:if>
												<c:if test="${list.picture ne null }">
													<!-- popover image -->
													<img  src="resources/member_profile/${list.picture}" width="90px" height="90px" data-toggle="popover" data-trigger="click"
													title="
												</c:if>
														<div>
															<!-- popover안에 이미지틀!! -->
															<div style='display:table-cell; vertical-align:middle;'>
																<c:if test='${list.picture eq null }'>
																	<img  src='resources/my_frofile/noimage.jpg' width='80px'>
																</c:if>
																<c:if test='${list.picture ne null }'>
																	<img  src='resources/member_profile/${list.picture}' width='80px'>
																</c:if>
															</div>
															<!-- popover안에 개인 이름과 정보들 -->
															<div style='display:table-cell; vertical-align:middle; width: 200px;'>
																<a href='profile?num=${list.m_num}'>${list.name }</a>
																<br><br>
																<h6>
																<c:if test='${fn:length(list.recentlyNotiNames) > 1  }'>
																		<img src='resources/friendIcon/together_friends.png' width='15px'>
																		<a href='profile?num=${list.recentlyNotiIds[0] }'>${list.recentlyNotiNames[0] }</a> 
																		외 ${fn:length(list.recentlyNotiNames) }명과 친구가 되었습니다.
																</c:if>
																<c:if test='${fn:length(list.recentlyNotiNames) == 1  }'>
																		<img src='resources/friendIcon/together_friends.png' width='15px'>
																		최근 친구 관계를 맺었습니다 : <a href='profile?num=${list.recentlyNotiIds[0] }'>${list.recentlyNotiNames[0] }</a>님
																</c:if>
																<c:if test='${fn:length(list.togetherFriendNames) > 1  }'>
																		<img src='resources/friendIcon/together_friends.png' width='15px'>
																		<a href='profile?num=${list.togetherFriendIds[0] }'>${list.togetherFriendNames[0] }</a> 
																		님을 포함하여 함께아는 친구 ${fn:length(list.togetherFriendNames) }명
																</c:if>
																<c:if test='${fn:length(list.togetherFriendNames) == 1  }'>
																		<img src='resources/friendIcon/together_friends.png' width='15px'>
																		함께 아는 친구 : <a href='profile?num=${list.togetherFriendIds[0] }'>${list.togetherFriendNames[0] }</a>님
																</c:if>
																</h6>
															</div>
															
														</div>
													">
										</div>
										
										<!-- 이름과 정보 부분 div -->
										<div style="display:table-cell; vertical-align:middle; width: 200px; padding: 10px;">
											<a href="profile?num=${list.m_num}">${list.name }</a><br>
											<c:if test="${list.friendCount > 0  }">
												<font color="#C1BCBC" size="2px">친구 ${list.friendCount }명 </font>
											</c:if>
										</div>
										
										<!-- 버튼 부분 div -->
										<div id="FriendPan${list.m_num }" style="display:table-cell; vertical-align:middle;  padding: 10px;">
												<button class="btn_outFriend btn-default" m_num="${list.m_num }" id="friend_del">
												<img src="resources/friendIcon/check.png" width="15px">친구 끊기</button>
											</div>
											<div id="noneFriendPan${list.m_num }" style="display:none; vertical-align:middle;  padding: 10px;">
												<button class="friendadd_Btn btn-default" m_num="${list.m_num }" id="friend_del">
												<img src="resources/friendIcon/friend_plus.png" width="20px">친구 추가</button>
											</div>
									</div>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:if> 
				<!-- 내프로필일시!!내프로필일시!!내프로필일시!!내프로필일시!!내프로필일시!!내프로필일시!!내프로필일시!!
				끝끝끝 끝끝끝  끝끝끝  끝끝끝  끝끝끝  끝끝끝  끝끝끝  끝끝끝  끝끝끝  끝끝끝  끝끝끝  끝끝끝  끝끝끝   -->
				
				<!-- 친구프로필일시 친구프로필일시 친구프로필일시 친구프로필일시친구프로필일시 친구프로필일시친구프로필일시 친구프로필일시
				START START START START START START START START START START START START START -->
				<c:if test="${fn:length(friend_profile_togetherList) >0}">  
					<c:forEach items="${friend_profile_togetherList }" var="list"  varStatus="staus">
						
						<!-- 함께아는 친구 먼저 출력!!!@@@@@ -->
						<c:if test="${fn:length(friend_profile_togetherList) > staus.index }">
							<!-- @@@@@@@왼쪽줄@@@@@@@@@@@@ -->
							<c:if test="${staus.index %2 == 0 }"> 
								<tr style="width: 100%; margin: 10px;">
									<td width="50%" style=" margin: 5px;">
										<div style="margin-left: 5px; margin-top: 10px; border : solid #e5e6e9 1px; ">   <!-- 친구 하나의 전체틀 -->
											<div style="display:table-cell; vertical-align:middle;"> <!-- 이미지 틀! -->
												<!-- popOver!!! -->
												<!-- 겉에 popover아닌것 밖에 이미지! -->
													<c:if test="${list.picture eq null }">
														<!-- popover image -->
														<img  src="resources/my_frofile/noimage.jpg" width="90px" height="90px" data-toggle="popover" data-trigger="click"
														title="
														
													</c:if>
													<c:if test="${list.picture ne null }">
														<!-- popover image -->
														<img  src="resources/member_profile/${list.picture}" width="90px" height="90px" data-toggle="popover" data-trigger="click"
														title="
													</c:if>
															<div>
																<!-- popover안에 이미지틀!! -->
																<div style='display:table-cell; vertical-align:middle;'>
																	<c:if test='${list.picture eq null }'>
																		<img  src='resources/my_frofile/noimage.jpg' width='80px'>
																	</c:if>
																	<c:if test='${list.picture ne null }'>
																		<img  src='resources/member_profile/${list.picture}' width='80px'>
																	</c:if>
																</div>
																<!-- popover안에 개인 이름과 정보들 -->
																<div style='display:table-cell; vertical-align:middle; width: 200px;'>
																	<a href='profile?num=${list.m_num}'>${list.name }</a>
																	<br><br>
																	<h6>
																	<c:if test='${fn:length(list.recentlyNotiNames) > 1  }'>
																			<img src='resources/friendIcon/together_friends.png' width='15px'>
																			<a href='profile?num=${list.recentlyNotiIds[0] }'>${list.recentlyNotiNames[0] }</a> 
																			외 ${fn:length(list.recentlyNotiNames) }명과 친구가 되었습니다.<br>
																	</c:if>
																	<c:if test='${fn:length(list.recentlyNotiNames) == 1  }'>
																			<img src='resources/friendIcon/together_friends.png' width='15px'>
																			최근 친구 관계를 맺었습니다 : <a href='profile?num=${list.recentlyNotiIds[0] }'>${list.recentlyNotiNames[0] }</a>님<br>
																	</c:if>
																	<c:if test='${fn:length(list.togetherFriendNames) > 1  }'>
																			<img src='resources/friendIcon/together_friends.png' width='15px'>
																			<a href='profile?num=${list.togetherFriendIds[0] }'>${list.togetherFriendNames[0] }</a> 
																			님을 포함하여 함께아는 친구 ${fn:length(list.togetherFriendNames) }명<br>
																	</c:if>
																	<c:if test='${fn:length(list.togetherFriendNames) == 1  }'>
																			<img src='resources/friendIcon/together_friends.png' width='15px'>
																			함께 아는 친구 : <a href='profile?num=${list.togetherFriendIds[0] }'>${list.togetherFriendNames[0] }</a>님
																	</c:if>
																	</h6>
																</div>
															</div>
														">
											</div>
											
											<!-- 이름과 정보 부분 div -->
											<div style="display:table-cell; vertical-align:middle; width: 200px; padding: 10px;">
												<a href="profile?num=${list.m_num}">${list.name }</a><br>
												<c:if test="${list.friendCount > 0  }">
													<font color="#C1BCBC" size="2px">친구 ${list.friendCount }명 </font>
												</c:if>
											</div>
											
											<!-- 버튼 부분 div -->
											<div id="FriendPan${list.m_num }" style="display:table-cell; vertical-align:middle; ">
												<button class="btn_outFriend btn-default" m_num="${list.m_num }" id="friend_del">
												<img src="resources/friendIcon/check.png" width="15px">친구 끊기</button>
											</div>
											<div id="noneFriendPan${list.m_num }" style="display:none; vertical-align:middle; ">
												<button class="friendadd_Btn btn-default" m_num="${list.m_num }" id="friend_del">
												<img src="resources/friendIcon/friend_plus.png" width="20px">친구 추가</button>
											</div>
										</div>
									</td>
							</c:if>
							
							 <!-- @@@@@@@@@오른쪽줄@@@@@@@@@@ -->
							<c:if test="${staus.index %2 == 1 }"> 
									<td width="50%" style=" margin: 0px; padding: 5px;">
										<div style="margin-left: 0px; margin-top: 10px; border : solid #e9eaed 1px;">   <!-- 친구 하나의 전체틀 -->
											<div style="display:table-cell; vertical-align:middle;"> <!-- 이미지 틀! -->
												<!-- popOver!!! -->
												<!-- 겉에 popover아닌것 밖에 이미지! -->
													<c:if test="${list.picture eq null }">
														<!-- popover image -->
														<img  src="resources/my_frofile/noimage.jpg" height="90px" width="90px" data-toggle="popover" data-trigger="click"
														title="
														
													</c:if>
													<c:if test="${list.picture ne null }">
														<!-- popover image -->
														<img  src="resources/member_profile/${list.picture}" height="90px" width="90px" data-toggle="popover" data-trigger="click"
														title="
													</c:if>
															<div>
																<!-- popover안에 이미지틀!! -->
																<div style='display:table-cell; vertical-align:middle;'>
																	<c:if test='${list.picture eq null }'>
																		<img  src='resources/my_frofile/noimage.jpg' width='80px'>
																	</c:if>
																	<c:if test='${list.picture ne null }'>
																		<img  src='resources/member_profile/${list.picture}' width='80px'>
																	</c:if>
																</div>
																<!-- popover안에 개인 이름과 정보들 -->
																<div style='display:table-cell; vertical-align:middle; width: 200px;'>
																	<a href='profile?num=${list.m_num}'>${list.name }</a>
																	<br><br>
																	<h6>
																	<c:if test='${fn:length(list.recentlyNotiNames) > 1  }'>
																			<img src='resources/friendIcon/together_friends.png' width='15px'>
																			<a href='profile?num=${list.recentlyNotiIds[0] }'>${list.recentlyNotiNames[0] }</a> 
																			외 ${fn:length(list.recentlyNotiNames) }명과 친구가 되었습니다.<br>
																	</c:if>
																	<c:if test='${fn:length(list.recentlyNotiNames) == 1  }'>
																			<img src='resources/friendIcon/together_friends.png' width='15px'>
																			최근 친구 관계를 맺었습니다 : <a href='profile?num=${list.recentlyNotiIds[0] }'>${list.recentlyNotiNames[0] }</a>님<br>
																	</c:if>
																	<c:if test='${fn:length(list.togetherFriendNames) > 1  }'>
																			<img src='resources/friendIcon/together_friends.png' width='15px'>
																			<a href='profile?num=${list.togetherFriendIds[0] }'>${list.togetherFriendNames[0] }</a> 
																			님을 포함하여 함께아는 친구 ${fn:length(list.togetherFriendNames) }명<br>
																	</c:if>
																	<c:if test='${fn:length(list.togetherFriendNames) == 1  }'>
																			<img src='resources/friendIcon/together_friends.png' width='15px'>
																			함께 아는 친구 : <a href='profile?num=${list.togetherFriendIds[0] }'>${list.togetherFriendNames[0] }</a>님<br>
																	</c:if>
																	</h6>
																</div>
															</div>
														">
											</div>
											
											<!-- 이름과 정보 부분 div -->
											<div style="display:table-cell; vertical-align:middle; width: 200px; padding: 10px;">
												<a href="profile?num=${list.m_num}">${list.name }</a><br>
												<c:if test="${list.friendCount > 0  }">
													<font color="#C1BCBC" size="2px">친구 ${list.friendCount }명 </font>
												</c:if>
											</div>
											
											<!-- 버튼 부분 div -->
											<div id="FriendPan${list.m_num }" style="display:table-cell; vertical-align:middle; ">
												<button class="btn_outFriend btn-default" m_num="${list.m_num }" id="friend_del">
												<img src="resources/friendIcon/check.png" width="15px">친구 끊기</button>
											</div>
											<div id="noneFriendPan${list.m_num }" style="display:none; vertical-align:middle; ">
												<button class="friendadd_Btn btn-default" m_num="${list.m_num }" id="friend_del">
												<img src="resources/friendIcon/friend_plus.png" width="20px">친구 추가</button>
											</div>
										</div>
									</td>
								</tr>
							</c:if>
						</c:if>
						
						<!-- 중간에 줄긋기 중간에 줄긋기 중간에 줄긋기~~ -->
						<c:if test="${fn:length(friend_profile_togetherList) == staus.index +1 }">
							<tr>
								<td colspan="2"><hr></td>
							<tr>
						</c:if>
						<!--@@@ 함께 알지 않는 아예 모르는 친구 출력!!!@@@@@ -->	
						<c:if test="${fn:length(friend_profile_togetherList) == staus.index +1 }">
							<c:forEach items="${no_togetherFriends }" var="list2"  varStatus="staus">
							
							<!-- @@@@@@@함께 알지 않는 아예 모르는 친구 왼쪽줄@@@@@@@@@@@@ -->
							<c:if test="${staus.index %2 == 0 }"> 
								<tr style="width: 100%; margin: 10px;">
									<td width="50%" style=" margin: 5px;">
										<div style="margin-left: 5px; margin-top: 10px; border : solid #e9eaed 1px;">   <!-- 친구 하나의 전체틀 -->
											<div style="display:table-cell; vertical-align:middle;"> <!-- 이미지 틀! -->
												<!-- popOver!!! -->
												<!-- 겉에 popover아닌것 밖에 이미지! -->
													<c:if test="${list2.picture eq null }">
														<!-- popover image -->
														<img  src="resources/my_frofile/noimage.jpg" height="90px" width="90px" data-toggle="popover" data-trigger="click"
														title="
														
													</c:if>
													<c:if test="${list2.picture ne null }">
														<!-- popover image -->
														<img  src="resources/member_profile/${list2.picture}" height="90px"width="90px" data-toggle="popover" data-trigger="click"
														title="
													</c:if>
															<div>
																<!-- popover안에 이미지틀!! -->
																<div style='display:table-cell; vertical-align:middle;'>
																	<c:if test='${list2.picture eq null }'>
																		<img  src='resources/my_frofile/noimage.jpg' width='80px'>
																	</c:if>
																	<c:if test='${list2.picture ne null }'>
																		<img  src='resources/member_profile/${list2.picture}' width='80px'>
																	</c:if>
																</div>
																<!-- popover안에 개인 이름과 정보들 -->
																<div style='display:table-cell; vertical-align:middle; width: 200px;'>
																	<a href='profile?num=${list2.m_num}'>${list2.name }</a>
																	<br><br>
																	<h6>
																		<c:if test='${flag }'>
																			<img src='resources/friendIcon/together_friends.png' width='15px'>
																			함께아는 친구 :
																			<c:forEach items='${myProfile }' var='f'>
																				<a href='profile?num=${f.m_num }'>${f.name }</a>
																			</c:forEach>님 <br>
																		</c:if>
																		<c:if test='${list2.school ne null }'>
																			<img src='resources/friendIcon/school.png' width='15px'>${list2.school }<br>
																		</c:if>
																		<c:if test='${list2.highschool ne null }'>
																			<img src='resources/friendIcon/school.png' width='15px'>${list2.highschool }/${list2.highschoolmajor }<br>
																		</c:if>
																		<c:if test='${list2.job ne null }'>
																			<img src='resources/friendIcon/job.png' width='15px'>${list2.job } 근무<br>
																		</c:if>
																		<c:if test='${list2.born ne null }'>
																			<img src='resources/friendIcon/house.png' width='15px'>${list2.born } 거주<br>
																		</c:if>
																	</h6>
																</div>
															</div>
														">
											</div>
											
											<!-- 이름과 정보 부분 div -->
											<div style="display:table-cell; vertical-align:middle; width: 200px; padding: 10px;">
												<a href="profile?num=${list2.m_num}">${list2.name }</a><br>
												<c:if test='${list2.school ne null }'>
														<img src='resources/friendIcon/school.png' width='15px'>${list2.school }<br>
												</c:if>
												<c:if test='${list2.highschool ne null }'>
														<img src='resources/friendIcon/school.png' width='15px'>${list2.highschool }/${highschoolmajor }<br>
												</c:if>
												<c:if test='${list2.job ne null }'>
														<img src='resources/friendIcon/job.png' width='15px'>${list2.job } 근무<br>
												</c:if>
												<c:if test='${list2.born ne null }'>
														<img src='resources/friendIcon/house.png' width='15px'>${list2.born } 거주<br>
												</c:if>
											</div>
											
											<!-- 버튼 부분 div -->
											<div id="FriendPan${list2.m_num }" style="display:table-cell; vertical-align:middle; ">
												<button class="btn_addFriend btn-default" m_num="${list2.m_num }" id="friend_del">
												<img src="resources/friendIcon/requestFriend.png" width="20px">친구 추가</button>
											</div>
											<div id="noneFriendPan${list2.m_num }" style="display:none; vertical-align:middle; ">
												<button class="friendadd_Btn btn-default">
												<img src="resources/friendIcon/response_Friend.png" width="20px">
												친구요청 전송중</button>
											</div>
										</div>
									</td>
							</c:if>
							
							<!-- @@@@@@@함께 알지 않는 아예 모르는 친구 오른쪽줄@@@@@@@@@@@@ -->
							<c:if test="${staus.index %2 == 1 }"> 
									<td width="50%" style=" margin: 0px; padding: 5px;">
										<div style="margin-left: 0px; margin-top: 10px; border : solid #e9eaed 1px;">   <!-- 친구 하나의 전체틀 -->
											<div style="display:table-cell; vertical-align:middle;"> <!-- 이미지 틀! -->
												<!-- popOver!!! -->
												<c:if test="${list2.picture eq null }">
														<!-- popover image -->
														<img  src="resources/my_frofile/noimage.jpg" height="90px" width="90px" data-toggle="popover" data-trigger="click"
														title="
														
													</c:if>
													<c:if test="${list2.picture ne null }">
														<!-- popover image -->
														<img  src="resources/member_profile/${list2.picture}" height="90px"width="90px" data-toggle="popover" data-trigger="click"
														title="
													</c:if>
															<div>
																<!-- popover안에 이미지틀!! -->
																<div style='display:table-cell; vertical-align:middle;'>
																	<c:if test='${list2.picture eq null }'>
																		<img  src='resources/my_frofile/noimage.jpg' width='80px'>
																	</c:if>
																	<c:if test='${list2.picture ne null }'>
																		<img  src='resources/member_profile/${list2.picture}' width='80px'>
																	</c:if>
																</div>
																<!-- popover안에 개인 이름과 정보들 -->
																<div style='display:table-cell; vertical-align:middle; width: 200px;'>
																	<a href='profile?num=${list2.m_num}'>${list2.name }</a>
																	<br><br>
																	<h6>
																		<c:if test='${flag }'>
																			<img src='resources/friendIcon/together_friends.png' width='15px'>
																			함께아는 친구 :
																			<c:forEach items='${myProfile }' var='f'>
																				<a href='profile?num=${f.m_num }'>${f.name }</a>
																			</c:forEach>님 <br>
																		</c:if>
																		<c:if test='${list2.school ne null }'>
																			<img src='resources/friendIcon/school.png' width='15px'>${list2.school }<br>
																		</c:if>
																		<c:if test='${list2.highschool ne null }'>
																			<img src='resources/friendIcon/school.png' width='15px'>${list2.highschool }/${list2.highschoolmajor }<br>
																		</c:if>
																		<c:if test='${list2.job ne null }'>
																			<img src='resources/friendIcon/job.png' width='15px'>${list2.job } 근무<br>
																		</c:if>
																		<c:if test='${list2.born ne null }'>
																			<img src='resources/friendIcon/house.png' width='15px'>${list2.born } 거주<br>
																		</c:if>
																	</h6>
																</div>
															</div>
														">
											</div>
											
											<!-- 이름과 정보 부분 div -->
											<div style="display:table-cell; vertical-align:middle; width: 200px; padding: 10px;">
												<a href="profile?num=${list2.m_num}">${list2.name }</a><br>
												<c:if test='${list2.school ne null }'>
														<img src='resources/friendIcon/school.png' width='15px'>${list2.school }<br>
												</c:if>
												<c:if test='${list2.highschool ne null }'>
														<img src='resources/friendIcon/school.png' width='15px'>${list2.highschool }/${highschoolmajor }<br>
												</c:if>
												<c:if test='${list2.job ne null }'>
														<img src='resources/friendIcon/job.png' width='15px'>${list2.job } 근무<br>
												</c:if>
												<c:if test='${list2.born ne null }'>
														<img src='resources/friendIcon/house.png' width='15px'>${list2.born } 거주<br>
												</c:if>
											</div>
											
											<!-- 버튼 부분 div -->
											<div id="FriendPan${list2.m_num }" style="display:table-cell; vertical-align:middle; ">
												<button class="btn_addFriend btn-default" m_num="${list2.m_num }"  id="friend_del">
												<img src="resources/friendIcon/requestFriend.png" width="20px">친구 추가</button>
											</div>
											<div id="noneFriendPan${list2.m_num }" style="display:none; vertical-align:middle; ">
												<button class="friendadd_Btn btn-default">
												<img src="resources/friendIcon/response_Friend.png" width="20px">
												친구요청 전송중</button>
											</div>
										</div>
									</td>
									<tr>
							</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</c:if>
				<!-- 친구프로필일시 친구프로필일시 친구프로필일시 친구프로필일시친구프로필일시 친구프로필일시친구프로필일시 친구프로필일시
				끝끝끝 끝끝끝  끝끝끝  끝끝끝  끝끝끝  끝끝끝  끝끝끝  끝끝끝  끝끝끝  끝끝끝  끝끝끝  끝끝끝  끝끝끝 -->
			</table>
		</div>

	</div>



<!-- <script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover({placement: "right",html: true});   
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
</script> -->

</body>
</html>