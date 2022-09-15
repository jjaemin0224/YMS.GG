<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
a:link {
	text-decoration: none;
	color: #000;
}

.view a:link {
	text-decoration: none;
	color: ece6cc;
}

a:visited {
	text-decoration: none;
	color: grey;
}

a:active {
	text-decoration: none;
	color: ece6cc;
}

a:hover {
	text-decoration: underline;
	color: ece6cc;
}
@import 'https://fonts.googleapis.com/css?family=Open+Sans:600,700';

* {font-family: 'Open Sans', sans-serif;}

.rwd-table {
  margin: auto;
  min-width: 1100px;
  max-width: 100%;
  border-collapse: collapse;
}

.rwd-table tr:first-child {
  border-top: none;
  background: #428bca;
  color: #fff;
}

.rwd-table tr {
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
  background-color: #f5f9fc;
}

.rwd-table tr:nth-child(odd):not(:first-child) {
  background-color: #ebf3f9;
}

.rwd-table th {
  display: none;
}

.rwd-table td {
  display: block;
}

.rwd-table td:first-child {
  margin-top: .5em;
}

.rwd-table td:last-child {
  margin-bottom: .5em;
}

.rwd-table td:before {
  content: attr(data-th) ": ";
  font-weight: bold;
  width: 120px;
  display: inline-block;
  color: #000;
}

.rwd-table th,
.rwd-table td {
  text-align: left;
}

.rwd-table {
  color: #333;
  border-radius: .4em;
  overflow: hidden;
}

.rwd-table tr {
  border-color: #bfbfbf;
}

.rwd-table th,
.rwd-table td {
  padding: .5em 1em;
}
@media screen and (max-width: 601px) {
  .rwd-table tr:nth-child(2) {
    border-top: none;
  }
}
@media screen and (min-width: 600px) {
  .rwd-table tr:hover:not(:first-child) {
    background-color: #d8e7f3;
  }
  .rwd-table td:before {
    display: none;
  }
  .rwd-table th,
  .rwd-table td {
    display: table-cell;
    padding: .25em .5em;
  }
  .rwd-table th:first-child,
  .rwd-table td:first-child {
    padding-left: 0;
  }
  .rwd-table th:last-child,
  .rwd-table td:last-child {
    padding-right: 0;
  }
  .rwd-table th,
  .rwd-table td {
    padding: 1em !important;
  }
}
h1 {
  text-align: center;
  font-size: 2.4em;
  color: #f2f2f2;
}
.container {
  display: block;
  text-align: center;
}
h3 {
  display: inline-block;
  position: relative;
  text-align: center;
  font-size: 1.5em;
  color: #cecece;
}
h3:before {
  content: "\25C0";
  position: absolute;
  left: -50px;
  -webkit-animation: leftRight 2s linear infinite;
  animation: leftRight 2s linear infinite;
}
h3:after {
  content: "\25b6";
  position: absolute;
  right: -50px;
  -webkit-animation: leftRight 2s linear infinite reverse;
  animation: leftRight 2s linear infinite reverse;
}
@-webkit-keyframes leftRight {
  0%    { -webkit-transform: translateX(0)}
  25%   { -webkit-transform: translateX(-10px)}
  75%   { -webkit-transform: translateX(10px)}
  100%  { -webkit-transform: translateX(0)}
}
@keyframes leftRight {
  0%    { transform: translateX(0)}
  25%   { transform: translateX(-10px)}
  75%   { transform: translateX(10px)}
  100%  { transform: translateX(0)}
}
</style>

<style>
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
  justify-content: center;
  align-content: center;
  align-items: center;
  min-height: 100vh;
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
	align-items: center;
	  justify-content: center;
  align-content: center;
  align-items: center;
  text-align: center;
}

h1 {
  font-weight: 400;
}

code {
  color: #e4cb58;
  font: inherit;
}

</style>

<style>

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
.view{
    position: relative;
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
.view:hover{
    background: #ece6cc;
    color: #050801;
    box-shadow: 0 0 5px #ece6cc,
                0 0 25px #ece6cc,
                0 0 50px #ece6cc,
                0 0 200px #ece6cc;
     -webkit-box-reflect:below 1px linear-gradient(transparent, #0005);
}

.view span{
    position: absolute;
    display: block;
}
.view span:nth-child(1){
    top: 0;
    left: 0;
    width: 100%;
    height: 2px;
    background: linear-gradient(90deg,transparent,#ece6cc);
    animation: animate1 1s linear infinite;
}
@keyframes animate1{
    0%{
        left: -100%;
    }
    50%,100%{
        left: 100%;
    }
}
.view span:nth-child(2){
    top: -100%;
    right: 0;
    width: 2px;
    height: 100%;
    background: linear-gradient(180deg,transparent,#ece6cc);
    animation: animate2 1s linear infinite;
    animation-delay: 0.25s;
}
@keyframes animate2{
    0%{
        top: -100%;
    }
    50%,100%{
        top: 100%;
    }
}
.view span:nth-child(3){
    bottom: 0;
    right: 0;
    width: 100%;
    height: 2px;
    background: linear-gradient(270deg,transparent,#ece6cc);
    animation: animate3 1s linear infinite;
    animation-delay: 0.50s;
}
@keyframes animate3{
    0%{
        right: -100%;
    }
    50%,100%{
        right: 100%;
    }
}

.view span:nth-child(4){
    bottom: -100%;
    left: 0;
    width: 2px;
    height: 100%;
    background: linear-gradient(360deg,transparent,#ece6cc);
    animation: animate4 1s linear infinite;
    animation-delay: 0.75s;
}
@keyframes animate4{
    0%{
        bottom: -100%;
    }
    50%,100%{
        bottom: 100%;
    }
} 
.logo {
    position: absolute;
    text-align: left;
}

.button:not(:last-child) {
  margin-bottom: 2rem;
}

.button {
  border: none;
  background: transparent;
  position: relative;
  left: 390px;
  display: flex;
  padding: 0.8rem 2rem;
  overflow: hidden;
  border-radius: 100vmax;
  box-shadow: var(--shadow-elevation-high);
  transition: box-shadow 0.2s ease-in-out;
}
.button::after, .button::before {
  content: "";
  position: absolute;
  inset: 0;
  background-color: red;
}
.button::before {
  z-index: 1;
  right: -100%;
  background: linear-gradient(to right, #a7bb50 0%, #dae79c 50%, #dbff57 100%);
  background-size: 50% 100%;
  -webkit-animation: scroll 1.2s infinite linear;
          animation: scroll 1.2s infinite linear;
}
.button::after {
  z-index: 2;
  inset: 5px;
  border-radius: 100vmax;
  background-color: black;
  transition: inset 0.2s ease-in-out;
}
.button span {
  z-index: 3;
  color: white;
  text-transform: uppercase;
}
.button:hover {
  box-shadow: var(--shadow-elevation-medium);
}
.button:hover::after {
  inset: 8px;
}


</style>
	<a href="main" class="logo"><img src="resources/img/yms.png" style="width: 100px; height: 100px;" ></a>
	
	<header>
	<a href="#" class="view">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                로그아웃
            </a>
    </header>        
            
	 <div class="buttons">
        <button onclick="location.href='grSearchMv'" class="fill">전적 검색</button>
        <button onclick="location.href='caChampAnalysisMv'" class="pulse">챔피언 분석</button>
        <button class="close">챔피언 추천</button>
        <button class="raise">쿨타임 계산기</button>
        <button onclick="location.href='bbBulletinBoardMv'" class="up">자유 게시판</button>
        <button onclick="location.href='TsbList'" class="slide">팀원 찾기</button>
        <button class="offset">소환사 분석</button>
      </div>
	
<body>

    <div class="container">
        <table class="rwd-table">
        <br>
          <tbody>
            <tr>
              <th>글 번호</th>
              <th>작성자</th>
              <th>제목</th>
              <th>날짜</th>
            </tr>
			<c:forEach var="list" items="${bbList}">
				<tr>
					<td>${list.bb_postNum}</td>
					<td>${list.bb_id}</td>
					<td><a href="bbBoardView?bb_postNum=${list.bb_postNum}">${list.bb_title}</a></td>
					<td>${list.bb_date}</td>
				</tr>
			</c:forEach>
            <button onclick = "location.href='bbBoardWriteMv'" class="button" type="submit">
        <span>게시글 작성</span>
        </button>
	</table>
	<br>
	<h3>${paging}</h3>
</div>
</body>
</html>

