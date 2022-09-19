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

  .container {
    width: 440px;
    height: 100%;
        overflow: overlay;
  }
  .container::-webkit-scrollbar {
    width: 10px;
  }
  .container::-webkit-scrollbar-thumb {
    background-color: #2f3542;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
  .container::-webkit-scrollbar-track {
    background-color: grey;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }

.rwd-table {
  border-collapse: collapse;
  width:500px;
    margin-left: auto;
    margin-right: auto;
	overflow: hidden
}

.rwd-table tr:first-child {
  border-top: none;
  background: #282830;
  color: #282830;
}

.rwd-table tr {
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
  background-color: #31313c;
}

.rwd-table tr:nth-child(odd):not(:first-child) {
  background-color: #31313c;
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
  color: #fff;
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
  border-color: #000;
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
    background-color: #282830;
  }
  .rwd-table td:before {
    display: none;
  }
  .rwd-table th,
  .rwd-table td {
    display: table-cell;
    color: #fff;
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

h2{
	alight:
}

.counterChampImg:hover{
	cursor:pointer;
}

</style>

<body>

<h2>카운터 선택 테이블</h2>
<div class="container">
	
	<table class="rwd-table" style="width: 400px; margin-left: 30px;">
		<tr>
			<th>티어</th>
			<th colspan="2">챔피언</th>
			<th>승률</th>
		</tr>
		
		<c:forEach var="counter" items="${champCounterList}">
			<tr height="25">
				<td align="center">${counter.cc_rank}</td>
				<td align="center">
					<div class="counterChampImg" 
					     data-code="${counter.cc_championId_counter}" 
					     data-lane="${counter.cc_lane}"> 
						<img src="${counter.cc_champImg1_counter}" style="width:30px; height:30px;">
					</div> 
				</td>
				<td align="center">${counter.cc_championName_counter}</td>
				<td align="center">${counter.cc_lanewinrate_org}%</td>
			</tr>
		</c:forEach>
	</table>
	
</div>


</body>
</html>