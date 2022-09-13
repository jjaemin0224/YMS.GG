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


<div style="float:right; margin-right:100px;">
	<h2>카운터 선택 테이블</h2>
	<table>
		<c:forEach var="counter" items="${champCounterList}">
			<tr height="25">
				<td align="center">${counter.cc_rank}</td>
				<td align="center">
					<div class="counterChampImg" 
					     data-code="${counter.cc_championId_counter}" 
					     data-lane="${counter.cc_lane}"> 
						<img src="${counter.cc_champImg1_counter}" style="width:30px; height:30px;">
					</div> 
				</td>
				<td align="center">${counter.cc_championName_counter}</td>
				<td align="center">${counter.cc_lanewinrate_org}</td>
			</tr>
		</c:forEach>
	</table>
	
</div>


</body>
</html>