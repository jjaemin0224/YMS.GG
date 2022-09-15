<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fb my page --> feeback wating list</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	${msg}

	<div id="fmWatingFeedbackList" class="container">
		<table class="rwd-table">
			<tr height="30">
				<th width="100">요청일자</th>
				<th width="100">제목</th>
				<th width="100">요청 내용</th>
				<th width="100">요청 현황</th>

				<!--  			<th width="100">조회수</th>  -->
			</tr>
			<c:forEach var="FbWtBoard" items="${fmFeedbackList}">
				<tr height="25">
					<td align="center">${FbWtBoard.fb_req_date}</td>
					<td align="center"><a
						href="fmWatingFbView?fb_postNum=${FbWtBoard.fb_postNum}">${FbWtBoard.fb_req_title}</a></td>
					<td align="center">${FbWtBoard.fb_req_contents}</td>
					<td align="center">${FbWtBoard.fb_check}</td>

				</tr>
			</c:forEach>
			<c:forEach var="FbAcBoard" items="${fmAcceptFbList}">
				<tr height="25">
					<td align="center">${FbAcBoard.fb_req_date}</td>
					<td align="center"><a
						href="fmWatingFbView?fb_postNum=${FbAcBoard.fb_postNum}">${FbAcBoard.fb_req_title}</a></td>
					<td align="center">${FbAcBoard.fb_req_contents}</td>
					<td align="center">${FbAcBoard.fb_check}</td>

				</tr>
			</c:forEach>

		</table>
		<h3>${getPaging_req}</h3>
	</div>
	<a href="cmMyPageMv">마이페이지로 돌아가기</a>




</body>
</html>