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

<div id="bbBulletinBoardList"></div>
<a href="bbBoardWriteMv">게시글작성</a>


<script type="text/javascript">

	$(function(){
		Aj('bbBulletinBoardList', '#bbBulletinBoardList')
	})

	function Aj(url, position){
		$.ajax({ 
			url: url,
			type: 'get',
			dataType: 'html',
		}).done((data)=>{$(position).html(data);})
		  	.fail((err)=>console.log(err));
	} //Aj End
</script>
</body>
</html>