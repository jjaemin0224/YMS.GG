<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>

<body>

	<a href="mmLoginMv">로그인</a>
	<a href="mmJoinMv">회원가입</a>


	<br>
	<a href="main">홈으로</a>
	<a href="cmLogout">로그아웃</a>
	<a href="cmMyPageMv">마이페이지</a>
	<a href="cmCashChargeMv">캐시충전</a>
	
	<a href="bbBulletinBoardMv">자유게시판</a>
	
	<form name="grSearchFrm" action="grSearch" method="get">
		<input type="text" name="gr_summonerName">
		<input type="submit">
	</form>
	
	
	<div id="mainMiddle">
		<div id="mainChampList"></div>
		<div id="mainChampSideList"></div>
	</div>


	<script type="text/javascript">
	
		Aj('mainChampList', '#mainChampList')
		Aj('mainChampSideList', '#mainChampSideList')
		
		function Aj(url, position){
			$.ajax({ 
				url: url,
				type: 'get',
				dataType: 'html',
			}).done((data)=>{$(position).html(data);})
	  	  	.fail((err)=>console.log(err));
		} //Aj End
	</script>

</body>
</html>
