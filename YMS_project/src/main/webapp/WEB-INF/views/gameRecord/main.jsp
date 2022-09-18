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
@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');
*{
	font-family: 'Nanum Pen Script';
}


.fill:hover,
.fill:focus {
  box-shadow: inset 0 0 0 2em var(--hover);
}

.pulse:hover,
.pulse:focus {
  -webkit-animation: pulse 1s;
          animation: pulse 1s;
  box-shadow: 0 0 0 2em transparent;
}

@-webkit-keyframes pulse {
  0% {
    box-shadow: 0 0 0 0 var(--hover);
  }
}

@keyframes pulse {
  0% {
    box-shadow: 0 0 0 0 var(--hover);
  }
}
.close:hover,
.close:focus {
  box-shadow: inset -5em 0 0 0 var(--hover), inset 5em 0 0 0 var(--hover);
}

.raise:hover,
.raise:focus {
  box-shadow: 0 0.5em 0.5em -0.4em var(--hover);
  transform: translateY(-0.25em);
}

.up:hover,
.up:focus {
  box-shadow: inset 0 -3.25em 0 0 var(--hover);
}

.slide:hover,
.slide:focus {
  box-shadow: inset 9em 0 0 0 var(--hover);
}

.offset {
  box-shadow: 0 0 0 0 var(--color), inset 0 0 0 0 var(--color);
}
.offset:hover, .offset:focus {
  box-shadow: 0 0 0 0 var(--hover), inset 6em 3.5em 0 0 var(--hover);
}

.fill {
  --color: #a972cb;
  --hover: #cb72aa;
}

.pulse {
  --color: #ef6eae;
  --hover: #ef8f6e;
}

.close {
  --color: #ff7f82;
  --hover: #ffdc7f;
}

.raise {
  --color: #ffa260;
  --hover: #e5ff60;
}

.up {
  --color: #e4cb58;
  --hover: #94e458;
}

.slide {
  --color: #8fc866;
  --hover: #66c887;
}

.offset {
  --color: #19bc8b;
  --hover: #1973bc;
}

button {
  color: var(--color);
  transition: 0.25s;
}
button:hover, button:focus {
  border-color: var(--hover);
  color: #fff;
}

body {
  color: #fff;
  background: #252a37;
  font: 300 1em "Fira Sans", sans-serif;
  font-size:20px;
}

button {
  background: none;
  border: 2px solid;
  font: inherit;
  line-height: 1;
  margin: 0.5em;
  padding: 1em 2em;
  height: auto;
}

.buttons {
  position: relative;
  top :-60px;
  align-items: center;
  text-align: center;
}

.loadingImg {
	position: fixed;
	top: 25%;
	left: 40%;
}

.summonerImg {
	width: 150px;
	height: 150px;
}

.userTierImg {
	width: 150px;
	height: 150px;
}

#summonerInfo_div {
	display: flex;
	width: 1080px;
	margin: 0px auto;
}

.summonerAll {
	width: 1080px;
	margin: 0 auto;
}

.summonerUsingName {
	left: -130px;
    position: relative;
}

#summonerUsingName_div {
	    font-size: 50px;
    font-weight: bold;
    margin-left: 20px;
    margin-top: 30px;
    display: flex;}

#summonerLevel_div {
	left: 52px;
	top: 175px;
	position: relative;
	line-height: 33px;
	padding: 4px;
	font-size: 40px;
	border-radius: 10px;
	color: #FFF;
	background-color: #000;
	width: 40px;
	text-align: center;
}

.grInsert {
	border: solid 2px #5383e8;
	border-radius: 10px;
	background: #5383e8;
	font-size: 30px;
	padding: 20px 20px;
	border-radius: 4px;
	height: 40px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	position: relative;
	top:100px;
	z-index:1;
}

#summonerTier_div{
	height : 155px;
}

#summonerTierInfo_div {
	font-size: 30px;
}

.userTier {
	position: relative;
	left: 165px;
	top: -130px;
}

.userPoint {
	position: relative;
	left: 165px;
	top: -130px;
}

.userWinLose {
	position: relative;
	left: 165px;
	top: -130px;
}
</style>

<a href="main" class="logo"><img src="resources/img/yms.png"
	style="width: 100px; height: 100px;"></a>

<div class="buttons">
	<button onclick="location.href='grSearchMv'" class="fill">전적
		검색</button>
	<button onclick="location.href='caChampAnalysisMv'" class="pulse">챔피언
		분석</button>
	<button class="close">챔피언 추천</button>
	<button class="raise">쿨타임 계산기</button>
	<button onclick="location.href='bbBulletinBoardMv'" class="up">자유
		게시판</button>
	<button onclick="location.href='TsbList'" class="slide">팀원 찾기</button>
	<button class="offset">소환사 분석</button>
</div>

<body>
	<div id="loading_wrapper">
		<img src="resources/img/loadingImg.gif" class="loadingImg">
	</div>

	<div class="summonerAll">
		<div id="summonerInfo_div">
			<div id="summonerImg_div">
				<div id="summonerLevel_div"></div>
			</div>
			<div id="summonerUsingName_div">
				<button id="grInsert" class="grInsert">전적갱신</button>
			</div>
			

		</div>
		----------------------------------------------------
		<div id="summonerTierInfo_div">
			<div id="summonerTier_div"></div>
			<div id="summonerWinLose_div"></div>
		</div>

		----------------------------------------------------



		<div id="grList"></div>

	</div>

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
				$("<img class='noTierInfo'>").attr("src","resources/img/UNRANKED.png").appendTo("#summonerTier_div");
			}
			var userTier = data[0]['tier'];
			var userTier = data[0]['tier'];
			var userRank = data[0]['rank'];
			var userPoint = data[0]['leaguePoints'];
			var userWin = data[0]['wins'];
			var userLose = data[0]['losses'];
			$("<img class='userTierImg'>").attr("src","resources/img/"+userTier+".png").appendTo("#summonerTier_div");
			$("<div class='userTier'></div>").text(userTier +" "+userRank).appendTo("#summonerTier_div");
			$("<div class='userPoint'></div>").text(userPoint).appendTo("#summonerTier_div");
			$("<div class='userWinLose'></div>").text(userWin+"승 "+userLose+"패").appendTo("#summonerTier_div");
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