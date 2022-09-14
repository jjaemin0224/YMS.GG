<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<h1>소환사전적검색페이지(gameRecord/search.jsp)</h1>
	<form name="grSearchFrm" action="grSearch" method="get">
		<input type="text" name="gr_summonerName">
		<input type="submit" value="검색">
	</form>
	
	
	<!-- <div id="grUserTier">유저티어</div>
	<div id="grList">전적리스트</div>

	<script type="text/javascript">
		var gr_summonerName = '${gr_summonerName}'
		console.log(gr_summonerName)
		Aj('grList', '#grList', gr_summonerName)
		
		function Aj(url, position, gr_summonerName){
			$.ajax({ 
				url: url,
				data: {"gr_summonerName" : gr_summonerName},
				type: 'get',
				dataType: 'html',
			}).done((data)=>{$(position).html(data);})
	  	  	.fail((err)=>console.log(err));
		} //Aj End
	</script> -->

</body>
</html>