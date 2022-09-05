<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>boardWrite.jsp</h1>

	<form name="bbBoardWriteFrm" action="bbBoardWrite" method="get">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="bb_title" size="40"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="40" name="bb_content"></textarea></td>
			</tr>
			<tr> 
				<td> <input type="submit" value="글등록"> </td>  
			</tr>
		</table>
	</form>
   <br>
   <button onclick="location.href='bbBulletinBoardMv'">목록</button>

</body>
</html>