<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
.progress-bar {
    width: 100%;
    height: 30px;
    background-color: #dedede;
    font-weight: 600;
    font-size: .8rem;
}

.progress-bar .progress {

    width: 72%; 
    height: 30px;
    padding: 0;
    text-align: center;
    background-color: #4F98FF;
    color: #111;
}

.matchup{
	width: 700px;
}


.matchTable{
	width: 700px;
}

</style>

<div class="progress-bar">           
   <div class="progress"> </div>
</div>

<body>
<div class="matchup">

	<h2>Match Up</h2>
	<table class="matchTable">
		<tr>
			<td> 
				<img src="${champImg.ch_img_img1}" style="width:30px; height:30px;">
				<p> ${champImg.ch_img_championNameKr} </p>
			</td>
			<td> -----챔피언----- </td>
			<td>
				<img src="${counterImg.ch_img_img1}" style="width:30px; height:30px;">
				<p> ${counterImg.ch_img_championNameKr} </p>
			</td>
		</tr>
		
		<tr>
			<td> <p> ${champCa.ca_pickrate} % </p> </td>
			<td> -----픽률----- </td>
			<td> <p> ${counterCa.ca_pickrate} % </p> </td>
		</tr>
		
		<tr>
			<td> <p> ${champCa.ca_winrate} % </p> </td>
			<td> -----승률----- </td>
			<td> <p> ${counterCa.ca_winrate} % </p> </td>
		</tr>
		
		<tr>
			<td> <p> ${champCa.ca_banrate} % </p> </td>
			<td> -----밴률----- </td>
			<td> <p> ${counterCa.ca_banrate} % </p> </td>
		</tr>
		
		<tr>
			<td> <p> ${champCounter.cc_winrate_org} % </p> </td>
			<td> ----포지션 승률--- </td>
			<td> <p> ${champCounter.cc_winrate_counter} % </p> </td>
		</tr>
		
		<tr>
			<td> <p> ${champCounter.cc_lanewinrate_org} % </p> </td>
			<td> ---라인전 승률--- </td>
			<td> <p> ${champCounter.cc_lanewinrate_counter} % </p> </td>
		</tr>
		
		<tr>
			<td> <p> ${champCounter.cc_kda_org} % </p> </td>
			<td> -----KDA----- </td>
			<td> <p> ${champCounter.cc_kda_counter} % </p> </td>
		</tr>
		
		<tr>
			<td> <p> ${champCounter.cc_killengagerate_org} % </p> </td>
			<td> ----킬관여율---- </td>
			<td> <p> ${champCounter.cc_killengagerate_counter} % </p> </td>
		</tr>
		
	</table>

</div>

<script type="text/javascript">
	$(".counterChampImg").click(function() {
		var championId = "${championId}";
		var counterId = String($(this).attr("data-code"));
		var lane = String($(this).attr("data-lane"));
		caAj1('caChampMatchUp', '#champMatchUp_ca', championId, counterId, lane);
	});

</script>


</body>
</html>