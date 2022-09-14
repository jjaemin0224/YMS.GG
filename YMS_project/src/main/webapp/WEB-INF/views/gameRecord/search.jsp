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
	<input class= "summonerNameSelectVal" type="text" name="gr_summonerName">
	<input class="summonerNameSelectBtn" type="button" value="검색">

	
	<div id="grSearchNoneMsg"></div>
	
	<script type="text/javascript">
		$(".summonerNameSelectBtn").click(function(){
			var gr_summonerName = $(".summonerNameSelectVal").val();
			$.ajax({
				type : 'post',
				url: 'http://127.0.0.1:5000/grUserSelect',
				data: {'summonerName' : gr_summonerName},
				success : function(data) {
					gr_summonerName = data;
					location.href = "grSearch?gr_summonerName=" + gr_summonerName;
				},
				error : function(err){
					$("<p></p>").text("검색된 유저가 없습니다. 다시 검색해주세요.").appendTo("#grSearchNoneMsg");
				}
			});
		});
	
	</script>

</body>
</html>