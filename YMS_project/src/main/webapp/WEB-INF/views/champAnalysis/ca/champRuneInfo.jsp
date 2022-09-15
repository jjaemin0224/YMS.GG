<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.rune_ra{
		width: 50px;
		height: 50px;
	}
	#runetbl{
		text-align: center;
		border-spacing: 30px;
  		border-collapse: separate;
	}
	
</style>
<body>
	<div style="margin:60px 100px;">
		<table id="runetbl">
			<tr>
				<td colspan="2"> <p style="font-size:50px;">룬 정보</p> </td>
			</tr>
			<tr>
				<td> <p> 픽률: ${runeAnalysis.ra_pickrate_rune1} % </p> </td>
				<td> <p> 픽률: ${runeAnalysis.ra_pickrate_rune2} % </p> </td>
			</tr>
			<tr>
				<td> <p> 승률: ${runeAnalysis.ra_winrate_rune1} % </p> </td>
				<td> <p> 승률: ${runeAnalysis.ra_winrate_rune2} % </p> </td>
			</tr>
			<tr>
				<td><img class="rune_ra" src="resources/img/rune/${runeAnalysis.ra_m1_rune1}.png" style="width:80px;" ></td>
				<td><img class="rune_ra" src="resources/img/rune/${runeAnalysis.ra_m1_rune2}.png" style="width:80px;" ></td>
			</tr>
			<tr>
				<td><img class="rune_ra" src="resources/img/rune/${runeAnalysis.ra_m2_rune1}.png"></td>
				<td><img class="rune_ra" src="resources/img/rune/${runeAnalysis.ra_m2_rune2}.png"></td>
			</tr>
			<tr>
				<td><img class="rune_ra" src="resources/img/rune/${runeAnalysis.ra_m3_rune1}.png"></td>
				<td><img class="rune_ra" src="resources/img/rune/${runeAnalysis.ra_m3_rune2}.png"></td>
			</tr>
			<tr>
				<td><img class="rune_ra" src="resources/img/rune/${runeAnalysis.ra_m4_rune1}.png"></td>
				<td><img class="rune_ra" src="resources/img/rune/${runeAnalysis.ra_m4_rune2}.png"></td>
			</tr>
			<tr>
				<td><img class="rune_ra" src="resources/img/rune/${runeAnalysis.ra_s1_rune1}.png"></td>
				<td><img class="rune_ra" src="resources/img/rune/${runeAnalysis.ra_s1_rune2}.png"></td>
			</tr>
			<tr>
				<td><img class="rune_ra" src="resources/img/rune/${runeAnalysis.ra_s2_rune1}.png"></td>
				<td><img class="rune_ra" src="resources/img/rune/${runeAnalysis.ra_s2_rune2}.png"></td>
			</tr>
			
		</table>
	
	</div>

</body>
</html>