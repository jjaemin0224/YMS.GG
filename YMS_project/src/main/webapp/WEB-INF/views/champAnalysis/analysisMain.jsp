<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<h1>챔피언 분석 페이지</h1>
<div>
	<img src="${ChampImg.ch_img_img1}">
	<p> 이름: ${ChampImg.ch_img_championNameKr} </p>
	<p> 라인: ${ChampCounter.cc_lane} </p> 
	<p> 픽률: ${ChampCounter.cc_pickrate} % </p>
	<p> 승률: ${ChampCounter.cc_winrate} % </p>
	<p> 밴률: ${ChampCounter.cc_banrate} % </p>

	
	
	<div id="champMatchUp_ca"></div>
	<div id="champCounterInfo_ca"></div>

	
</div>

<script type="text/javascript">
	
	
	$(function() {
		var championId = "${ChampCounter.cc_championId}";
		var counterId = "${ChampCounter.cc_championId_counter}";
		var lane = "${ChampCounter.cc_lane}";
		caAj1('caChampMatchUp', '#champMatchUp_ca', championId, counterId, lane);
		caAj2('caChampCounterInfo', '#champCounterInfo_ca', championId, lane);
		
	});
	
	
	function caAj1(url, position, championId, counterId, lane){
		$.ajax({ 
			url: url,
			type: 'get',
			data: {'championId':championId,'counterId':counterId ,'lane':lane},
			dataType: 'html',
		}).done((data)=>{$(position).html(data);})
		  	.fail((err)=>console.log(err));
	} //Aj End
	
	function caAj2(url, position, championId, lane){
		$.ajax({ 
			url: url,
			type: 'get',
			data: {'championId':championId, 'lane':lane},
			dataType: 'html',
		}).done((data)=>{$(position).html(data);})
		  	.fail((err)=>console.log(err));
	} //Aj End
	
	
	
	
</script>


</body>
</html>