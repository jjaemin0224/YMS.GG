<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>my page</title>

</head>

<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
	border:0pt none;
	font-family: 'Nanum Pen Script';
	font-size:100%;
	margin:0pt;
	outline-color:invert;
	outline-style:none;
	outline-width:0pt;
	padding:0pt;
	vertical-align:baseline;
}

caption, th, td {
	font-weight:normal;
	text-align:left;
}
blockquote:before, blockquote:after, q:before, q:after {
	content:"";
}
blockquote, q {
	quotes:"" "";
}
strong, b {
	font-weight:bold;
}
em, i {
	font-style:italic;
}
* {
	margin:0pt;
	padding:0pt;
}

body {
	
	background:#151d30;
	font-size:16px;
	font-family: 'Nanum Pen Script'

}

a {
	color:#fefefe;
	text-decoration:none;
}

a:hover {
	color:#fefefe;
	text-decoration:none;
}

#wrapper {
	width:100%;
	background:url(resources/img/headerbg.jpg) center top no-repeat;
	margin:-4px 0 0 0;
}

.content {
	width:940px;
	margin:0px auto;	
	
}

#header {
	padding:35px 0px 35px 0px;
	color:#fff;
	
}

h1{
	margin:43px 0 0 0px;
	padding:0px 0 0 70px;
	background:url(images/logo.png) left top no-repeat;
	font-size:60px;
	font-weight:bold;
	font-family:"Nanum Pen Script";
	color:#fff;
}

h1 a{
	color:#fff;
	display:block;
}

h1 a:hover{
	color:#fff;
}
h1 a span{
	font-size:16px;
	font-weight:bold;
	color:#cfe7f1;
	display:block;
	text-transform:uppercase;
	font-weight:normal;
	position:absolute;
}

#menu ul {
	font-size:30px;
	list-style:none;
	color:#fffdbf;
	text-align:center;
	margin:100px 0 0 0;
}

#menu ul li{
	display:inline;
}

#menu ul li a{
	color:#fffdbf;	
	display:inline-block;
	padding:12px 22px;
	line-height:27px;
	text-decoration:none;
}

#menu ul li a:hover{
	color:#fff;	
}

#menu ul li.selected a{
	color:#fffdbf;
	background:url(images/menuhover.png) repeat;	
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;

}

#footer {
	background:url(images/footerline.jpg) left top repeat-x #0e1424;
	clear:both;
		margin:20px 0 0px 0;
}

#footer .content {
	background:url(images/footer.jpg) center top no-repeat #0e1424;
	padding:30px 0 115px 0;
}

h3 {
	font-size:22px;
	color:#fefefe;
	padding:0 0 10px 0;
}

#footer p {
 	font-size:20px;
	color:#fefefe;
	padding:5px 0;
}

#footer p a:hover{
 	text-decoration:underline;
	color:#fefefe;
	
}

#left {
	float:left;
	width:200px;
	padding:0 100px 0 0;
}

#insidetop {
	margin:0 auto;
	width:840px;
}

#footer .content a span.leftp {
	font-size:11px;
	color:#41536a;
	float:left;
	text-transform:uppercase;
	margin:90px 0 15px 0;
}

#footer .content a span.rightp {
	font-size:11px;
	color:#41536a;
	float:right;
	text-transform:uppercase;
	margin:90px 0 15px 0;
}


.login-box {
	position: relative;
	color: #fff;
	font-size: 30px;
	top: 210px;
	left: 50%;
	width: 800px;
	padding: 40px;
	transform: translate(-50%, -50%);
	background: rgba(27, 27, 27, 0.5);
	box-sizing: border-box;
	box-shadow: 0 15px 25px rgba(0,0,0,.6);
	border-radius: 10px;
  }
  
  .login-box h2 {
	margin: 0 0 30px;
	padding: 0;
	color: #fff;
	text-align: center;
  }
  
  .login-box .user-box {
	position: relative;
  }
  
  .login-box .user-box input {
	width: 100%;
	padding: 10px 0;
	font-size: 20px;
	color: #fff;
	margin-bottom: 30px;
	border: none;
	border-bottom: 1px solid #fff;
	outline: none;
	background: transparent;
  }
  .login-box .user-box label {
	position: absolute;
	top:0;
	left: 0;
	padding: 10px 0;
	font-size: 16px;
	color: #fff;
	pointer-events: none;
	transition: .5s;
  }
  
  .login-box .user-box input:focus ~ label,
  .login-box .user-box input:valid ~ label {
	top: -20px;
	left: 0;
	color: #03e9f4;
	font-size: 12px;
  }	
  
.view{
    position: absolute;
    top:8px;
    right:16px;
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

top {
  position: absolute;
  top: 8px;
  right: 16px;
}
</style>

<body>
    <div id="top">
        <div><a href="cmLogout" class="view">
		<span></span>
        <span></span>
        <span></span>
        <span></span>
        logout
    </a>
</div>
        <div id="insidetop">
            <a href="main"><img src="resources/img/yms1.png" style = "position:absolute; left:0; padding:10px; width:200px; height:200px"></a>
        </div><!--insidetop-->
    </div><!-- top -->

   

    <div id="wrapper">

        <div class="content">
     
            <div id="header">

                <h1><a href="cmMyPageMv"><span>YMG.GG</span>MyPage</a></h1>
                
                <div id="menu">

                    <ul>
                        <li><a href="cmMyInfoLoginMv">회원정보수정</a></li>
                        <li><a href="cmMyInfoPwUpdateMv">비밀번호변경</a></li>
                        <li><a href="cmMyInfoDeleteMv">회원탈퇴</a></li>
                        <li><a href="cmCashChargeMv">캐시충전</a></li>
                        <li><a href="gmFeedbackList">내 피드백</a></li>
                        <!-- 피드백 계정신청 전환 확인용 -->
                        <br>
                        <li><a href="gmFeedbackConfirmMv" >피드백 계정신청 전환 확인용</a> </li>
                    </ul>

                </div><!-- menu -->

            </div><!--header-->
            <div class="login-box">
                    아이디 : ${member.m_id} <br>
                    비밀번호 : ${member.m_pw} <br>
                    이름 : ${member.m_name} <br>
                    전화번호 : ${member.m_phoneNum} <br>
                    생년월일 : ${member.m_birth} <br>
                    이메일 : ${member.m_email} <br>
                    소환사명 : ${member.m_summonerName} <br>
                    회원등급 : ${member.m_rating} <br>
                    캐시 : ${member.m_cash} <br>
                    가입날짜 : ${member.m_creationDate} <br>
            </div>
        </div><!--content-->
    </div><!--wrapper-->

    <div id="footer">
        <div class="content">
            <div id="left">
                <h3>바로가기</h3>
                <p><a href="grSearchMv">전적 검색</a></p>
                <p><a href="caChampAnalysisMv">챔피언 분석</a></p>
                <p><a href="#">챔피언 추천</a></p>
                <p><a href="bbBulletinBoardMv">자유 게시판</a></p>
                <p><a href="TsbList">탐원 찾기</a></p>
                <p><a href="">소환사 분석</a></p>
            </div><!--left-->

            <div id="right">
                <h3>팀 사이트</h3>
                <p><a href="#">알짝딱깔센 </a></p>
                <p><a href="#">DM.GG </a></p>
                <p><a href="#">OMCA.GG</a></p>
                <p><a href="#">OP.GG</a></p>
                <p><a href="#">YOUR.GG</a></p>
                <p><a href="#">PORO.GG</a></p>
            </div><!--right-->

            <br />
            <p style="color:white;">&#169; <a href="#" style="color:#0AE618">우리는</a><a href="#" style="color:#0AE618">성공할꺼에요</a>. 아마도요? <a href="#" style="color:#0AE618">모두</a> | <a href="#" style="color:#0AE618">화이팅</a> | <a href="#" style="color:#0AE618">ㅋㅋㅋ</a></p>



        </div><!--content-->
    </div><!--footer-->
</body>
</html>
