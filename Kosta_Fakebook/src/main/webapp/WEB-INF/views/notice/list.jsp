<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>공지사항</title>

<style type="text/css">
th {
	text-align: center;
}
td{
	text-align: center;
}
ul {
	list-style-type: none;
}

li {
	display: inline;
}


</style>
</head>
<body>
	<div id="contanier" style="width: 720px; margin-left: auto; margin-right: auto;" >
		<div id="header" class="col-lg-12" style="margin-bottom: 3%; margin-top: 30px;">
			<h1>공지사항</h1> <hr/>
		</div>
		<!-- header -->
		<div id="content" >

		<div class="dataTable_wrapper">
			<table class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr align="center">
						<th width="50">번호</th>
						<th width="270">제목</th>
						<th width="120">날짜</th>
						<th width="80">조회수</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="b" items="${list}">

						<tr>
							<td>${b.notice_num}</td>
							<td style="text-align: left;"><a href="notice_view?num=${b.notice_num}&pg=${pg}">${b.notice_title}</a></td>
							<td><fmt:formatDate value="${b.write_date}"
									pattern="yyyy-MM-dd" /></td>
							<td>${b.notice_hit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- dataTable_wrapper -->

		<div id="pageList">
			<nav>
			<ul class="pager">
				<li><a href="notice_list?pg=${fromPage}">First</a></li>
				<c:forEach begin="${fromPage}" end="${toPage}" var="i">
					<c:if test="${i==pg}">${i}</c:if>
					<c:if test="${i!=pg}">
						<li class="active"><a href="notice_list?pg=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<li><a href="notice_list?pg=${toPage}">End</a></li>
			</ul>
			</nav>
		</div>
		<!-- pageList -->
	
			<!-- 게시글 쓰기 및 검색 -->
			<div id="searchList" style="margin-left:3%;margin-right:3%; padding-bottom: 11%">
			<c:if test="${sessionScope.loginUser.type eq '2'}">
			<div id="buttonDiv"style="float: right;">
				<button type="button" class="btn btn btn-primary"
					onclick="location.href='notice_writeform'">글쓰기</button>
			</div> <!-- buttonDiv -->
			</c:if>
			<!-- 
			<div id="buttonDiv2"style="float:right" class="col-sm-3">
				<input type="text" class="form-control" placeholder="글 검색">
			</div>
			 -->
			 <!-- buttonDiv2 -->
			<!-- 글검색 -->
		</div>
		</div>
		<!-- content -->
		
		<div id="footer">
		</div>
		<!-- footer -->

	</div>
	<!-- contanier -->

</body>
</html>