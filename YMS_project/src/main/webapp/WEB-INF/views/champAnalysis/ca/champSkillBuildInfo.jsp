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
	
	
	<div class="skillBuild_wrapper">
		<p style="font-size:50px;">스킬빌드</p>
	
		<c:forEach var="list" items="${skill}">
			<c:choose>
				<c:when test="${list eq 1}"> <div>Q</div> </c:when>	
				<c:when test="${list eq 2}"> <div>W</div> </c:when>
				<c:when test="${list eq 3}"> <div>E</div> </c:when>
				<c:when test="${list eq 4}"> <div style="color: yellow">R</div> </c:when>		
			</c:choose>
		</c:forEach>
	</div>
	
</body>
</html>