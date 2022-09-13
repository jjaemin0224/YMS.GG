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

.selectLaneSide{
	display: inline-block;
	margin: 20px;
}
</style>
<body>
	<div class="champMainImg_wrapper">
	
		<div class="selectLaneSide_wrapper" style="width:400px;" >
			<div class="selectLaneSide" data-code="TOP">top</div>
			<div class="selectLaneSide" data-code="JUNGLE">jug</div>
			<div class="selectLaneSide" data-code="MIDDLE">mid</div>
			<div class="selectLaneSide" data-code="BOTTOM">bot</div>
			<div class="selectLaneSide" data-code="UTILITY">sup</div>
		</div>

		<table style="width:400px;">
				<tr>
					<th> <div class="selectColumn" data-code="CA_TIER" >티어</div> </th>
					<th> <div>챔피언</div> </th>
					<th> <div class="selectColumn" data-code="CA_CHAMPIONNAMEKR" >이름</div> </th>
					<th> <div class="selectColumn" data-code="CA_PICKRATE" >픽률</div> </th>
					<th> <div class="selectColumn" data-code="CA_WINRATE" >승률</div> </th>
					<th> <div class="selectColumn" data-code="CA_BANRATE" >밴률</div> </th>
				</tr>
				
			<c:forEach var="list" items="${champSideList}">
				<tr>
					<td>
						<p>${list.ca_tier}</p>
					</td>
					<td>
						<div class="champSideImg_div" data-code="${list.ca_championId}" data-lane="${list.ca_lane}">
							<img class="champSideImg" src="${list.ca_champImg1}" style="width:30px; height:30px;">
						</div>
					</td>
					<td>
						<p>${list.ca_championNameKr}</p>
					</td>
					<td>
						<p>${list.ca_pickrate}</p>
					</td>
					<td>
						<p>${list.ca_winrate}</p>
					</td>
					<td>
						<p>${list.ca_banrate}</p>
					</td>
				</tr>
			</c:forEach>
		
		</table>
	</div>


<script type="text/javascript">

	$(".selectLaneSide").click(function(){
		var sideLane = $(this).attr("data-code");
		$.ajax({
			url: 'caChampSideListLane',
			type: 'get',
			data: {'lane': sideLane},
			dataType: 'html',
		}).done((data)=>{$('#caChampSideList').html(data);})
		  	.fail((err)=>console.log(err));
	});
	
	$(".champSideImg_div").click(function() {
		var championId = String($(this).attr("data-code"));
		var lane = String($(this).attr("data-lane"));
		location.href = "caAnalysis?cc_championId=" + championId + "&cc_lane=" + lane;
	});

	
</script>

</body>
</html>