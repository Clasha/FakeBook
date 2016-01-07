<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 
<link rel="stylesheet" href="../../../resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../../../resources/bootstrap/bootstrap-theme.min.css">
<script type="text/javascript" src='../../../resources/bootstrap/bootstrap.min.js'></script>
 -->
<title>글 수정</title>

<script type="text/javascript">
	function notice_write() {
		//alert("쓰기")	;
		if (document.writeform.title.value == "") {
			alert("제목을 입력해주세요");
		} else if (document.writeform.content.value == "") {
			alert("내용을 입력해주세요");
			document.writeform.content.focus();
		} else {
			document.writeform.submit();
		}
	}
</script>

<style type="text/css">
th {
	text-align: center;
}

body {
	text-align: center;
}
</style>

</head>
<body>
	<div id="contanier" style="width: 720px; margin: auto; " >
		<div id="header" class="col-lg-12">
			<h1>공지사항 수정</h1>
			<hr />
		</div>
		<!-- header -->
		<div id="content">
			<div id="searchList" style="margin-left:3%;margin-right:3%; padding-bottom: 11%">
				<%-- <div id="buttonDiv" style="float: left">
					<button type="button" class="btn btn btn-primary"
						onclick="location.href='notice_list?pg=${pg}'">공지사항</button>
				</div> --%>
				<!-- buttonDiv -->
			</div>
			<!-- searchList -->
			<div id="updateTable">
				<form action="notice_update" method="post">
					<table class="table table-striped table-hover">
						<tr>
							<th class="info">제목</th>
							<td class="info"><input type="hidden" name="pg" value="${pg}" /> 
								<input type="hidden" name="notice_num" value="${b.notice_num}" />
								<input type="text" name="notice_title" class="form-control success" maxlength="20" value="${b.notice_title}" /></td>
						</tr>
						<tr>
							<th class="active">내용</th>
							<td class="active">
							<textarea name="notice_contents" class="form-control" rows="10"cols="60">${b.notice_contents}</textarea>
							</td>
						</tr>

						<tr>
							<td colspan="2">
								<input type="button" class="btn btn-default" onclick="location.href='notice_list?pg=${pg}'" value="목록">
								<input type="submit" class="btn btn-default" value="수정"/>
								<input type="button" class="btn btn-default" onclick="javascript:history.back(-1);" value= "취소"/>								
							</td>
						</tr> 
					</table>
				</form>
			</div>
			<!-- updateTable -->

		</div>
		<!-- content -->
		<div id="footer"></div>
		<!-- footer -->
	</div>
	<!-- container -->
</body>
</html>