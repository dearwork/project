<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script>
			function checkpwd(){
				var form = document.deleteform;
				var pwd = deleteform.pwd;
				var pwd1 = deleteform.pwd1;
				
				if(!pwd.value){
					alert("비밀번호를 입력해주세요.");
					pwd.focus();
					return false;
				}else if(!pwd1.value){
					alert("비밀번호 확인을 입력해주세요.");
					pwd1.focus();
					return false;
				}
				else if(pwd.value != pwd1.value){
					alert("비밀번호와 비밀번호 확인이 일치하지 않습니다. 다시 입력해주세요.");
					return false;
				}
				deleteform.submit();
			}
	</script>
	<style>
	body{
		background: url("./image/backG2.png");
		background-position: top;
		background-size: inherit;
		background-attachment: fixed;
	}
	form{
		max-width: 500px;
		width: 100%;
		height: 550px;
		margin: auto;
		background: #cccccc;
	}
	table{
		margin: auto;
		text-align: center;
		font-size: 20px;
	}
	caption{
		margin: 20px auto;
		font-size: 24px;
	}
	.box1{
		width: 100%;
		height: 30px;
	}
	.circle{
		width: 150px;
		height: 150px;
		margin: 42px auto;
		border-radius: 50%;
		background: url('./image/c3.png');
	    background-size: cover;
		background-attachment: scroll;
	}
	input[type=text],[type=password]{
			width: 400px;
			height: 35px;	
	}
	input[type=button]{
		width: 150px;
		height: 40px;
		border: 0px;	
	}
	
	</style>
</head>
<body>
	<%@include file="header.jsp" %>
	<form name ="deleteform" action="deleteproc.jsp">
	<div class="box1"></div>
	<div class="circle"></div>
		<table border="0" cellspaing="0" cellpadding="5">
		<caption>회원 탈퇴하기</caption>
			<tr>
				<td><input type="password" name="pwd"  placeholder="비밀번호를 입력하세요."></td>
			</tr>
			<tr>
				<td><input type="password" name="pwd1" placeholder="비밀번호 확인을 입력하세요." ></td>
			</tr>
			<tr>
				<td height="80"><input type="button" value="삭제하기" onclick="checkpwd()"> &nbsp;&nbsp;&nbsp;
					<input type="button" value="돌아가기" onclick="location.href='mypage.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>