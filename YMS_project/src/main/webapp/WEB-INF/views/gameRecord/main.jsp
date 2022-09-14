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
<h1>소환사 전적 검색 메인페이지</h1>

<div>소환사 정보</div>
<div>전적 테이블</div>

<button id="grInsert">전적갱신</button>


<div id="grList"></div>


<script type="text/javascript">
	
	
	var gr_summonerName = '${gr_summonerName}';
	var obj = {
		"summonerName" : gr_summonerName,
		"page" : 0
	};
	grAj("grList", "#grList", gr_summonerName);
	
	
	$("#grInsert").click(function() {
		$.ajax({
			type : 'post',
			url : 'http://127.0.0.1:5000/grInsert',
			data : obj,
			dataType : 'json',
			success : function(data) {
				alert(gr_summonerName);
				grAj("grList", "#grList", gr_summonerName);
			},
			error : function(error) {
				alert(gr_summonerName);
				grAj("grList", "#grList", gr_summonerName);
			}
		})
	});
	
	
	
	function grAj(url, position, gr_summonerName){
		$.ajax({ 
			url: url,
			data: {"gr_summonerName" : gr_summonerName},
			type: 'get',
			dataType: 'html',
		}).done((data)=>{$(position).html(data);})
  	  	.fail((err)=>console.log(err));
	} //Aj End
</script>

</body>
</html>