<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>

<style>
.loadingImg {
	position: fixed;
	top: 25%;
	left: 40%;
}
.summonerImg {
	width: 200px;
	height: 200px;
}

</style>


<body>
	<div id="loading_wrapper">
		<img src="resources/img/loadingImg.gif" class="loadingImg">
	</div>

	<h1>소환사 전적 검색 메인페이지</h1>

	<div id="summonerInfo_div">
		<div id="summonerImg_div"></div>
		<div id="summonerUsingName_div"></div>
		<div id="summonerLevel_div"></div>
	</div>
	----------------------------------------------------
	<div id="summonerTierInfo_div">
		<div id="summonerTier_div"></div>
		<div id="summonerWinLose_div"></div>
	</div>

	----------------------------------------------------
	<button id="grInsert">전적갱신</button>


	<div id="grList"></div>


	<script type="text/javascript">
	//로딩이미지 숨김
	$("#loading_wrapper").hide();
	
	//전역변수 설정
	var gr_summonerName = '${gr_summonerName}';
	var obj = {
		"summonerName" : gr_summonerName,
		"page" : 0
	};
	
	//로딩시 전적리스트 가져옴
	grAj("grList", "#grList", gr_summonerName);
	
	
	//소환사 아이콘, 이름, 레벨 가져오기
	$.ajax({
		type : 'post',
		url : 'http://127.0.0.1:5000/grUserInfo',
		data : {"summonerName" : gr_summonerName},
		dataType : 'json',
		success : function(data) {
			var profileIconId = data['profileIconId'];
			var summonerUserName = data['name'];
			var summonerLevel = data['summonerLevel'];
			$("<img class='summonerImg'>").attr("src","http://ddragon.leagueoflegends.com/cdn/12.17.1/img/profileicon/"+profileIconId+".png").appendTo("#summonerImg_div");
			$("<div class='summonerUsingName'></div>").text(summonerUserName).appendTo("#summonerUsingName_div");
			$("<div class='summonerLevel'></div>").text(summonerLevel).appendTo("#summonerLevel_div");
		},
		error : function(error) {
			console.log(error);
		}
	});
	
	
	//소환사 티어정보 가져오기
	$.ajax({
		type : 'post',
		url : 'http://127.0.0.1:5000/grUserTierInfo',
		data : {"summonerName" : gr_summonerName},
		dataType : 'json',
		success : function(data) {
			if (data.length == 0){
				$("<div class='noTierInfo'></div>").text("<UNRANKED>").appendTo("#summonerTier_div");
			}
			var userTier = data[0]['tier'];
			var userRank = data[0]['rank'];
			var userPoint = data[0]['leaguePoints'];
			var userWin = data[0]['wins'];
			var userLose = data[0]['losses'];
			$("<div class='userTier'></div>").text(userTier).appendTo("#summonerTier_div");
			$("<div class='userRank'></div>").text(userRank).appendTo("#summonerTier_div");
			$("<div class='userPoint'></div>").text(userPoint).appendTo("#summonerTier_div");
			$("<div class='userWin'></div>").text(userWin).appendTo("#summonerWinLose_div");
			$("<div class='userLose'></div>").text(userLose).appendTo("#summonerWinLose_div");
		},
		error : function(error) {
			console.log(error);
		}
	});

	$("#grInsert").click(function() {
		$.ajax({
			type : 'post',
			url : 'http://127.0.0.1:5000/grInsert',
			data : obj,
			dataType : 'json',
			success : function(data) {
				grAj("grList", "#grList", gr_summonerName);
			},
			beforeSend : function(){
				$("#loading_wrapper").show();
		    },
			complete:function(){
				$("#loading_wrapper").hide();
		    },
			error : function(error) {
				grAj("grList", "#grList", gr_summonerName);
			}
		});
	});
	
	function grAj(url, position, gr_summonerName){
		$.ajax({ 
			url: url,
			data: {"gr_summonerName" : gr_summonerName},
			type: 'get',
			dataType: 'html',
		}).done((data)=>{$(position).html(data);})
  	  	.fail((err)=>console.log(err));
	}//Aj End
	
	
	
	
</script>

</body>
</html>