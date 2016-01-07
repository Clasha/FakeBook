<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<div id="top_bar"
	style="background-image: linear-gradient(to bottom, #3a5795, #1c4e6e); display: inline-block; float: left; width: 100%; height: 42px; margin-bottom: 10px;">

	<div class="logo"
		style="float: left; display: inline-block; border: 1px solid red; width: 40px; height: 40px;">
		<a href="http://localhost:8080/spring_facebook/main" > <font size="20px" color="#ffffff">&nbsp;f</font> </a>
	</div>
	<div class="search_bar"
		style="float: left; display: inline-block; border: 1px solid red; height: 40;">
		<input type="text" name="search" id="search"> <input
			type="button" value="찾기">
	</div>

	<div class="menu"
		style="float: right; display: inline-block; border: 1px solid red; width: 400px; height: 40px;">
		<div class="">
		  	<a href="mypage?id=" style="color: white;">mypage</a>
			<a href="main" style="color: white;">home</a>
			<a href="search?" style="color: white;">friendfind</a>
		</div>
	</div>

</div>

</html>