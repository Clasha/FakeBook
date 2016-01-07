<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import ="java.util.*, edu.kosta.mybatis.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Facebook에 오신것을 환영합니다.</title>

<style type="text/css">
html, body {
	height: 100%; margin: 0; padding:0;
	min-width:1000px;
	background-color: #F5F6F7;
	font-family: helvetica, arial, sans-serif;
}

.main_header {
	width:auto;
	height:90px;
	background-color:#3a5795;
	position:relative;
}

#insertForm input{
	height: 35px;
	width: 400px;
	border-radius: 5px;
	margin: 5px;
}

a {
	outline:none;
	text-decoration:none 
}
</style>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

 <div class="main_header" >
	<!-- <span style=" font-size:30px; left:150px; position: relative; margin:20px; color:white;">facebook</span> -->
	<div  style="margin-left: 200px; margin-top:15px;  width: 200px; float:left; position: relative;">
		<a href="./">
			<font color="white"  size="25px">facebook</font>
		</a>
	</div>
	
	<div style="float: right; position: relative; margin-top:10px; margin-right:180px; float:right;">
	<form action="loginCheck" method="post">
		<table>
			<tr>
				<td style="text-align: left;"><font color="white">이메일</font></td>
				<td colspan="2" style="text-align: left;"><font color="white">비밀번호</font></td>
			</tr>
			<tr>
				<td><input type="text" name="email"></td>
				<td><input type="password" name="password"></td>
				<td><input type="submit" value="로그인" style="background-color: blue; border-color: blue; color: white;"></td>
			</tr>
		</table>
	</form>
	</div>
</div>

<div style="margin-left: 400px;  width: 800px;">
	<!-- email이 틀렸거나 존재하지 않으면 오는 페이지 다시 로그인 하거나 아이디가 없다면  -->
 
 	<div style="margin: 50px; padding: 0px; width: 700px;   ">
 		<div style="margin: 0px; padding: 50px; width: 500px;   border: 1px solid #B6B9C1; ">
 			<span style="font-weight: bold; font-size: 11pt;">Facebook 로그인</span>
 			<hr>
 			
 			<div style="font-size: 10pt;">
 				<div  style="font-weight: bold; height: 40px;">Email 오류</div>
 				
 				<div style="height: 70px; font-style: italic;">
					<span >입력된 이메일 계정이 없습니다. <br/> 이메일을 다시 입력해 주세요. </span>
				</div>
				
				<form action="loginCheck" method="post">
				 이메일&nbsp;&nbsp;&nbsp; : <input type="text" name="email" > <br/><br/>
				 비밀번호 : <input type="password" name="password"><br/><br/>
				<input type="submit" value="로그인" style="margin-left: 65px;">
				</form>
 			</div>
 		</div>
	</div>
</div>
</body>
</html>