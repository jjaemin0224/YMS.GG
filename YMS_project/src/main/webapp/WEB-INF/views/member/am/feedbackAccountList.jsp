<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>feedbackAccountList.jsp</h1>
<table>
	<thead>
		<tr>
			<th>신청 번호</th> 		
			<th>신청자</th>
			<th>신청 내용</th>
			<th>신청 날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="list" items="${fabList}">
			<tr> 
				<td>${list.fba_postnum}</td>
				<td >
				<a href="gmFeedbackConfirmView?fba_postnum=${list.fba_postnum}">${list.fba_id}</a>
				</td>
				<td>${list.fba_portfolio}</td>
				<td>${list.fba_date}</td>
				
			</tr>	
		</c:forEach>
	</tbody>
</table>


</body>
</html>