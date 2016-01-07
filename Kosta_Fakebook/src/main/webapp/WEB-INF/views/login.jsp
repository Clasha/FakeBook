<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>

<html>
<head>
	<title>Home</title>
</head>
<body>

<div>
	<div>로고</div>
	<div>
		<form>
			<input type="text" name="id">
			<input type="text" name="pw">
			<input type="button" value="로그인" onclick="location.href=('home/main.do');"/>
		</form>
	</div>
</div>
<hr>
<div>
	회원가입<br>
	<div>
		<form>
			성명 : <input type="text" name="name"><br>
			생년월일 :<input type="text" name="birthday"><br>
			이메일 : <input type="text" name="email"><br>
			이메일 확인 : <input type="text" name="email_chk"><br>
			비밀번호 : <input type="password" name="pwd">
			<input type="button" value="회원가입" onclick="location.href=('join/join.do')"/>
		</form>
	</div>
</div>

<div>
	하단정보 입력
</div>

</body>
</html>
