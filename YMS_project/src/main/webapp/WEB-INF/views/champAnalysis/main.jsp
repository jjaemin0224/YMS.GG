<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
</head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap')
	;

* {
	font-family: 'Nanum Pen Script';
	color: #fff;
	font-size: 20px;
}

.fill:hover, .fill:focus {
	box-shadow: inset 0 0 0 2em var(- -hover);
}

.pulse:hover, .pulse:focus {
	-webkit-animation: pulse 1s;
	animation: pulse 1s;
	box-shadow: 0 0 0 2em transparent;
}

@
-webkit-keyframes pulse { 0% {
	box-shadow: 0 0 0 0 var(- -hover);
}

}
@
keyframes pulse { 0% {
	box-shadow: 0 0 0 0 var(- -hover);
}

}
.close:hover, .close:focus {
	box-shadow: inset -5em 0 0 0 var(- -hover), inset 5em 0 0 0
		var(- -hover);
}

.raise:hover, .raise:focus {
	box-shadow: 0 0.5em 0.5em -0.4em var(- -hover);
	transform: translateY(-0.25em);
}

.up:hover, .up:focus {
	box-shadow: inset 0 -3.25em 0 0 var(- -hover);
}

.slide:hover, .slide:focus {
	box-shadow: inset 9em 0 0 0 var(- -hover);
}

.offset {
	box-shadow: 0 0 0 0 var(- -color), inset 0 0 0 0 var(- -color);
}

.offset:hover, .offset:focus {
	box-shadow: 0 0 0 0 var(- -hover), inset 6em 3.5em 0 0 var(- -hover);
}

.fill { -
	-color: #a972cb; -
	-hover: #cb72aa;
}

.pulse { -
	-color: #ef6eae; -
	-hover: #ef8f6e;
}

.close { -
	-color: #ff7f82; -
	-hover: #ffdc7f;
}

.raise { -
	-color: #ffa260; -
	-hover: #e5ff60;
}

.up { -
	-color: #e4cb58; -
	-hover: #94e458;
}

.slide { -
	-color: #8fc866; -
	-hover: #66c887;
}

.offset { -
	-color: #19bc8b; -
	-hover: #1973bc;
}

button {
	color: var(- -color);
	transition: 0.25s;
}

button:hover, button:focus {
	border-color: var(- -hover);
	color: #fff;
	cursor: pointer;
}

body {
	color: #000;
	background: #252a37;
	font: 300 1em "Fira Sans", sans-serif;
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
	top: -60px;
	align-items: center;
	text-align: center;
}

header {
	display: flex;
	vertical-align: top;
	text-align: right;
	justify-content: right;
	align-items: center;
	height: 100px;
	background: #252a37;
	font-family: 'Raleway', sans-serif;
	font-weight: bold;
}

.view {
	position: relative;
	top: -110px;
	left: 35px;
	display: inline-block;
	padding: 25px 30px;
	margin: 40px 0;
	color: #ece6cc;
	text-decoration: none;
	text-transform: uppercase;
	transition: 0.5s;
	letter-spacing: 4px;
	overflow: hidden;
	margin-right: 50px;
}

.view:hover {
	background: #ece6cc;
	color: #050801;
	box-shadow: 0 0 5px #ece6cc, 0 0 25px #ece6cc, 0 0 50px #ece6cc, 0 0
		200px #ece6cc;
	-webkit-box-reflect: below 1px linear-gradient(transparent, #0005);
}

.view span {
	position: absolute;
	display: block;
}

.view span:nth-child(1) {
	top: 0;
	left: 0;
	width: 100%;
	height: 2px;
	background: linear-gradient(90deg, transparent, #ece6cc);
	animation: animate1 1s linear infinite;
}

@
keyframes animate1 { 0%{
	left: -100%;
}

50
%
,
100
%
{
left
:
100%;
}
}
.view span:nth-child(2) {
	top: -100%;
	right: 0;
	width: 2px;
	height: 100%;
	background: linear-gradient(180deg, transparent, #ece6cc);
	animation: animate2 1s linear infinite;
	animation-delay: 0.25s;
}

@
keyframes animate2 { 0%{
	top: -100%;
}

50
%
,
100
%
{
top
:
100%;
}
}
.view span:nth-child(3) {
	bottom: 0;
	right: 0;
	width: 100%;
	height: 2px;
	background: linear-gradient(270deg, transparent, #ece6cc);
	animation: animate3 1s linear infinite;
	animation-delay: 0.50s;
}

@
keyframes animate3 { 0%{
	right: -100%;
}

50
%
,
100
%
{
right
:
100%;
}
}
.view span:nth-child(4) {
	bottom: -100%;
	left: 0;
	width: 2px;
	height: 100%;
	background: linear-gradient(360deg, transparent, #ece6cc);
	animation: animate4 1s linear infinite;
	animation-delay: 0.75s;
}

@
keyframes animate4 { 0%{
	bottom: -100%;
}

50
%
,
100
%
{
bottom
:
100%;
}
}
img {
	margin: auto;
	display: block;
	background: rgba(27, 27, 27, 0);
}

#champList_wrapper {
	width: 80%;
	height: 80%;
}

#caChampMainList {
	width: 70%;
	height: 70%;
	flex-wrap: wrap;
	padding-right: 0;
	padding-left: 15px;
}

#caChampSideList {
	width: 40%;
}

.selectLane_wrapper {
	width: 8%;
	background: rgba(27, 27, 27, 0.5);
	border: solid 1px #000;
	height: 350px;
	text-align: center;
	border-radius: 10px;
}

.selectLane {
	margin: 0;
	padding: 0.5em 0.5em 0.4em 0.5em;
	border: 0;
}

.select-box {
	display: flex;
	width: 1080px;
	margin: 0px auto;
}

.selectLane:hover {
	cursor: pointer;
}
</style>

<a href="main" class="logo"><img src="resources/img/yms.png"
	style="width: 100px; height: 100px; position: relative; left: -660px;"></a>

<header>
	<a href="main" class="view" id=log> <span></span> <span></span> <span></span>
		<span></span> log
	</a>
</header>

<div class="buttons">
	<button class="fill">전적 검색</button>
	<button class="pulse">챔피언 분석</button>
	<button class="close">챔피언 추천</button>
	<button class="raise">쿨타임 계산기</button>
	<button onclick="location.href='bbBulletinBoardMv'" class="up">자유 게시판</button>
	<button onclick="location.href='TsbList'" class="slide">팀원 찾기</button>
	<button class="offset">소환사 분석</button>
</div>
<body>
	<div class="select-box">
		<div class="selectLane_wrapper">
			<button class="selectLane" data-code="ALL" id="selectAllLane">
				<img src="resources/img/fill.png" width="40px" height="40px">
			</button>
			<button class="selectLane" data-code="TOP">
				<img src="resources/img/top.png" width="40px" height="40px">
			</button>
			<button class="selectLane" data-code="JUNGLE">
				<img src="resources/img/jug.png" width="40px" height="40px">
			</button>
			<button class="selectLane" data-code="MIDDLE">
				<img src="resources/img/mid.png" width="40px" height="40px">
			</button>
			<button class="selectLane" data-code="BOTTOM">
				<img src="resources/img/bot.png" width="40px" height="40px">
			</button>
			<button class="selectLane" data-code="UTILITY">
				<img src="resources/img/sup.png" width="40px" height="40px">
			</button>
		</div>
		<div id=caChampMainList></div>
		<div id=caChampSideList></div>
	</div>
	<script type="text/javascript">
	$(function() {
		$("#selectAllLane").css("border", "solid 1px gold");
		Aj('caChampMainList', '#caChampMainList');
		Aj('caChampSideList', '#caChampSideList');
	});
	
	function Aj(url, position){
		$.ajax({ 
			url: url,
			type: 'get',
			dataType: 'html',
		}).done((data)=>{$(position).html(data);})
  	  	.fail((err)=>console.log(err));
	} //Aj End
	
	$(".selectLane").click(function() {
		$(".selectLane").css("border", "none");
		var lane = $(this).attr("data-code");
		$.ajax({
			url: 'caChampMainListLane',
			type: 'get',
			data: {'lane': lane},
			dataType: 'html',
		}).done((data)=>{
			$('#caChampMainList').html(data);
			$(this).css("border", "1px solid gold");
		}).fail((err)=>console.log(err));
	});
	
</script>

<script type="text/javascript">
	$(function() {
		var uid =  "<%=(String) session.getAttribute("id")%>" 
		var $ele = $('#log').children();
		console.log(uid);
		if (uid  == "null" ) {
			$('#log').html("Login");
			$('#log').append($ele);
			$('#log').prop('href', "mmLoginMv");
		}
		else {
			$('#log').html("Logout");
			$('#log').append($ele);
			$('#log').prop('href', "cmLogout");	
		}
		});
</script>

</body>
</html>