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
<title>공지사항</title>

<style type="text/css">
th {
	text-align: center;
	background: gray;
}

textarea {
	background-color: #ffffff;
	border: 1px solid black;
}
</style>
<script type="text/javascript">
	function notice_update() {
		//alert("수정");
		location.href = "notice_updateform?num=${b.notice_num}&pg=${pg}";

	}
	function notice_delete() {
		//alert("삭제");
		location.href = "notice_delete?num=${b.notice_num}&pg=${pg}";
	}
</script>
</head>
<body>
	<div id="contanier" style="width: 720px; margin: auto; " >
		<div id="header" class="col-lg-12">
			<h1>공지사항</h1>
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
			<div id="viewTable">
			<table class="table table-striped table-hover">
				<tr>
					<th class="info" colspan="4">${b.notice_title}</th>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<!-- 날짜 --> 일자 : ${b.write_date} 
						<span style="font-size: 10pt; vertical-align: middle; font-weight: bold;"> | </span>
						<!-- 히트 --> 조회수 : ${b.notice_hit}
					</td>
					<%-- <td align="right">
						<!-- 날짜 --> 일자 : ${b.write_date}</td>
					<td align="center">
						<!-- 히트 -->조회수 : ${b.notice_hit}
					</td> --%>
				</tr>
				<tr>
					<td colspan="4">
						<textarea class="form-control" rows="15" cols="60" readonly style="cursor: auto; background-color: white;">${b.notice_contents}</textarea>
					</td>
				</tr>
				
			<c:if test="${sessionScope.loginUser.type eq '2'}">
			<tr>
					<td colspan="2" align="center">
						<button type="button" class="btn btn-default" onclick="location.href='notice_list?pg=${pg}'">
							목록</button>
						<button type="button" onclick="notice_update()"
							class="btn btn-default">수정</button>
						<button type="reset" onclick="notice_delete()"
							class="btn btn-default">삭제</button>
					</td>
				</tr>
			</c:if>
				
			</table>
			</div>
			<!-- viewTable -->
		</div>
		<!-- content -->
		<div id="footer"></div>
		<!-- footer -->

	</div>
	<!-- container -->





</body>
</html>