<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	color:#fff;
	text-align: center;
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
  top :-60px;
  align-items: center;
  text-align: center;
  font-size: 23px;
}

header{
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

img{
	margin:auto;
	background: rgba(27, 27, 27,0);
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

50%,100%{
left:100%;}
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

50%,100%{
top:100%;}
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

50%,100%{
right:100%;}
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

50%,100%{bottom:100%;}
}

#champList_wrapper{
	width: 80%;
	height: 80%;
}
#caChampMainList{
    width: 50%;
    height: 70%;
    flex-wrap: wrap;
    padding-right: 0;
    padding-left: 15px;

}

#caChampSideList{
	width: 70%;
}
.selectLane_wrapper{
	width: 8%;
    background: rgba(27, 27, 27, 0.5);
    border: solid 1px #000;
    height: 350px;
    text-align: center;
    border-radius: 10px;
}
.selectLane{
	margin: 0;
	padding: 0.5em 0.5em 0.4em 0.5em;
	border:0;
}

.champion-box{
    display: flex;
    width: 1080px;
    margin: 0px auto;
    flex-wrap: wrap;
}


h1{
	font-size:40px;
}

.champinfo{
	display:flex;
	margin-left: 30px;
}

.champMatchUp{
	display: flex; 
    width: 1080px;
    margin: 0 auto;
    font-size: 25px;
    height: 905px;
}

#champCounterInfo_ca{
	font-size:20px;
	height:820px;
}

.champLane{
	float:right;
	margin: 0 0 0 200px;
}


.lane-ca{
	padding: 10px;
	width: 40px;
	heigth: 40px;
	font-size: 30px;
	display: inline-block;
	margin : 20px;
	border : 1px solid white;	
}

.lane-ca:hover{
	cursor: pointer;
	border: 1px solid gold;
	color: gold;
}


.lane-ca:hover {
	cursor: pointer;
	border: 1px solid gold;
	color: gold;
}

.ca-wrapper {
	width: 1080px;
    margin: 0 auto;
}

#champSkillBuildInfo_ca{
    margin-top: 30px;
    margin-left: 120px;
    margin-top: 22px;
    margin-left: 120px;
    background: rgba(27, 27, 27, 0.5);
    box-sizing: border-box;
    box-shadow: 0 15px 25px rgb(0 0 0 / 60%);
    border-radius: 10px;
    width: 180px;
}

#champStartItemInfo_ca{
	margin-top: 22px;
    margin-left: 120px;
    background: rgba(27, 27, 27, 0.5);
    box-shadow: 0 15px 25px rgb(0 0 0 / 60%);
    border-radius: 10px;
    width: 240px;
    padding-left: 30px;
}

#champRuneInfo_ca{
	margin-left: 80px;
}

#champItemBuildInfo_ca{
	margin-left: 190px;
    font-size: 30px;
    margin-top: 40px;
    background: rgba(27, 27, 27, 0.5);
    box-shadow: 0 15px 25px rgb(0 0 0 / 60%);
    border-radius: 10px;
    text-align: center;
    padding-left: 30px;
}

#champShoesInfo_ca{
    margin-left: 80px;
    font-size: 30px;
    margin-top: 40px;
    background: rgba(27, 27, 27, 0.5);
    box-shadow: 0 15px 25px rgb(0 0 0 / 60%);
    border-radius: 10px;
    text-align: center;
    padding-left: 30px;
}


.champ-box{
	display: flex;
    background: rgba(27, 27, 27, 0.5);
    box-shadow: 0 15px 25px rgb(0 0 0 / 60%);
    border-radius: 10px;
    text-align: center;
    padding-left: 20px;
    padding-top: 20px;
    padding-right: 20px;
}


</style>
<a href="main" class="logo"><img src="resources/img/yms.png"
	style="width: 100px; height: 100px; position: relative; left: -900px;"></a>

<header>
	<a href="main" class="view" id = 'log'> <span></span> <span></span> <span></span>
		<span></span> login
	</a>
</header>

<div class="buttons">
	<button onclick="location.href='grSearchMv'" class="fill">??????
		??????</button>
	<button onclick="location.href='caChampAnalysisMv'" class="pulse">?????????
		??????</button>
	<button class="close">????????? ??????</button>
	<button class="raise">????????? ?????????</button>
	<button onclick="location.href='bbBulletinBoardMv'" class="up">??????
		?????????</button>
	<button onclick="location.href='TsbList'" class="slide">?????? ??????</button>
	<button class="offset">????????? ??????</button>
</div>
<body>

	<div class="ca-wrapper">
		<div class="champion-box">
			<div class="champ-box">
			<div class="champinfo-img">
				<img src="${ChampImg.ch_img_img1}">
			</div>

			<div class="champinfo">
				<h1>${ChampImg.ch_img_championNameKr}<br>${ChampCounter.cc_lane}</h1>
				<br>
				<p style="margin-left: 40px; margin-top: 35px; font-size: 25px;">
					??????: ${ChampCounter.cc_pickrate} % <br>
					<br> ??????: ${ChampCounter.cc_winrate} % <br>
					<br> ??????: ${ChampCounter.cc_banrate} %
				</p>
			</div>
			</div>
			<div class="champMatchUp">
				<div id="champCounterInfo_ca"></div>
				<div id="champMatchUp_ca"></div>

			</div>
			<div class="champInfo" style= "display: flex; font-size: 30px;">
				<div id="champRuneInfo_ca"></div>
				<div id="champSkillBuildInfo_ca"></div>
				<div id="champStartItemInfo_ca"></div>
			</div>	
			<div class="champInfo_se" style= "display: flex;"> 
				<div id="champItemBuildInfo_ca"></div>
				<div id="champShoesInfo_ca"></div>
				
			</div>
		</div>


	</div>

	<script type="text/javascript">

	
	$(function() {
		var counterId = "${ChampCounter.cc_championId_counter}";
		var championId = "${ChampCounter.cc_championId}";
		var lane = "${ChampCounter.cc_lane}";
		
		caAj1('caChampMatchUp', '#champMatchUp_ca', championId, counterId, lane);
		caAj2('caChampCounterInfo', '#champCounterInfo_ca', championId, lane);
		caAj2('caChampRuneInfo', '#champRuneInfo_ca', championId, lane);
		caAj2('caChampSkillBuildInfo', '#champSkillBuildInfo_ca', championId, lane);
		caAj2('caChampStartItemInfo', '#champStartItemInfo_ca', championId, lane);
		caAj2('caChampItemBuildInfo', '#champItemBuildInfo_ca', championId, lane);
		caAj2('caChampShoesInfo', '#champShoesInfo_ca', championId, lane);
	
	});
	
	
	function caAj1(url, position, championId, counterId, lane){
		$.ajax({ 
			url: url,
			type: 'get',
			data: {'championId':championId,'counterId':counterId ,'lane':lane},
			dataType: 'html',
		}).done((data)=>{$(position).html(data);})
		  	.fail((err)=>console.log(err));
	} //Aj End
	
	function caAj2(url, position, championId, lane){
		$.ajax({ 
			url: url,
			type: 'get',
			data: {'championId':championId, 'lane':lane},
			dataType: 'html',
		}).done((data)=>{$(position).html(data);})
		  	.fail((err)=>console.log(err));
	} //Aj End
	
	
	
</script>

<script type="text/javascript">
	$(function() {
		var uid =  "<%=(String)session.getAttribute("id")%>" 
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