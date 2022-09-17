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
	<div>
		<table>
			<tr>
				<td colspan="3"> <p style="font-size:50px;">시작아이템</p> </td>
			</tr>
			<tr>
				<td> <p> 픽률: ${startItem.si_pickrate1} %</p> </td>
			</tr>
			<tr>
				<td> <p> 승률: ${startItem.si_winrate1} %</p> </td>
			</tr>
			<tr>
				<td>
					<c:forEach var="list1" items="${startItemImg1}">
						<img src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${list1}.png">
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td> <p> 픽률: ${startItem.si_pickrate2} %</p> </td>			
			</tr>
			<tr>
				<td> <p> 승률: ${startItem.si_winrate2} %</p> </td>		
			</tr>
			<tr>
				<td>
					<c:forEach var="list2" items="${startItemImg2}">
						<img src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${list2}.png">
					</c:forEach>
				</td>			
			</tr>
					
		</table>
	</div>
</body>
</html>