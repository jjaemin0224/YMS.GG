<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Confetti Button with pure javascript</title>
</head>

<style>

*{
  margin:0;
  padding:0;

}

body{

  background: url(resources/img/back.jpg);
  background-size: 120%;
}

p {
  background-color: transparent;
  font-size: 60px;
  position: absolute;
  left: 39.5%;
  top:20%;
      }


.neon_effect p:nth-child(1){
  color: #fff;
  font-family: Monoton;
  animation: neon1 1.5s ease-in-out infinite alternate;
}
@keyframes neon1 {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #fff, 0 0 40px #B6FF00, 0 0 70px #B6FF00, 0 0 80px #B6FF00, 0 0 100px #B6FF00, 0 0 150px #B6FF00;
  }
  to {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #B6FF00, 0 0 35px #B6FF00, 0 0 40px #B6FF00, 0 0 50px #B6FF00, 0 0 75px #B6FF00;
  }
}

:root {
  --bg: #3C465C;
  --primary: #78FFCD;
  --solid: #fff;
  --btn-w: 10em;
  --dot-w: calc(var(--btn-w)*.2);
  --tr-X: calc(var(--btn-w) - var(--dot-w));
}
* {box-sizing: border-box;}
*:before, *:after {box-sizing: border-box;}

body {
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-flow: wrap;
  font-size: 30px;
  font-family: 'Titillium Web', sans-serif;
}
h1 {
  color: var(--solid);
  font-size: 2.5rem;
  margin-top: 6rem; 
}
.btn {
  position: relative;
  margin: 0 auto;
  width: var(--btn-w);
  color: var(--primary);
  border: .15em solid var(--primary);
  border-radius: 5em;
  text-transform: uppercase;
  text-align: center;
  font-size: 1.3em;
  line-height: 2em;
  cursor: pointer;  
}
.dot {
  content: '';
  position: absolute;
  top: 0;
  width: var(--dot-w);
  height: 100%;
  border-radius: 100%;
  transition: all 300ms ease;
  display: none;
}
.dot:after {
  content: '';
  position: absolute;
  left: calc(50% - .4em);
  top: -.4em;
  height: .8em;
  width: .8em;
  background: var(--primary);
  border-radius: 1em;
  border: .25em solid var(--solid);
  box-shadow: 0 0 .7em var(--solid),
        0 0 2em var(--primary);
}
.btn:hover .dot,
.btn:focus .dot {
  animation: atom 2s infinite linear;
  display: block;
}
@keyframes atom {
  0% {transform: translateX(0) rotate(0);}
  30%{transform: translateX(var(--tr-X)) rotate(0);}
  50% {transform: translateX(var(--tr-X)) rotate(180deg);}
  80% {transform: translateX(0) rotate(180deg);}
  100% {transform: translateX(0) rotate(360deg);}
}

a:link {
	text-decoration: none;
	color: #78FFCD;
}

a:visited {
	text-decoration: none;
	color: grey;
}

a:active {
	text-decoration: none;
	color: ece6cc;
}

a:hover {
	text-decoration: underline;
	color: ece6cc;
}
</style>

<body>
  

   <link href="https://fonts.googleapis.com/css?family=Notable&display=swap" rel="stylesheet">
  <div class="neon_effect">
    <p>응 안말려 꺼져</p>
     </div>

     <div class="container"> 
      <div class="btn">
        <a href="main"><span>탈퇴완료</span></a>
        <div class="dot"></div>
      </div>
      <h1>&#x261D; Hover on the button &#x261D;</h1>
    </div>
    </body>
</html>