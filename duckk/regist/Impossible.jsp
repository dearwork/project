<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용불가서비스</title>
	<style>
		body{	
			background: url("./image/backG.png");
			background-position: top;
			background-size: inherit;
			background-attachment: fixed;
		}
		.frame1{
			position:relative;
			text-align: center;
			max-width: 1200px;
			width: 100%;
			height: 500px;
			border: 5px solid #000000;
			margin: 10% auto;
			background: #ffffff;
		}
		.top{
			position:relative;
			width: 100%;
			height: 40px;
			maring-bottom: 5%;
		}
		.frame1>.box1{
			position: absolute;
			top: 20%;
			left: 14%;
			width: 25%;
			height: 60%;
			margin: auto;
			background: url("./image/imicon.png"); /*이미지 넣기*/
			image-rendering: pixelated;
			background-size: cover;
		}
		.frame1>.frame2{
			position: absolute;
			top: 20%;
			left: 39%;
			width: 45%;
			height: 59.6%;
			text-align: center;
			/*border: 1px solid #000000;*/
		}
		.frame2>h1{
		    margin-top: 10%;
		}
		input[type=button]{
			width: 140px;
			height: 50px;
			margin: 12%;
			font-size: 1.1em;
			letter-spacing: 0.3em;
		}
	</style>
</head>
<body>
	<%@include file="header.jsp" %>
	<div class="frame1">
	<div class="top"></div>
		<div class="box1"></div>
		<div class="frame2">
		<h1>죄송합니다</h1>
		<p>현재 이용할 수 없는 서비스입니다.</p>
		<input type="button" value="돌아가기" onclick="history.go(-1)">
	</div>
	</div>
</body>
</html>