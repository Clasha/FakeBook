<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 
<link rel="stylesheet" href="../../../resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../../../resources/bootstrap/bootstrap-theme.min.css">
<script type="text/javascript" src='../../../resources/bootstrap/bootstrap.min.js'></script>
 -->
<title>글 쓰기</title>
<script type="text/javascript">
	function notice_write() {
		//alert("쓰기")	;
		if (document.writeform.title.value == "") {
			alert("제목을 입력해주세요");
		} else if (document.writeform.content.value == "") {
			alert("내용을 입력해주세요");
			document.writeform.content.focus();
		} else {
			document.writeform.submit(); //전송
		}
	}
</script>
<style type="text/css">

th {
	text-align: center;
}
</style>

</head>
<body>
	<div id="container"  style="width: 720px; margin: auto; ">
		<div id="header" class="col-lg-12">
			<h1>공지사항 쓰기</h1>
			<hr />
		</div>
		<!-- header -->
		<div id="content">
			<div id="searchList" style="margin-left:3%;margin-right:3%; padding-bottom:11%">
				<!-- <div id="buttonDiv"style="float: left">
					<button type="button" class="btn btn btn-primary"
						onclick="location.href='notice_list'">공지사항</button>
				</div>  --><!-- buttonDiv -->
			</div>
			<!-- searchList -->
			<div id="writeBoard">
				<form name="writeform" action="notice_write" method="post"
					enctype="multipart/form-data">
					<table class="table table-striped table-bordered table-hover">
						<tr>
							<th>제목</th>
							<td>
							<input type="text" name="title" maxlength="20" class="form-control"
								 placeholder="제목을 입력 하세요.">
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea class="form-control" name="content" rows="15" cols="60"
							 placeholder="내용을 입력 하세요."></textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button type="button"  class="btn btn-default" onclick="location.href='notice_list'">목록</button>
								<button type="button" onclick="notice_write()" class="btn btn-default">쓰기</button>
								<button type="reset" class="btn btn-default">취소</button>
							</td>
						</tr>


					</table>


				</form>

			</div>
			<!-- writeBoard -->
		</div>
		<!-- content -->

		<div id="footer"></div>
		<!-- footer -->

	</div>
	<!-- container -->
</body>
</html>