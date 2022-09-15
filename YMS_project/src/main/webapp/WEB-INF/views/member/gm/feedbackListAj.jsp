<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="gmFeedbackList" class="container">
		<table class="rwd-table">
			<tr height="30">
				<th width="100">요청일자</th>
				<th width="100">제목</th>
				<th width="100">요청 내용</th>
				<th width="100">요청 현황</th>

				<!--  			<th width="100">조회수</th>  -->
			</tr>
			<c:forEach var="FbBoard" items="${gmFeedbackList}">
				<tr height="25">
					<td align="center">${FbBoard.fb_req_date}</td>
					<td align="center"><a href="#"
						onclick="fbView(${FbBoard.fb_postNum})">${FbBoard.fb_req_title}</a></td>
					<td align="center">${FbBoard.fb_req_contents}</td>
					<td align="center">${FbBoard.fb_check}</td>

				</tr>
			</c:forEach>

		</table>
		<h3>${FbPaging}</h3>
	</div>
</body>
</html>