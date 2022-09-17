<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<table class="rwd-table">
					<tr height="30">
						<th width="100">작성자</th>
						<th width="100">제목</th>
						<th width="100">내용</th>
						<th width="100">플레이 시간</th>
						<!--  			<th width="100">조회수</th>  -->
					</tr>
					<c:forEach var="board" items="${tsbList}">
						<tr height="25">
							<td align="center">${board.tsb_id}</td>
							<td align="center"><a href="#"
								onclick="articleView(${board.tsb_postNum})">${board.tsb_title}</a></td>
							<td align="center">${board.tsb_que} ${board.tsb_tier} 포지션 ${board.tsb_lane}</td>
							<td align="center">${board.tsb_time}</td>
							
						</tr>
					</c:forEach>

			</table>
				</br>
				<h3>${tsbPaging}</h3>
</body>
</html>