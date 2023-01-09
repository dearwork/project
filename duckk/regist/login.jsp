<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<style>
		body{	
			background: url("./image/backG.png");
			background-position: top;
			background-size: inherit;
			background-attachment: fixed;
		}
		form{
		    text-align: center;
		    margin: auto;
		    margin-top: 100px;
		    max-width: 700px;
			width: 100%;
		    height: 800px;
		  /*  border-radius: 40px;*/
		    background: url('./image/loginf.png');
			background-attachment: unset;
			background-size: cover;
			background-position: bottom;
		}
		#box1{
			width: 100%;
			height: 20px;
			margin-bottom: 15px;
		}
		#circle{
			text-align: center;
			width: 200px;
			height: 200px;
			border-radius: 100%;
			margin: 28px auto;
		    background: #ffffff;
		    border: 1px solid #ffffff;
		    background: url('./image/c1.png');
		    background-attachment: fixed;
		}
		caption{
		    letter-spacing: 10px;
		    font-weight: 900;
		    font-size: 47px;
		    margin: 20px 0px;
		}
		table{
			color: #ffffff;
			margin: auto;
			width: 550px;
			height: 300px;
			}
		td{
			padding: 10px;
			margin:10px;
		}
		input[type=text],[type=password]{
			border: 0px;
			width: 540px;
    		height: 20px;
			padding: 15px;
			border-radius: 10px;
		    margin-left: -10px;
		    margin-right: -10px;
			
		}
		input[type=text]::placeholder,[type=password]::placeholder{
			padding-left: 5px;
			font-size: 15px;
			letter-spacing: 2px;
		}
		input[type=button]{
		width: 100%;
		height: 55px;
		font-size: 30px;
		font-weight: 900;
		letter-spacing: 10px;
		cursor:pointer;
		border: none;
		}
		input[type=button]:focus{
			
		}
		input[type=checkbox] {
			width: 15px;
			height: 15px;
		}
		label{
			font-size: 15px;
			letter-spacing: 3px;
			color: ;
			cursor:pointer
		}
		input[type=text]:focus,[type=password]:focus,[type=button]:focus {outline:none;}
		#makeB{
			text-decoration: none;
			letter-spacing: 4px;
			cursor:pointer;
			font-size: 18px;
			color: #ffffff;
		}
		#makeB:hover{
			font-weight: 900;
			/*color: red;*/
		}
		#a1{
			text-decoration: none;
			letter-spacing: 3px;
			font-size: 15px;
			color: #ffffff;
			cursor:pointer;
		}
</style>
<script>
	function checkG(){
		var login = document.login;
		var id = login.id;
		var pwd = login.pwd;
		
		if (id.value == ""){
			alert("아이디를 입력해주세요.");
			id.focus();
			return false;
		}

		if(pwd.value == ""){
			alert("비밀번호를 입력해주세요.");
			id.focus();
			return false;
		}
		login.submit();
	}
</script>
<%
	Cookie[] cookies = request.getCookies(); 
	String id = "";


	if(cookies != null){
		for(int i = 0; i < cookies.length; i++){
			if(cookies[i].getName().equals("id")){
				id = cookies[i].getValue();
				break;
		}
	}
	}
	
%>
<body>
	<%@include file="header.jsp" %>
	<%@include file="tableproc.jsp" %>
	<form name="login" action="loginproc.jsp" method="post" autocomplete="off">
		<div id="box1"></div>
		<div id="circle"></div>
		<table border="0" cellspacing="0" cellpadding="3" >
			<caption>SIGN IN</caption>
			<tr height="15">
				<td colspan="2"><input type="text" name="id" size="20" value="<%=id%>" placeholder="아이디를 입력해주세요."></td>
			</tr>
			<tr>
				<td colspan="2"><input type="password" name="pwd" size="20"   placeholder="패스워드를 입력해주세요." ></td>
			</tr>
			<tr>
				<td align="left"><input type="checkbox" name="save" value="1"  id="check">&nbsp;<label for="check">아이디 상태 유지</label></td>
				<td colspan="2" align="right"><a href="Idfind.jsp"  id="a1">아이디 / 비밀번호 찾기</a></td>
			</tr>
			<tr ><td colspan="2"><br></td></tr>
			<tr>
				<td colspan="2"><input type="button"  value="로그인"  onclick="checkG()" id="sign"></td>
			</tr>
			<tr>
			<td colspan="2"><a href="agree.jsp" id="makeB">[&nbsp;&nbsp;아직 회원이 아니신가요?&nbsp;&nbsp;]</a></td>
				
			</tr>
		</table>
	</form>

</body>
</html>