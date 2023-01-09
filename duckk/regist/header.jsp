<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		
	}
	header{
		height: 35px;
		padding-top: 8px;
		padding: 20px;
		margin:-8px;
		margin-bottom: 50px;
		background: #cccccc;
		text-align: right;
		background: url('./image/headerP.png');
		background-size: cover;
		background-attachment: scroll;
		background-repeat: no-repeat;
		background-position: bottom;
		}
	#title{
		height: 50px;
		max-width: 183px;
		width: 100%;
		text-align: left;
		float:left;
		margin: -16px -10px;
		font-size: 45px;
		font-weight: 900;
		font-style: italic;
		background-color: rgba(1000, 1000, 1000, 0.9);
		padding: 0px 14px 0px 0px;
	}
	#title>a{
		text-decoration: none;
		color: #000000;
	
	}
	li{
		display :inline-block;
		list-style:none;
	}
	li> a:hover{
		font-weight: 900;
	}
	li>a{
		text-decoration: none;
		color: #000000;
	    font-size: 113%;
		font-weight: 500;
		background-color: rgba(1000, 1000, 1000, 0.9);
		padding: 10px;
		
	}
</style>
<script>
</script>
</head>
<body>
	<header>
	 <div id="title"><a href="Impossible.jsp"><img src="./image/TITLE.png"></a></div>
	<div class="navli">
	<nav>
		<li><a href="login.jsp">로그인</a></li>
		&nbsp;&nbsp;|&nbsp;&nbsp;
		<li><a href="agree.jsp">회원가입</a></li>
		&nbsp;&nbsp;|&nbsp;&nbsp;
		<li><a href="loginCHECK.jsp">마이페이지</a></li>
		&nbsp;&nbsp;|&nbsp;&nbsp;
		<li><a href="Impossible.jsp">고객센터</a></li>
		&nbsp;&nbsp;|&nbsp;&nbsp;
		<li><a href="Impossible.jsp">장바구니</a></li>
	</nav>
	</div>
	</header>
</body>
</html>