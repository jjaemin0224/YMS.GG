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
#oneGameBlue_wrapper  {
	float : left;
	width : 49%;
	height : 98%;
}

#oneGameRed_wrapper {
	float : right;
	width : 49%;
	height : 98%;
}

#grBlueTable, #grRedTable {
	width: 100%;
	height: 100%;
}

.champGrImg{
	width: 50px;
	height: 50px;
}

.spellImg{
	width: 23px;
	height: 23px;
}

.mainRuneImg{
	width: 25px;
	height: 25px;
}
.subRuneImg{
	width: 21px;
	height: 21px;
}
.itemImg{
	width: 30px;
	height: 30px;
}
</style>

<body>

<div style="color:#fff;"> 
	<p> 게임시간: ${grDurationCheck}, 게임종류: ${grTypeCheck}  </p> 
</div>

<div style="height: 92%;">
	<div id="oneGameBlue_wrapper" style="border:3px solid blue">
		
		<table id="grBlueTable" >
			<c:forEach var="list" items="${grOneBlueList}">
				<tr>
					<td>
						<div class="champGrImg_div" data-code="${list.gr_championId}">
							<img class="champGrImg" src="${list.gr_champImg1}"
								style="width: 50px; height: 50px;">
						</div>
					</td>
					<td>
						<div class="spell_div" data-code="${list.gr_spell1}"></div>
						<div class="spell_div" data-code="${list.gr_spell2}"></div>
					</td>
					<td>
						<div class="mainRune_div" data-code="${list.gr_mainRune1}"></div>
						<div class="subRune_div" data-code="${list.gr_subRune1}"></div>
					</td>
					<td>
						<div> <a href="grSearch?gr_summonerName=${list.gr_summonerName}">${list.gr_summonerName}</a>  </div>
						<div class="gr_serving"> <p> ${list.gr_serving}인분 </p> </div>
					</td>
					<td>
						<p>LEVEL: ${list.gr_champLevel}</p>
						<p>KDA: ${list.gr_kills} / ${list.gr_deaths} / ${list.gr_assists}</p>
						<p>CS : ${list.gr_totalCS}</p>
					</td>
					<td>
						<p>딜량: ${list.gr_damageDealt}</p>
						<p>골드량: ${list.gr_gtotal}</p>
					</td>
					<td>
						<div class="itemImg_div" data-code="${list.gr_item1}">
							<img class="itemImg" src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${list.gr_item1}.png">
						</div>
						<div class="itemImg_div" data-code="${list.gr_item4}">
							<img class="itemImg" src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${list.gr_item4}.png">
						</div>
					</td>
					<td>
						<div class="itemImg_div" data-code="${list.gr_item2}">
							<img class="itemImg" src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${list.gr_item2}.png">
						</div>
						<div class="itemImg_div" data-code="${list.gr_item5}">
							<img class="itemImg" src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${list.gr_item5}.png">
						</div>
					</td>
					<td>
						<div class="itemImg_div" data-code="${list.gr_item3}">
							<img class="itemImg" src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${list.gr_item3}.png">
						</div>
						<div class="itemImg_div" data-code="${list.gr_item6}">
							<img class="itemImg" src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${list.gr_item6}.png">
						</div>
					</td>
					<td>
						<div class="itemImg_div" data-code="${list.gr_accessories}">
							<img class="itemImg" src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${list.gr_accessories}.png">
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	 </div>
	<div id="oneGameRed_wrapper" style="border:3px solid red"> 
		<table id="grRedTable">
			<c:forEach var="list" items="${grOneRedList}">
				<tr>
					<td>
						<div class="champGrImg_div" data-code="${list.gr_championId}">
							<img class="champGrImg" src="${list.gr_champImg1}">
						</div>
					</td>
					<td>
						<div class="spell_div" data-code="${list.gr_spell1}"></div>
						<div class="spell_div" data-code="${list.gr_spell2}"></div>
					</td>
					<td>
						<div class="mainRune_div" data-code="${list.gr_mainRune1}"></div>
						<div class="subRune_div" data-code="${list.gr_subRune1}"></div>
					</td>
					<td>
						<div> <a href="grSearch?gr_summonerName=${list.gr_summonerName}">${list.gr_summonerName}</a>  </div>
						<div class="gr_serving"> <p> ${list.gr_serving}인분 </p> </div>
					</td>
					<td>
						<p>LEVEL: ${list.gr_champLevel}</p>
						<p>KDA: ${list.gr_kills} / ${list.gr_deaths} / ${list.gr_assists}</p>
						<p>CS : ${list.gr_totalCS}</p>
					</td>
					<td>
						<p>딜량: ${list.gr_damageDealt}</p>
						<p>골드량: ${list.gr_gtotal}</p>
					</td>
					<td>
						<div class="itemImg_div" data-code="${list.gr_item1}">
							<img class="itemImg" src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${list.gr_item1}.png">
						</div>
						<div class="itemImg_div" data-code="${list.gr_item4}">
							<img class="itemImg" src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${list.gr_item4}.png">
						</div>
					</td>
					<td>
						<div class="itemImg_div" data-code="${list.gr_item2}">
							<img class="itemImg" src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${list.gr_item2}.png">
						</div>
						<div class="itemImg_div" data-code="${list.gr_item5}">
							<img class="itemImg" src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${list.gr_item5}.png">
						</div>
					</td>
					<td>
						<div class="itemImg_div" data-code="${list.gr_item3}">
							<img class="itemImg" src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${list.gr_item3}.png">
						</div>
						<div class="itemImg_div" data-code="${list.gr_item6}">
							<img class="itemImg" src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${list.gr_item6}.png">
						</div>
					</td>
					<td>
						<div class="itemImg_div" data-code="${list.gr_accessories}">
							<img class="itemImg" src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${list.gr_accessories}.png">
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	 </div>
</div>


<script type="text/javascript">
	$(function(){
		
		var wincheck = "${grWinCheck}";
		if (wincheck == 1) {
			$("#grBlueTable").css("background", "#ecf2ff");
			$("#grRedTable").css("background", "#fff1f3");
		}
		else {
			$("#grBlueTable").css("background", "#fff1f3");
			$("#grRedTable").css("background", "#ecf2ff");
		}
	});
	
	// 스펠이미지 띄우기
	$(function(){
		$(".spellImg").remove();
		$(".spell_div").each(function(index, item){
			if ($(item).attr("data-code") == 1){
				$("<img class='spellImg'>").attr("src","http://ddragon.leagueoflegends.com/cdn/12.17.1/img/spell/SummonerBarrier.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 3){
				$("<img class='spellImg'>").attr("src","http://ddragon.leagueoflegends.com/cdn/12.17.1/img/spell/SummonerExhaust.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 4){
				$("<img class='spellImg'>").attr("src","http://ddragon.leagueoflegends.com/cdn/12.17.1/img/spell/SummonerFlash.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 6){
				$("<img class='spellImg'>").attr("src","http://ddragon.leagueoflegends.com/cdn/12.17.1/img/spell/SummonerHaste.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 7){
				$("<img class='spellImg'>").attr("src","http://ddragon.leagueoflegends.com/cdn/12.17.1/img/spell/SummonerHeal.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 11){
				$("<img class='spellImg'>").attr("src","http://ddragon.leagueoflegends.com/cdn/12.17.1/img/spell/SummonerSmite.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 12){
				$("<img class='spellImg'>").attr("src","http://ddragon.leagueoflegends.com/cdn/12.17.1/img/spell/SummonerTeleport.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 13){
				$("<img class='spellImg'>").attr("src","http://ddragon.leagueoflegends.com/cdn/12.17.1/img/spell/SummonerMana.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 14){
				$("<img class='spellImg'>").attr("src","http://ddragon.leagueoflegends.com/cdn/12.17.1/img/spell/SummonerDot.png").appendTo($(this));
			}
			else if (($(item).attr("data-code") == 39) | ($(item).attr("data-code") == 32)){
				$("<img class='spellImg'>").attr("src","http://ddragon.leagueoflegends.com/cdn/12.17.1/img/spell/SummonerSnowball.png").appendTo($(this));
			}
		});
		
	});
	
	// 룬이미지 띄우기
	$(function() {
		$(".mainRuneImg").remove();
		$(".mainRune_div").each(function(index, item){
			if ($(item).attr("data-code") == 8112){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Domination/Electrocute/Electrocute.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 8124){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Domination/Predator/Predator.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 8128){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Domination/DarkHarvest/DarkHarvest.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 9923){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Domination/HailOfBlades/HailOfBlades.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 8351){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Inspiration/GlacialAugment/GlacialAugment.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 8360){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Inspiration/UnsealedSpellbook/UnsealedSpellbook.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 8369){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Inspiration/FirstStrike/FirstStrike.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 8005){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Precision/PressTheAttack/PressTheAttack.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 8008){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Precision/LethalTempo/LethalTempoTemp.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 8021){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Precision/FleetFootwork/FleetFootwork.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 8010){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Precision/Conqueror/Conqueror.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 8437){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Resolve/GraspOfTheUndying/GraspOfTheUndying.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 8439){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Resolve/VeteranAftershock/VeteranAftershock.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 8465){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Resolve/Guardian/Guardian.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 8214){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Sorcery/SummonAery/SummonAery.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 8229){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Sorcery/ArcaneComet/ArcaneComet.png").appendTo($(this));
			}
			else if ($(item).attr("data-code") == 8230){
				$("<img class='mainRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/Sorcery/PhaseRush/PhaseRush.png").appendTo($(this));
			}
		});	
	});
	
	
	// 서브룬 이미지 띄우기
	$(function() {
		$(".subRuneImg").remove();
		var arr1 = ['8126','8139','8143','8136','8120','8138','8135','8134','8105','8106'];
		var arr2 = ['8306','8304','8313','8321','8316','8345','8347','8410','8352'];
		var arr3 = ['9101','9111','8009','9104','9105','9103','8014','8017','8299'];
		var arr4 = ['8446','8463','8401','8429','8444','8473','8451','8453','8242'];
		var arr5 = ['8224','8226','8275','8210','8234','8233','8237','8232','8236'];		
		$(".subRune_div").each(function(index, item){
			if (arr1.includes($(item).attr("data-code"))){
				$("<img class='subRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/7200_Domination.png").appendTo($(this));
			}
			else if (arr2.includes($(item).attr("data-code"))){
				$("<img class='subRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/7203_Whimsy.png").appendTo($(this));
			}
			else if (arr3.includes($(item).attr("data-code"))){
				$("<img class='subRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/7201_Precision.png").appendTo($(this));
			}
			else if (arr4.includes($(item).attr("data-code"))){
				$("<img class='subRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/7204_Resolve.png").appendTo($(this));
			}
			else if (arr5.includes($(item).attr("data-code"))){
				$("<img class='subRuneImg'>").attr("src","https://ddragon.canisback.com/img/perk-images/Styles/7202_Sorcery.png").appendTo($(this));	
			}
		});	
	});

</script>


</body>
</html>