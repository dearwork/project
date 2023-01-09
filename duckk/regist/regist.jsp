<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     <%@ page import = "java.sql.*"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	body{	
			background: url("./image/backG2.png");
			background-position: top;
			background-size: inherit;
			background-attachment: fixed;
		}
	form{
		text-align: center;
		margin: auto;
		width: 900px;
		height: 800px;
		border: 5px solid #cccccc;
		/*border-radius: 40px;*/
		background: #ffffff;
		background: url('./image/updatef.png');
		background-attachment: scroll;
		background-size: cover;
		background-position: inherit;
	}
	table{
		font-size: 20px;
		text-align: center;
		width: 820px;
		margin: auto;
		text-align: left;
		background-color: rgba(0, 0, 0, 0.6);
		color: #ffffff;
	}
	caption{
		text-align: center;
		font-size: 42px;
		margin: 40px;
		padding: 20px;
		letter-spacing: 15px;
		font-weight: 900;
	}
	input[type=text],input[type=password]{
		width: 300px;
		height: 24px;
	}
	input[type=text]::placeholder,input[type=password]::placeholder{
		font-size: 15px;
		padding: 3px;
	}
	input[type=text]:focus,[type=password]:focus,[type=button]:focus {outline:none;}
	input[type=button],input[type=reset]{
		width: 100px;
		height: 60px;
		border: 0px;
		border-radius: 2px;
		font-size: 15px;
	}
	input[name=Check]{
		font-weight: 500;
		letter-spacing: 2px;
	}
	input[name=name]{
		width: 180px;
	}
	select{
		font-size: 15px;
		appearance: none;
		width: 98px;
		height: 38px;
		padding: 10px;
		maring: auto 5px;
		border: 1px solid;
		border-radius: 0px
	}
	input[name=num2],input[name=num3]{
		width: 80px;
		height: 15px;
		padding: 10px;
		maring: auto 5px;
		text-align: center;
	}
	input[id=make]{
		width: 100%;
		height: 60px;
		padding: 5px;
		font-size: 24px;
		font-weight: 900;
		letter-spacing: 5px;
		margin: 0px;
	}input[class=btn1]{
		width: 220px;
		height: 50px;
		padding: 4px;
		margin: 5px;
		letter-spacing: 3px;
		font-size: 13px;
	}
	input[class=btn2]{
		width: 100%;
		height: 50px;
	}
	p{
		color: #cccccc;
		font-size: 12.4px;
		padding: 0px;
		margin: 0px;
	}
</style>
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="Check.jsp" %>
	<div id="box1"></div>
	<form name="form"  action="registproc.jsp"  method="post" autocomplete="off" >
		<div id="box2"></div>
		<table border="0" cellspacing="0" cellpadding="14">
		<caption>가입하기</caption>			
			<tr>
				<td align="center" rowspan="2">아이디</td>
				<td><input type="text" name="id" size="20" placeholder="공백없이 5자~15이내로 입력하세요." >
				&nbsp;&nbsp;<input type="button" value="중복체크"  name="Check" onclick="checkID(form)"></td>
			</tr>
			<tr>
				<td height="10"><input type="hidden" name="IDC" value=0>
				<p>* 띄어쓰기 없는 영문 · 숫자로만 아이디를 작성하세요.</p></td>
			</tr>
			<tr >
				<td align="center" rowspan="2">비밀번호</td>
				<td><input type="password" name="pwd" size="20" placeholder="공백없이 5자~15이내로 입력하세요." >
			</tr>
			<tr>
				<td height="10"><p>* 띄어쓰기 없는 영문 · 숫자·특수문자로만 비밀번호를 작성하세요.</p></td>
			</tr>
			<tr>
				<td align="center">이름</td>
				<td><input type="text" name="name" size="20" maxlength="8" placeholder="~8자이내로 입력하세요." ></td>
			</tr>
			<tr>
				<td align="center">이메일</td>
				<td><input type="text" name="email" size="20" placeholder="영문 · 숫자로만 이메일을 작성하세요."></td>
			</tr>
			<tr>
				<td align="center">전화번호</td>
				<td><select name="num1">
					<option value="010" selected>010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="019">019</option>
					</select>
					-
					<input type="text" name="num2" size="4" maxlength="4">
					-
					<input type="text" name="num3" size="4" maxlength="4">
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button" name= "make" value="회원가입" onclick="check()" id="make"> 
				</td>
			</tr>
			<tr >
				<td align="left" >
					<input type="reset" value="초기화" class="btn2">
				</td>
				<td align= "right"  >
				<input type="button" value="로그인페이지로 돌아가기" class="btn1" onclick="location.href='login.jsp'"> 
				</td>
			</tr>
		</table>
	</form>

	
</body>
</html>