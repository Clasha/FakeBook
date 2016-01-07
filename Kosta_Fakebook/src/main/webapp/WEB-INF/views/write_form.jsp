<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<style>

textarea {
	background-color: transparent;
	width: 100%;
	border: 0;
	box-sizing: border-box;
	outline: 0;
	overflow: visible;
	border-bottom: 1px solid gray;
	margin-bottom: 1px;
}

a{
	text-decoration: none;
}

a.icon {
	display:inline-block;
	width: 40px; height:40px;
	background-image: url(resources/compact-camera-xxs.png);
	background-repeat: no-repeat;
    background-size: auto;
    background-position: 0 0;
}

div>a.icon:hover{
	background-color: yellow;
}

.right{
	display:inline-block;
 	float: right; 
 	padding: 3px;
}

.write_btn {
  background: #4e69a2;
  color: white;
  font-size: 12px;
  padding: 3px 11px 4px 11px;
  border: solid #1f628d 1px;
  text-decoration: none;
  text-align: center;
}

.write_btn:hover {
  background: #4e69a2;
  text-decoration: none;
  color: white;
}
</style>
<script type="text/javascript">
	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (20 + obj.scrollHeight) + "px";
	}
</script>

<form action="insertBoard" method="post" enctype="multipart/form-data">
	<input type="hidden"  name="m_num" value="${sessionScope.loginUser.m_num}" >
	<input type="hidden"  name="place" value="place">
	<input type="hidden"  name="picture" value="picture">
	<input type="hidden"  name="video" value="video">
	
	<div id="memtionsInput">
		<div style="font-size:9pt; margin: 5px;">
			<span style="color: gray;">
				<img alt="" src="resources/img/state_up.png"  style=" width: 15px; height: 15px; vertical-align: middle;">
				상태 업데이트
			</span>
		</div>


		<div style="border-top: 1px solid #e6e6e6; " >
			<div style="margin:10px; ">
				 <c:if test="${sessionScope.loginUser.picture eq null }">
					<img alt="" src="resources/member_profile/noimage.jpg" width="40" height="40">
				</c:if>
				<c:if test="${sessionScope.loginUser.picture ne null  }">
					<img alt="" src="resources/member_profile/${sessionScope.loginUser.picture}" width="40" height="40">
				</c:if>
			</div>

			<div id="mentionsInput">
				<span id="test" class="highlight"></span>
				<textarea name="content" title="무슨 생각을 하고 계신가요?" placeholder="무슨 생각을 하고 계신가요?"
					aria-label="무슨 생각을 하고 계신가요?" onkeydown="resize(this);" style="white-space: pre-wrap; word-break: break-all;"></textarea>
			</div>

			<input type="text" name="place" placeholder="어디였나요?" style="padding: 1px; margin: 2px;">

			<div id="input_bar"  style="padding: 1px; margin: 2px;">
				<div style=" width: 150px; display: inline-block;">
					<input type="file" id="file_image" name="file" title="업로드할 파일 선택" onchange="alert('파일 등록');">
				</div>
				<div style="display: inline-block; float: right;"><button class="write_btn" type="submit">게시</button></div>
				<div class="right" >
					<select name="open_level">
						<option value="0">전체 공개</option>
						<option value="1">친구 공개</option>
						<option value="2">나만 보기</option>
					</select>
				</div>
			</div>

		</div>
	</div>
</form>
</html>
