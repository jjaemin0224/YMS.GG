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
				<td colspan="2"> <p style="font-size:50px;">신발</p> </td>
			</tr>
			<tr>
				<td> <img src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${shoes.sh_shoes1}.png"> </td>
				<td> 
					<p> 픽률: ${shoes.sh_pickrate1} %</p>
					<p> 승률: ${shoes.sh_winrate1} % </p> 
				</td>
			</tr>
			<tr>
				<td> <img src="http://ddragon.leagueoflegends.com/cdn/12.17.1/img/item/${shoes.sh_shoes2}.png"> </td>
				<td> 
					<p> 픽률: ${shoes.sh_pickrate2} %</p>
					<p> 승률: ${shoes.sh_winrate2} % </p> 
				</td>
			</tr>
		</table>
	</div>
</body>
</html>