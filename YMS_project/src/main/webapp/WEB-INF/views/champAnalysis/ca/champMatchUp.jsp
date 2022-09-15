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
	margin: 100px;
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
				<img src="${champImg.ch_img_img1}" style="width:100px; height:100px;">
				<p> ${champImg.ch_img_championNameKr} </p>
			</td>
			<td> -----챔피언----- </td>
			<td>
				<img src="${counterImg.ch_img_img1}" style="width:100px; height:100px;">
				<p> ${counterImg.ch_img_championNameKr} </p>
			</td>
		</tr>
		
		<tr>
			<td> <p id="pickrate-orgn"> ${champCa.ca_pickrate} % </p> </td>
			<td> -----픽률----- </td>
			<td> <p id="pickrate-cntr"> ${counterCa.ca_pickrate} % </p> </td>
		</tr>
		
		<tr>
			<td> <p id="winrate-orgn"> ${champCa.ca_winrate} % </p> </td>
			<td> -----승률----- </td>
			<td> <p id="winrate-cntr"> ${counterCa.ca_winrate} % </p> </td>
		</tr>
		
		<tr>
			<td> <p id="banrate-orgn"> ${champCa.ca_banrate} % </p> </td>
			<td> -----밴률----- </td>
			<td> <p id="banrate-cntr"> ${counterCa.ca_banrate} % </p> </td>
		</tr>
		
		<tr>
			<td> <p id="poWinrate-orgn"> ${champCounter.cc_winrate_org} % </p> </td>
			<td> ----포지션 승률--- </td>
			<td> <p id="poWinrate-cntr"> ${champCounter.cc_winrate_counter} % </p> </td>
		</tr>
		
		<tr>
			<td> <p id="lnWinrate-orgn"> ${champCounter.cc_lanewinrate_org} % </p> </td>
			<td> ---라인전 승률--- </td>
			<td> <p id="lnWinrate-cntr"> ${champCounter.cc_lanewinrate_counter} % </p> </td>
		</tr>
		
		<tr>
			<td> <p id="kda-orgn"> ${champCounter.cc_kda_org} % </p> </td>
			<td> -----KDA----- </td>
			<td> <p id="kda-cntr"> ${champCounter.cc_kda_counter} % </p> </td>
		</tr>
		
		<tr>
			<td> <p id="killengagerate-orgn"> ${champCounter.cc_killengagerate_org} % </p> </td>
			<td> ----킬관여율---- </td>
			<td> <p id="killengagerate-cntr"> ${champCounter.cc_killengagerate_counter} % </p> </td>
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
	
	$(function(){
		//픽률
		if ("${champCa.ca_pickrate}" > "${counterCa.ca_pickrate}"){
			$("#pickrate-orgn").css("color","yellow");
			$("#pickrate-cntr").css("color","white");
		}
		else {
			$("#pickrate-orgn").css("color","white");
			$("#pickrate-cntr").css("color","yellow");
		}
		//승률
		if ("${champCa.ca_winrate}" > "${counterCa.ca_winrate}"){
			$("#winrate-orgn").css("color","yellow");
			$("#winrate-cntr").css("color","white");
		}
		else {
			$("#winrate-orgn").css("color","white");
			$("#winrate-cntr").css("color","yellow");
		}
		//밴률
		if ("${champCa.ca_banrate}" > "${counterCa.ca_banrate}"){
			$("#banrate-orgn").css("color","yellow");
			$("#banrate-cntr").css("color","white");
		}
		else {
			$("#banrate-orgn").css("color","white");
			$("#banrate-cntr").css("color","yellow");
		}
		//포지션 승률
		if ("${champCounter.cc_winrate_org}" > "${champCounter.cc_winrate_counter}"){
			$("#poWinrate-orgn").css("color","yellow");
			$("#poWinrate-cntr").css("color","white");
		}
		else {
			$("#poWinrate-orgn").css("color","white");
			$("#poWinrate-cntr").css("color","yellow");
		}
		//라인전 승률
		if ("${champCounter.cc_lanewinrate_org}" > "${champCounter.cc_lanewinrate_counter}"){
			$("#lnWinrate-orgn").css("color","yellow");
			$("#lnWinrate-cntr").css("color","white");
		}
		else {
			$("#lnWinrate-orgn").css("color","white");
			$("#lnWinrate-cntr").css("color","yellow");
		}
		//kda
		if ("${champCounter.cc_kda_org}" > "${champCounter.cc_kda_counter}"){
			$("#kda-orgn").css("color","yellow");
			$("#kda-cntr").css("color","white");
		}
		else {
			$("#kda-orgn").css("color","white");
			$("#kda-cntr").css("color","yellow");
		}
		//킬관여율
		if ("${champCounter.cc_killengagerate_org}}" > "${champCounter.cc_killengagerate_counter}"){
			$("#killengagerate-orgn").css("color","yellow");
			$("#killengagerate-cntr").css("color","white");
		}
		else {
			$("#killengagerate-orgn").css("color","white");
			$("#killengagerate-cntr").css("color","yellow");
		}
	});

</script>


</body>
</html>