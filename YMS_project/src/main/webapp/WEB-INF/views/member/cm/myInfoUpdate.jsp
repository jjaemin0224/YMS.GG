<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>myInfoUpdate.jsp(공통)</h1>
<a href="main">홈으로</a>
<a href="cmLogout">로그아웃</a>


id : ${member.m_id}
name : ${member.m_name}
birth : ${member.m_birth}

<form action="cmMyInfoUpdate" method="post">
	<input type="text" name="m_summonerName" value="${member.m_summonerName}">
	<input type="text" name="m_phoneNum" value="${member.m_phoneNum}">
	<input type="submit" value="회원정보수정">
</form>

</body>
</html>