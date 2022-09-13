<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style>
td{
    vertical-align: bottom;
}

.content-from{
    margin-top: 70px;
}

.title-box{
	padding:10px;
    margin-top: 5px;
    width: 670px;
    height: 50px;
    border: 3px solid black;
    font-weight: bold;
    font-size: large;
    border-radius: 10px;
}

.content-box{
	padding:10px;
    margin-top: 28px;
    width: 800px;
    height: 100px;
    border: 3px solid black;
    font-size: 20px;
    border-radius: 10px;
}

.login-box {
  position: absolute;
  top: 830px;
  left: 50%;
  width: 1200px;
  padding: 30px;
  height: 130vh;
  transform: translate(-50%, -50%);
  background: rgba(27, 27, 27, 0.5);
  box-sizing: border-box;
  box-shadow: 0 15px 25px rgba(0,0,0,.6);
  border-radius: 10px;
  font-size : 30px;
}

.login-box2 h1 {
  margin: 0 0 30px;
  font-size: 50px;
  padding: 0;
  color: #fff;
  text-align: center;
}


.small_button {
  border: none;
  background: transparent;
  cursor: pointer;
}
.small_button:not(:last-child) {
  margin-bottom: 2rem;
}

.small_button {
  border: none;
  background: transparent;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0.8rem 2rem;
  overflow: hidden;
  border-radius: 100vmax;
  box-shadow: var(--shadow-elevation-high);
  transition: box-shadow 0.2s ease-in-out;
}
.small_button::after, .small_button::before {
  content: "";
  position: absolute;
  inset: 0;
  background-color: red;
}
.small_button::before {
  z-index: 1;
  right: -100%;
  background: linear-gradient(to right, #dba34e 0%, #fff785 50%, #ebd05a 100%);
  background-size: 50% 100%;
  -webkit-animation: scroll 1.2s infinite linear;
          animation: scroll 1.2s infinite linear;
}
.small_button::after {
  z-index: 2;
  inset: 5px;
  border-radius: 100vmax;
  background-color: black;
  transition: inset 0.2s ease-in-out;
}
.small_button span {
  z-index: 3;
  color: white;
  text-transform: uppercase;
}
.small_button:hover {
  box-shadow: var(--shadow-elevation-medium);
}
.small_button:hover::after {
  inset: 8px;
}

<style>

.fill:hover,
.fill:focus {
  box-shadow: inset 0 0 0 2em var(--hover);
}

.pulse:hover,
.pulse:focus {
  -webkit-animation: pulse 1s;
          animation: pulse 1s;
  box-shadow: 0 0 0 2em transparent;
}

@-webkit-keyframes pulse {
  0% {
    box-shadow: 0 0 0 0 var(--hover);
  }
}

@keyframes pulse {
  0% {
    box-shadow: 0 0 0 0 var(--hover);
  }
}
.close:hover,
.close:focus {
  box-shadow: inset -5em 0 0 0 var(--hover), inset 5em 0 0 0 var(--hover);
}

.raise:hover,
.raise:focus {
  box-shadow: 0 0.5em 0.5em -0.4em var(--hover);
  transform: translateY(-0.25em);
}

.up:hover,
.up:focus {
  box-shadow: inset 0 -3.25em 0 0 var(--hover);
}

.slide:hover,
.slide:focus {
  box-shadow: inset 9em 0 0 0 var(--hover);
}

.offset {
  box-shadow: 0 0 0 0 var(--color), inset 0 0 0 0 var(--color);
}
.offset:hover, .offset:focus {
  box-shadow: 0 0 0 0 var(--hover), inset 6em 3.5em 0 0 var(--hover);
}

.fill {
  --color: #a972cb;
  --hover: #cb72aa;
}

.pulse {
  --color: #ef6eae;
  --hover: #ef8f6e;
}

.close {
  --color: #ff7f82;
  --hover: #ffdc7f;
}

.raise {
  --color: #ffa260;
  --hover: #e5ff60;
}

.up {
  --color: #e4cb58;
  --hover: #94e458;
}

.slide {
  --color: #8fc866;
  --hover: #66c887;
}

.offset {
  --color: #19bc8b;
  --hover: #1973bc;
}

button {
  color: var(--color);
  transition: 0.25s;
}
button:hover, button:focus {
  border-color: var(--hover);
  color: #fff;
}

body {
  color: #fff;
  background: #252a37;
  font: 300 1em "Fira Sans", sans-serif;
}

button {
  background: none;
  border: 2px solid;
  font: inherit;
  line-height: 1;
  margin: 0.5em;
  padding: 1em 2em;
  height: auto;
}

.buttons {
  position: relative;
  top :-120px;
  align-items: center;
  text-align: center;
}

h1 {
  font-weight: 400;
}

code {
  color: #e4cb58;
  font: inherit;
}

</style>

<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Nanum Pen Script';
    font-size: 20px;
}
header{
    display: flex;
    vertical-align: top; 
    text-align: right;
    justify-content: right;
    align-items: center;
    height: 100px;
    background: #252a37;
    font-family: 'Raleway', sans-serif;
    font-weight: bold;
}
.view{
    position: relative;
    top:-110px;
    left: 35px;
    display: inline-block;
    padding: 25px 30px;
    margin: 40px 0;
    color: #ece6cc;
    text-decoration: none;
    text-transform: uppercase;
    transition: 0.5s;
    letter-spacing: 4px;
    overflow: hidden;
    margin-right: 50px;
   
}
.view:hover{
    background: #ece6cc;
    color: #050801;
    box-shadow: 0 0 5px #ece6cc,
                0 0 25px #ece6cc,
                0 0 50px #ece6cc,
                0 0 200px #ece6cc;
     -webkit-box-reflect:below 1px linear-gradient(transparent, #0005);
}

.view span{
    position: absolute;
    display: block;
}
.view span:nth-child(1){
    top: 0;
    left: 0;
    width: 100%;
    height: 2px;
    background: linear-gradient(90deg,transparent,#ece6cc);
    animation: animate1 1s linear infinite;
}
@keyframes animate1{
    0%{
        left: -100%;
    }
    50%,100%{
        left: 100%;
    }
}
.view span:nth-child(2){
    top: -100%;
    right: 0;
    width: 2px;
    height: 100%;
    background: linear-gradient(180deg,transparent,#ece6cc);
    animation: animate2 1s linear infinite;
    animation-delay: 0.25s;
}
@keyframes animate2{
    0%{
        top: -100%;
    }
    50%,100%{
        top: 100%;
    }
}
.view span:nth-child(3){
    bottom: 0;
    right: 0;
    width: 100%;
    height: 2px;
    background: linear-gradient(270deg,transparent,#ece6cc);
    animation: animate3 1s linear infinite;
    animation-delay: 0.50s;
}
@keyframes animate3{
    0%{
        right: -100%;
    }
    50%,100%{
        right: 100%;
    }
}

.view span:nth-child(4){
    bottom: -100%;
    left: 0;
    width: 2px;
    height: 100%;
    background: linear-gradient(360deg,transparent,#ece6cc);
    animation: animate4 1s linear infinite;
    animation-delay: 0.75s;
}
@keyframes animate4{
    0%{
        bottom: -100%;
    }
    50%,100%{
        bottom: 100%;
    }
} 

.list{
	font-size : 25px;
	font-color : #fff;

}

.button:not(:last-child) {
  margin-bottom: 2rem;
}

.button {
  border: none;
  background: transparent;
  position: absolute;
  left: 70%;
  top:57%;
  display: flex;
  padding: 0.8rem 2rem;
  overflow: hidden;
  border-radius: 100vmax;
  box-shadow: var(--shadow-elevation-high);
  transition: box-shadow 0.2s ease-in-out;
}
.button::after, .button::before {
  content: "";
  position: absolute;
  inset: 0;
  background-color: red;
}
.button::before {
  z-index: 1;
  right: -100%;
  background: linear-gradient(to right, #a7bb50 0%, #dae79c 50%, #dbff57 100%);
  background-size: 50% 100%;
  -webkit-animation: scroll 1.2s infinite linear;
          animation: scroll 1.2s infinite linear;
}
.button::after {
  z-index: 2;
  inset: 5px;
  border-radius: 100vmax;
  background-color: black;
  transition: inset 0.2s ease-in-out;
}
.button span {
  z-index: 3;
  color: white;
  text-transform: uppercase;
}
.button:hover {
  box-shadow: var(--shadow-elevation-medium);
}
.button:hover::after {
  inset: 8px;
}	

</style> 
	<a href="main" class="logo"><img src="resources/img/yms.png" style="width: 100px; height: 100px;" ></a>
	
	<header>
	<a href="#" class="view">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                로그아웃
            </a>
    </header>        
            
	 <div class="buttons">
        <button class="fill">전적 검색</button>
        <button class="pulse">챔피언 분석</button>
        <button class="close">챔피언 추천</button>
        <button class="raise">쿨타임 계산기</button>
        <button onclick="location.href='bbBulletinBoardMv'" class="up">자유 게시판</button>
        <button onclick="location.href='./TsbList'" class="slide">팀원 찾기</button>
        <button class="offset">소환사 분석</button>
      </div>

<body>
    <div class="login-box">
	글번호 : ${board.bb_postNum}
	<br>
	<br>
	작성자 : ${board.bb_id}
	<br>
	<br> 
	제목 : ${board.bb_title}
	<br>
	<br> 
	내용 : ${board.bb_content}
	<br> 
	<br>
	<br>
	<br>
	좋아요 수 : ${board.bb_like}
	<br>
	<br>
	작성 날짜 : ${board.bb_date}
	<br>
	<br>
	<form name="bbReplyFrm" id="bbReplyFrm">
		<table>
			<tr>
				<td><textarea rows="3" cols="50" name="bbr_content"
						id="bbr_content" class="content-box"></textarea></td>
			
			<button onclick = "replyInsert(${board.bb_postNum})" class="button" type="button">
        <span>댓글 작성</span>
        </button>
        </tr>
		</table>
	</form>
	<br>
	<table id="bReplyTable" class="bReplyTable">
		<c:forEach var="list" items="${bReplyList}">
			<tr>
				<td>${list.bbr_id}</td>
				<td>${list.bbr_content}</td>
				<td>${list.bbr_date}</td>
		</c:forEach>
	</table>
		</div>

	

<script type="text/javascript">
		function replyInsert(bbr_postNum){
		 
			let obj = {}; 
			obj.bbr_postNum = bbr_postNum;  
		 	obj.bbr_content = $('#bbr_content').val();
			
			$.ajax({
				method:'post',  //json넘길시 post
				url: 'bbReplyInsert',
				data: JSON.stringify(obj), 		 
				contentType:'application/json; charset=UTF-8',    //서버에서 @RequestBody로 받을것.
				dataType: 'json',//xml, html... //생략 가능 서버에서 리턴타입을 결정함
				success: function(data){
					let rlist='';
					$.each(data, function(i, bbReply) {
					rlist+='<tr height="25" align="center">'
						+'<td width="100">'+bbReply.bbr_id+'</td>'
						+'<td width="200">'+bbReply.bbr_content+'</td>'
						+'<td width="200">'+bbReply.bbr_date+'</td></tr>';	
					}); 
					$('#bReplyTable').html(rlist); 
				
					$('#bbr_content').val('').focus();
				},error: function(err){
					console.log(err);
					$('#rTable').html(err.responseText); //예외 메세지 출력
				}
			}); //ajax End	 
		}//replyInsert End
		
		
</script>
   
</body>
</html>
