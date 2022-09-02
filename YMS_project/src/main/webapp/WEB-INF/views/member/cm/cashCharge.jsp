<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>cashCharge.jsp(공통)</h1>
<a href="main">홈으로</a>
<a href="cmLogout">로그아웃</a>

<form name="cmCashChargeFrm" action="cmCashCharge" method="post">
	캐시 : <input type="text" name="m_cash"> <br>
	<input type="submit" value="충전">
</form>

</body>
</html>