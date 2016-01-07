<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import ="java.util.*, edu.kosta.mybatis.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fakebook에 오신것을 환영합니다.</title>
	  
 <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

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

 <div class="main_header" >
	<!-- <span style=" font-size:30px; left:150px; position: relative; margin:20px; color:white;">facebook</span> -->
	<div  style="margin-left: 200px; margin-top:15px;  width: 200px; float:left; position: relative;">
		<a href="./">
			<font color="white"  size="25px">fakebook</font>
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

<div	style="float:left; width:500;  margin-top: 50px; margin-left:170px;">
<p style="color:black; font-size:15pt; font-weight: bold;">Fakebook에서 전세계에 있는 친구, 가족, 지인들과 <br/>
함께 이야기를 나눠보세요.</p>
	<img alt="" src="resources/intro.png">
</div>


<div style="width: 412px; float: right; margin-right:150px;"  >
		<form action="memberInsert" method="post" id="insertForm">
			<table>
				<tr>
					<td colspan="2"><h1 style="margin-left: 8px">가입하기</h1></td>
				</tr>
				<tr>
					<td colspan="2"><h3 style="margin-left: 8px">항상 지금처럼 무료로 즐기실수 있습니다.</h3></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="name" placeholder="성(姓)이름 예)홍길동" id="memberName"  data-toggle="tooltip" data-placement="left" title="이름이 무엇인가요?"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="email" placeholder="이메일" id="memberEmail" data-toggle="tooltip" data-placement="left" title="로그인 할때와 비밀번호를 재설정 할때 사용하는 정보입니다."></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="email_chk" placeholder="이메일 재입력" id="memberEmailCehck" data-toggle="tooltip" data-placement="left" title="이메일 주소를 다시 입력해주세요."></td>
				</tr>
				<tr>
					<td colspan="2"><input type="password" name="password" placeholder="비밀번호" id="memberPassword" data-toggle="tooltip" data-placement="left" title="비밀번호를 입력해주세요."></td>
				</tr>
				
				<tr>
					<td>
						<h2>생일</h2>
						<input type="date" style="width: 200px;" name="birthday" id="memberBirthday" data-toggle="tooltip" data-placement="left" title="생일을 선택해주세요." >
					</td>
					<td>
						 <a href="#" data-toggle="popover" data-trigger="focus" data-placement="left" title="생일을 입력하면 회원님의 연령에 맞는 Facebook 환경을 이용할 수 있습니다. 프로필의 정보 섹션에서 이 정보의 공개 범위를 변경할 수 있습니다. 자세한 내용은 데이터 정책에서 확인해주세요." data-content="">왜 생년월일을 입력해야 하나요?</a>
					</td>
				</tr>
				<tr><td><input type="submit" value="가입하기" 
				style="width: 120px; height: 30px;  background-color: #69a74e; background : -webkit-linear-gradient(#67ae55, #578843); 
				 box-shadow: inset 0 1px 1px #a4e388; border-color: #3b6e22 #3b6e22 #2c5115; margin-top:10px; 
				 margin-bottom : 10px; border : 1px solid; border-radius : 5px; color : white; font-size: 15px;"
				 /></td></tr>
			</table>
			
		</form>
</div>
	
	
	<script>
	
	
		$(function(){
			$('[data-toggle="popover"]').popover();//왜 생년월일을 입력해야하는가요?의 popover
			
			
			$('#memberName').blur(function(event){
				if($('#memberName').val()==""){
					$('#memberName').css('border','solid #D20000 1px');
					$('[data-toggle="tooltip"]').tooltip();
				}else{
					$('#memberName').css('border','solid #4BA104 2px');
				}
			})
			
			 
			
			var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			$('#memberEmail').blur(function(event){
				if($('#memberEmail').val()==""){
					$('#memberEmail').css('border','solid #D20000 1px');
					$('[data-toggle="tooltip"]').tooltip();
				}else{
					 if(!regEmail.test($('#memberEmail').val())) {
			                alert('이메일 주소가 유효하지 않습니다');
			                $('#memberEmail').focus();
			            }
					$('#memberEmail').css('border','solid #4BA104 2px');
				}
			})
			
			$('#memberEmailCehck').blur(function(event){
				if($('#memberEmailCehck').val()==""){
					$('#memberEmailCehck').css('border','solid #D20000 1px');
					$('[data-toggle="tooltip"]').tooltip();
				}else{
					if($('#memberEmail').val()!=$('#memberEmailCehck').val()){
						$('#memberEmailCehck').css('border','solid #D20000 1px');
					}else{
						$('#memberEmailCehck').css('border','solid #4BA104 2px');
					}
				}
			})
			$('#memberPassword').blur(function(event){
				if($('#memberPassword').val()==""){
					$('#memberPassword').css('border','solid #D20000 1px');
					$('[data-toggle="tooltip"]').tooltip();
				}else{
					$('#memberPassword').css('border','solid #4BA104 2px');
				}
			})
			$('#memberBirthday').blur(function(event){
				if($('#memberBirthday').val()==""){
					$('#memberBirthday').css('border','solid #D20000 1px');
					$('[data-toggle="tooltip"]').tooltip();
				}else{
					$('#memberBirthday').css('border','solid #4BA104 2px');
				}
			})
		})
		
	
	</script>
	
</body>
</html>