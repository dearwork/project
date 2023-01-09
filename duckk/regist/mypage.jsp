<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저페이지</title>
</head>
<body>
<style>
	body{	
			background: url("./image/backG.png");
			background-position: top;
			background-size: inherit;
			background-attachment: fixed;
		}
	hr{
		max-width: 700px;
		width: 100%;
		margin: 20px auto; 
		border: 3px solid #000000; 
	}
	#form{
		float: left;
		text-align: center;
		width: 644px;
		height: 402px;
		margin: auto;
		margin-top: 24px;
		background: #cccccc;
	}
	h1{
		margin:auto;
		text-align: center;
	}
	.nametable{
		max-width: 800px;
		width: 100%;
		height: 170px;
		margin: 18px auto;
		background: url('./image/box_1.png');
	    background-attachment: scroll;
		background-position-x: left;
	    background-position-y: bottom;
	    background-size: cover;
}
	}
	#topbox{
		max-width: 800px;
		width: 100%;
		height: 10px;
	}
	#circle{
		width: 100px;
		height: 100px;
		border-radius: 50%;
		background: url('./image/c2.png');
		background-attachment: scroll;
		background-size: contain;
		margin: auto;
		border: 2px solid #ffffff;
	}
	#named{
		margin:10px auto;
		text-align: center;
		width: 64%;
		font-weight: 300;
		font-size: 30px;
		background-color: rgba(1000, 1000, 1000, 0.6);
		padding: 5px; 
		color:#000000;
	}
	
	
	/*hover 애니메이션 효과*/
	.gallerylist{
		max-width: 1200px;
		width: 100%;
		margin: 0 auto;
	}
	ul{font-size:0; padding: 0px;}
	ul> li {
		display: inline-block;
		vertical-align: top;
		width: 33.3%;
	}
	ul > li > a{
		display: block;
		width: auto;
		text-decoration: none;
		margin: 5px;
	}
	ul > li > a .screen{
		position:relative;
		overflow: hidden;
	}
	.Text{
		position: absolute;
		top: 15%;
	    right: 20%;
		bottom: 15%;
		left: 20%;
		text-align: center;
		z-index:2;
		color: #ffffff;
		font-size: 26px;
		font-weight: 900;
		opacity:0%;
		transition: all .35s;
	}
	.Text > img{
		position: absolute;
		top: 15%;
	    right: 20%;
		bottom: 15%;
		left: 20%;
		text-align: center;
		margin: 10px -19%;
		height: 90%;
		image-rendering: pixelated;
	}
	.Tbox{
		width: 100%;
		height: 100%;
		position: absolute;
		z-index:1;
		background: #000000;
		opacity:0%;
		transition: all .35s;
	}
	ul > li > a .screen img{width: 100%;}
	/*움직임*/
	ul > li > a:hover .Text{opacity:100%;}
	ul > li > a:hover .Tbox{opacity:80%;}
	
	
</style>
<%
			request.setCharacterEncoding("UTF-8");
			String name = (String) session.getAttribute("user_NAME");
%>
		<%@include file="header.jsp" %>
		<div class="nametable">
		<div style="height: 4px;"></div>
		<div id="circle"></div>
		<div id="named"><strong id="nameSt"><%= name %></strong></div>
		<!-- <h1>My Page</h1> -->
		</div>
		
		<hr>
		<div class="gallerylist">
			<ul>
				<li><a href="Impossible.jsp">
					<div class="screen">
						<div class="Text">장바구니
							<img src="./image/baicon.png">
						</div>
						<div class="Tbox"></div> <!-- 동) 검은 화면 -->
						<img src="./image/boximg_2.png"> <!-- 이미지 경로 적어야함 -->
					</div>
				</a></li>
				<li><a href="Impossible.jsp">
					<div class="screen">
						<div class="Text">결제목록
							<img src="./image/listicon.png">
						</div>
						<div class="Tbox"></div>
						<img src="./image/boximg_3.png"> <!-- 이미지 경로 적어야함 -->
					</div>
				</a></li>
				<li><a href="Impossible.jsp">
					<div class="screen">
						<div class="Text">질의응답
							<img src="./image/qasicon.png">
						</div>
						<div class="Tbox"></div>
						<img src="./image/boximg_6.png"> <!-- 이미지 경로 적어야함 -->
					</div>
				</a></li>
			</ul>
			<ul>
				<li><a href="update.jsp">
					<div class="screen">
						<div class="Text">정보수정
							<img src="./image/updaicon.png">
						</div>
						<div class="Tbox"></div>
					<img src="./image/boximg_1.png"> <!-- 이미지 경로 적어야함 -->
					</div>
				</a></li>
				<li><a href="logout.jsp">
					<div class="screen">
						<div class="Text">로그아웃
							<img src="./image/logicon.png">
						</div>
						<div class="Tbox"></div>
					<img src="./image/boximg_5.png"> <!-- 이미지 경로 적어야함 -->
					</div>
				</a></li>
				<li><a href="delete.jsp">
					<div class="screen">
						<div class="Text">회원탈퇴
							<img src="./image/delicon.png">
						</div>
						<div class="Tbox"></div>
						<img src="./image/boximg_4.png"> <!-- 이미지 경로 적어야함 -->
					</div>
				</a></li>
			</ul>
		</div>
		<hr>
</body>
</html>