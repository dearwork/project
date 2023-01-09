<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		function Pwdcheck(){
			var pwdfind = document.pwdfind;
			var id = pwdfind.id;
			var email = pwdfind.email;
			var regexp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			if(!id.value){
				alert("아이디를 입력해주세요.");
				id.focus();
				return false;
			}
			if(!email.value){
				alert("이메일을 입력해주세요.");
				email.focus();
				return false;
			}else if(!regexp.test(email.value)){
				alert("이메일을 올바르게 입력해주세요.");
				email.focus();
				return false;
			}
			pwdfind.submit();
		}
	</script>

<style>
body{
		background: url("./image/backG2.png");
		background-position: top;
		background-size: inherit;
		background-attachment: fixed;
	}
		h1{
			margin: 10px auto;
			font-size: 60px;
			font-weight: 600;
			text-align: center;
			color: #ffffff;
		}
		hr{
			margin: 20px auto;
			background: #000000;
			height: 4px;
			max-width: 480px;
			width: 100%;
		}
		form{
			position:relative;
			max-width: 500px;
			width: 100%;
			height: 450px;
			background: #cccccc;
			margin: auto;
		}
		.box2{
			width: 100%;
			height: 15%;
		}
		#circle{
			width: 100px;
			height: 100px;
			border-radius: 50%;
			background: #000000;
			margin: 30px auto;
			background: url('./image/c3.png');
		    background-size: cover;
			background-attachment: scroll;
		}
		table{
			margin: auto;
			padding: 3px;
		}
		#hr2{
			position: absolute;
			top: 26px;
			right: 0px;
			margin: 20px auto;
			background: #000000;
			height: 4px;
			width: 100%;
			border: 0px
		}
		caption{
			margin: 30px auto;
			font-size: 15px;
			font-weight: 400;
			text-align: center;
		}
		.box1{
			text-align: center;
			font-size: 30px;
			letter-spacing: 5px;
			position: absolute;
			width: 50%;
			height: 50px;
			background: #000000;
			/*border-radius: 6px 20px 0px 0px;*/
		}
		.box1_2{
			text-align: center;
			font-size: 30px;
			letter-spacing: 5px;
			position: absolute;
			right: 0;
			width: 50%;
			height: 50px;
			background: #cccccc;
			/*border-radius: 6px 20px 0px 0px;*/
		}
		.box1> a{
			color: #ffffff;
			text-decoration: none;
			cursor:pointer;
		}
		.box1_2>a{
			color: #000000;
			text-decoration: none;
			cursor:pointer;
		}
		input[type=text],[type=password]{
			width: 400px;
			height: 35px;	
		}
		.searchB{
			text-align: center;
			width: 100%;
			height: 50px;
		}
		td>a{
			text-decoration: none;
			color: #000000;
		}
	</style>
</head>
<body>
<%@include file="header.jsp" %>
<h1>ID / PW 찾기</h1>
<form name="pwdfind" action="passfindproc.jsp" method="post" autocomplete="off">
		<div class="box1"><a href="Idfind.jsp">아이디</a></div>
		<div class="box1_2"><a href="passfind.jsp">비밀번호</a></div>
		<table border="0" cellspacing="0" cellpadding="8" >
		<hr id="hr2">
		<div class="box2"></div>
		<caption>
			<strong>비밀번호 찾기 페이지 입니다.</strong><br>
			찾고싶은 비밀번호와 함께 등록된 아이디와 <br>이메일을 입력해주세요.
		</caption>
		<tr>
			<td><input type="text" name="id" size="20" placeholder="아이디를 입력해주세요."></td>
		</tr>
		<tr>
			<td><input type="text" name="email" size="20"   placeholder="이메일을 입력해주세요." ></td>
		</tr>
		<tr>
			<td><input type="button" value="조회하기" onclick="Pwdcheck()" class="searchB"></td>
		</tr>
		<tr>
			<td><a href="login.jsp">돌아가기</a></td>
		</tr>
		</table>
</form>
</body>
</html>