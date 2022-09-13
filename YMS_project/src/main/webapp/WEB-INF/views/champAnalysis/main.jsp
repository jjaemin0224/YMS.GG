<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<style>
#champList_wrapper{
	width: 80%;
	height: 80%;
}
#caChampMainList{
	float:left;
	width: 50%;
	height: 99%;
}
#caChampSideList{
	float:right;
	width: 25%;
	height: 99;
}
.selectLane_wrapper{
	width: 99%;
}
.selectLane{
	display: inline-block;
	margin: 30px;
}
</style>

<body>
<h1>champAnalysis/main.jsp</h1>

<div class="selectLane_wrapper">
		<div class="selectLane" data-code="ALL">all</div>
		<div class="selectLane" data-code="TOP">top</div>
		<div class="selectLane" data-code="JUNGLE">jug</div>
		<div class="selectLane" data-code="MIDDLE">mid</div>
		<div class="selectLane" data-code="BOTTOM">bot</div>
		<div class="selectLane" data-code="UTILITY">sup</div>
</div>
<p>---------------------------</p>

<div id=champList_wrapper>
	<div id=caChampMainList></div>
	<div id=caChampSideList></div>	
</div>


<script type="text/javascript">
	$(function() {
		Aj('caChampMainList', '#caChampMainList')
		Aj('caChampSideList', '#caChampSideList')
	});
	
	function Aj(url, position){
		$.ajax({ 
			url: url,
			type: 'get',
			dataType: 'html',
		}).done((data)=>{$(position).html(data);})
  	  	.fail((err)=>console.log(err));
	} //Aj End
	
	$(".selectLane").click(function() {
		var lane = $(this).attr("data-code");
		$.ajax({
			url: 'caChampMainListLane',
			type: 'get',
			data: {'lane': lane},
			dataType: 'html',
		}).done((data)=>{$('#caChampMainList').html(data);})
  	  	.fail((err)=>console.log(err));
	});
	
</script>


</body>
</html>