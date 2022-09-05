<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>보드리스트</h1>
<div id="bbBoardTable"></div>

${bbList}
${paging}

<script type="text/javascript">
	$(function(){
		var bbList = ${bbList};
		console.log(bbList);		
		//var $table = $('<table border="1">');
		//var $trH = $('<tr></tr>');
		//$('<td>').text('글번호').appendTo($trH);
		//$('<td>').text('작성자').appendTo($trH);
		//$('<td>').text('제목').appendTo($trH);
		//$('<td>').text('작석날짜').appendTo($trH);
		//$('<td>').text('좋아요').appendTo($trH);
		//trH.appendTo($table);
		
		//for (var i = 0; i < bbList.length; i++){
			//var $tr=$('<tr></tr>');
			//$('<td>').text(${bbList[i].bb_postNum}).appendTo($tr);
			//$('<td>').text(${bbList[i].bb_postNum}).appendTo($tr);
			//$('<td>').text(${bbList[i].bb_postNum}).appendTo($tr);
			//$('<td>').text(${bbList[i].bb_postNum}).appendTo($tr);
			//$('<td>').text(${bbList[i].bb_postNum}).appendTo($tr);
			//$tr.appendTo($table);
		//}
		//$table.appendTo("#bbBoardTable");
	}); // end ready
	

</script>

</body>
</html>