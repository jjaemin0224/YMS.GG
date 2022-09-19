<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table>
			<tr>
				<td colspan="4"> <p style="font-size:50px; margin-right: 45px">아이템빌드</p> </td>
			</tr>
			<tr>
				<td> <img src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${itembuild.ib_item1_1}.png"> </td>
				<td> <img src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${itembuild.ib_item2_1}.png"> </td>
				<td> <img src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${itembuild.ib_item3_1}.png"> </td>
				<td style= "padding: 30px;"> 
					<p> 픽률: ${itembuild.ib_pickrate_itembuild_1} %</p>
					<p> 승률: ${itembuild.ib_winrate_itembuild_1} % </p> 
				</td>
			</tr>
			<tr>
				<td> <img src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${itembuild.ib_item1_2}.png"> </td>
				<td> <img src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${itembuild.ib_item2_2}.png"> </td>
				<td> <img src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${itembuild.ib_item3_2}.png"> </td>
				<td> 
					<p> 픽률: ${itembuild.ib_pickrate_itembuild_2} %</p>
					<p> 승률: ${itembuild.ib_winrate_itembuild_2} % </p> 
				</td>
			</tr>
			<tr>
				<td> <img src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${itembuild.ib_item1_3}.png"> </td>
				<td> <img src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${itembuild.ib_item2_3}.png"> </td>
				<td> <img src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${itembuild.ib_item3_3}.png"> </td>
				<td> 
					<p> 픽률: ${itembuild.ib_pickrate_itembuild_3} %</p>
					<p> 승률: ${itembuild.ib_winrate_itembuild_3} % </p> 
				</td>
			</tr>		
		</table>
	</div>
</body>
</html>