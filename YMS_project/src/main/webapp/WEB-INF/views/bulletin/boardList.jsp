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
	color: black;
}

a:visited {
	text-decoration: none;
}

a:active {
	text-decoration: none;
	color: grey;
}

a:hover {
	text-decoration: underline;
	color: red;
}

table {
	border-spacing: 1;
	border-collapse: collapse;
	background: white;
	border-radius: 6px;
	overflow: hidden;
	max-width: 800px;
	width: 100%;
	margin: 0 auto;
	position: relative;
	text-decoration: none;
	text-align: center;
}

table * {
	position: relative;
}

table td, table th {
	padding-left: 8px;
}

table thead tr {
	height: 60px;
	background: #FFED86;
	font-size: 16px;
}

table tbody tr {
	height: 48px;
	border-bottom: 1px solid #E3F1D5;
}

table tbody tr:last-child {
	border: 0;
}

@media screen and (max-width: 35.5em) {
	table {
		display: block;
	}
	table>*, table tr, table td, table th {
		display: block;
	}
	table thead {
		display: none;
	}
	table tbody tr {
		height: auto;
		padding: 8px 0;
	}
	table tbody tr td {
		padding-left: 45%;
		margin-bottom: 12px;
	}
	table tbody tr td:last-child {
		margin-bottom: 0;
	}
	table tbody tr td:before {
		position: absolute;
		font-weight: 700;
		width: 40%;
		left: 10px;
		top: 0;
	}
	table tbody tr td:nth-child(1):before {
		content: "Code";
	}
	table tbody tr td:nth-child(2):before {
		content: "Stock";
	}
	table tbody tr td:nth-child(3):before {
		content: "Cap";
	}
	table tbody tr td:nth-child(4):before {
		content: "Inch";
	}
	table tbody tr td:nth-child(5):before {
		content: "Box Type";
	}
}

body {
	background: #252a37;
	font: 400 14px "Calibri", "Arial";
	padding: 20px;
}

blockquote {
	color: white;
	text-align: center;
}

.paging {
	text-align: center;
	text-decoration: none;
	font-size: 20px;
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
	<div class="logo">
	<a href="main"><img src="resources/img/yms.png" style="width: 100px; height: 100px;" ></a>
	</div>
	
	 <div class="buttons">
        <button class="fill">전적 검색</button>
        <button class="pulse">챔피언 분석</button>
        <button class="close">챔피언 추천</button>
        <button class="raise">쿨타임 계산기</button>
        <button onclick="location.href='bbBulletinBoardMv'" class="up">자유 게시판</button>
        <button class="slide">팀원 찾기</button>
        <button class="offset">소환사 분석</button>
      </div>

<body>
	<div id="bbBoardTable"></div>

	<br>
	<br>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
		<thead>
		<tbody>
			<c:forEach var="list" items="${bbList}">
				<tr>
					<td>${list.bb_postNum}</td>
					<td>${list.bb_id}</td>
					<td><a href="bbBoardView?bb_postNum=${list.bb_postNum}">${list.bb_title}</a></td>
					<td>${list.bb_date}</td>
				</tr>
			</c:forEach>
		</tbody>

		<tfoot class="paging">
			<tr>
				<td></td>
				<td></td>
				<td>${paging}</td>
			</tr>
		</tfoot>

	</table>

</body>
</html>