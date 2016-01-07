<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table>
	<c:forEach items="${likeNotis }" var="likeNoti">
		<tr>				
			<td>
				<a href="profile?num=${likeNoti.m_num}">${likeNoti.name }</a>
				<font color="black">님이 회원님의 <a href="searchMembers?boardNum=${likeNoti.board_num }">게시글을</a> 좋아합니다.<br>
				${likeNoti.noti_date }<br>
				<button class="delete_likenoti" noti_num="${likeNoti.noti_num}" onclick="" >삭제</button>		</font>		
			</td>				
		</tr>
	</c:forEach>
</table>

