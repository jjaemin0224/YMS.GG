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

.selectLaneSide_wrapper{
	width:100%;
}

.selectLaneSide{
	display: inline-block;
    margin: 5px;
    border: solid 1px lightslategray;
    padding: 20px;
    border-radius: 20px;
    font-size: 20px;
}

.rwd-table {
  border-collapse: collapse;
  width:100%;
    height:100%;
    margin-left: auto;
    margin-right: auto;
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

.container {
  display: block;
  text-align: center;
}

.selectLaneSide, .champSideImg_div:hover{
	cursor: pointer;
}

</style>
<body>
	<div class="champMainImg_wrapper">
	
		<div class="selectLaneSide_wrapper" >
			<div class="selectLaneSide" id="sideLane_top" data-code="TOP">TOP</div>
			<div class="selectLaneSide" id="sideLane_jug" data-code="JUNGLE">JUG</div>
			<div class="selectLaneSide" id="sideLane_mid" data-code="MIDDLE">MID</div>
			<div class="selectLaneSide" id="sideLane_bot" data-code="BOTTOM">BOT</div>
			<div class="selectLaneSide" id="sideLane_sup" data-code="UTILITY">SUP</div>
		</div>
	<div class="container">
		<table class="rwd-table">
				<tr height="10">
					<th> <div class="selectColumn" data-code="CA_TIER" style="width:30px;">티어</div> </th>
					<th> <div>챔피언</div> </th>
					<th> <div class="selectColumn" data-code="CA_CHAMPIONNAMEKR" style="width:50px;" >이름</div> </th>
					<th> <div class="selectColumn" data-code="CA_PICKRATE" >픽률</div> </th>
					<th> <div class="selectColumn" data-code="CA_WINRATE" >승률</div> </th>
					<th> <div class="selectColumn" data-code="CA_BANRATE" >밴률</div> </th>
				</tr>
				
			<c:forEach var="list" items="${champSideList}">
				<tr>
					<td align="center">
						<p>${list.ca_tier}</p>
					</td>
					<td align="center">
						<div class="champSideImg_div" data-code="${list.ca_championId}" data-lane="${list.ca_lane}">
							<img class="champSideImg" src="${list.ca_champImg1}" style="width:40px; height:40px;">
						</div>
					</td>
					<td align="center">
						${list.ca_championNameKr}
					</td>
					<td align="center">
						${list.ca_pickrate}
					</td>
					<td align="center">
						${list.ca_winrate}
					</td>
					<td align="center">
						${list.ca_banrate}
					</td>
				</tr>
			</c:forEach>
		
		</table>
	</div>
</div>

<script type="text/javascript">
	
	checkingSideLane();

	function checkingSideLane() {
		var sideLane = "${sideLane}";
		$(".selectLaneSide").css("border", "0px solid gold");
		if (sideLane == 'TOP') {
			$("#sideLane_top").css("border", "1px solid gold");
		}
		else if (sideLane == 'JUNGLE') {
			$("#sideLane_jug").css("border", "1px solid gold");
		}
		else if (sideLane == 'MIDDLE') {
				$("#sideLane_mid").css("border", "1px solid gold");
		}
		else if (sideLane == 'BOTTOM') {
				$("#sideLane_bot").css("border", "1px solid gold");
		}
		else if (sideLane == 'UTILITY') {
				$("#sideLane_sup").css("border", "1px solid gold");
		}
	}
	
	

	$(".selectLaneSide").click(function(){
		$(".selectLaneSide").css("border", "solid 0px");
		$(this).css("border", "solid 1px gold");
		var sideLane = $(this).attr("data-code");
		$.ajax({
			url: 'caChampSideListLane',
			type: 'get',
			data: {'lane': sideLane},
			dataType: 'html',
		}).done((data)=>{
			$('#caChampSideList').html(data);
			checkingSideLane();
		}).fail((err)=>console.log(err));
	});
	
	$(".champSideImg_div").click(function() {
		var championId = String($(this).attr("data-code"));
		var lane = String($(this).attr("data-lane"));
		location.href = "caAnalysis?cc_championId=" + championId + "&cc_lane=" + lane;
	});
	
</script>

</body>
</html>