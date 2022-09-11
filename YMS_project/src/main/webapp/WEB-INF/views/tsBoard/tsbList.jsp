<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀원 찾기 게시판 목록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 
</head>

<style>
#articleView_layer{
	position : absolute;
	width:100%; height:100%;
	background:rgba(0,0,0,0,8);
	top:0;
	left:0;
	display:none;}
</style>

<body>


<div>
 	<div>
		<select name="tsb_que" id ="tsb_que" class = "tsbListSort">
						<option value="상관없음">큐상관 없음</option>
						<option value="솔로랭크">솔로랭크</option>
						<option value="자유랭크">자유랭크</option>
						<option value="일반">일반</option>
						<option value="칼바람">칼바람</option>
		</select>
	</div>
		<select name="tsb_lane" id ="tsb_lane" class = "tsbListSort">
						<option value="상관없음">라인 상관 없음</option>
						<option value="탑">탑</option>
						<option value="미드">미드</option>
						<option value="정글">정글</option>
						<option value="원딜">원딜</option>
						<option value="서폿">서폿</option>
		</select>
	<div>
		<select name="tsb_tier" id ="tsb_tier" class = "tsbListSort">
						<option value="상관없음">티어 상관 없음</option>
						<option value="언랭">언랭</option>
						<option value="브론즈">브론즈</option>
						<option value="실버">실버</option>
						<option value="골드">골드</option>
						<option value="플래티넘">플래티넘</option>
						<option value="다이아몬드">다이아몬드</option>
						<option value="그랜드마스터">그랜드마스터</option>
						<option value="챌린저">챌린저</option>
		</select>
	</div>

	<div id="tsbSortList">
		<table>
	<thead>
		<tr height="30">
			<th width="100">번호</th>
			<th width="100">제목</th>
			<th width="100">작성자</th>
			<th width="100">플레이 시간</th>
			<th width="100">티어</th>
			<th width="100">큐</th>
			<th width="100">라인</th>
			<th width="100">작성 시간 </th>
<!--  			<th width="100">조회수</th>  -->
		</tr>
	</thead>
	<tbody>
		<c:forEach var="board" items="${tsbList}">
			<tr height="25">
				<td align="center">${board.tsb_postNum}</td>
				<td align="center"><a href="#"
               onclick="articleView(${board.tsb_postNum})">${board.tsb_title}</a></td>
				<td align="center">${board.tsb_id}</td>
				<td align="center">${board.tsb_time}</td>
				<td align="center">${board.tsb_tier}</td>
				<td align="center">${board.tsb_que}</td>
				<td align="center">${board.tsb_lane}</td>
				<td align="center">${board.tsb_date}</td>
			</tr>
		</c:forEach>
		

		<tr>
			<td>
			<form action = "tsbWriteFrm">
			<button>글작성</button>
			</form>
			</td>
		</tr>
		
	</tbody>
		
		<tfoot class="tsbPaging">
			<tr>
				<td></td>
				<td></td>
				<td>${tsbPaging}</td>
			</tr>
		</tfoot>

	</table>
	
	</div>
	
</div>

<!-- 여기는 게시글 내용 보여줄 모달 박스 ! -->
   <div id="articleView_layer">
      <div id="contents_layer">
      </div>
   </div>
   
</body>

<script type="text/javascript">
function articleView(postnum){
	console.log(postnum)
   $('#articleView_layer').addClass('open'); //모달박스 나타남
   $.ajax({
      type:'get',
      url:'TsbContents',
      data:{"postNum" : postnum},
      dataType:'html', //생략 가능
      success:function(data){
         //console.log(data);
         $('#contents_layer').html(data);
      },
      error:function(error){
         console.log(error);
      }
      
   }); //ajax End
   $(function(){
		$('#articleView_layer').fadeIn();
	}
			)
}//end

</script>


<script type="text/javascript">
$('.tsbListSort').on('change' ,function () {
   $.ajax({
	   type:'get',
	   url:'TsbList',
	   data : {"tsb_lane" : $('#tsb_lane').val() ,"tsb_que" :$('#tsb_que').val() , "tsb_tier" : $('#tsb_tier').val()  },
	   dataType: 'html',
   }).done((data)=>{$("#tsbSortList").html(data);})
   .fail((err)=>console.log(err));
	  	   
});


</script>

</html>
