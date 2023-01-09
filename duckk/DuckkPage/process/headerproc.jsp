<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="shortcut icon" href="./../image/s-image/favicon.ico" type="image/x-icon">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./../CSS/reset.css">
    <link rel="stylesheet" href="./../CSS/header.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.3/TweenMax.min.js"></script>
    <script src="./../JS/jquery.min.js"></script>
    <title>DUCKK</title>
</head>
<script>
		<%
			String Link = "";
			String Name_main = "";
			String Name_sub = "";
			String userNAME = (String)session.getAttribute("user_NAME");
		
			if(userNAME == null){
					Name_main = "로그인";
					Name_sub = "로그인해 이용부탁";
					Link= "Login.jsp";
			}else if(userNAME == "관리자") {
					Name_main = "관리자";
					Name_sub = "관리자님 환영합니다.";
					Link= "mypage_admin.jsp";
			}else {
				Name_main = userNAME + "님";
				Name_sub = userNAME  +"님 환영합니다.";
				Link= "mypage.jsp";
			}
			%>
	
</script>
<body>
        <div class="sidebar close">
            <div class="logo-details">
                <div class="imgi"><img src="./../image/s-image/DUCKKLOGO.png" alt=""></div>
                <span class="logo_name">DUCKK</span>
            </div>
            <ul class="nav-links">
                <li>
                    <a href="index.html">
                        <i class='bx bx-home' ></i>
                        <span class="link_name">홈</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="index.html">홈</a></li>
                    </ul>
                </li>
                <li>
                    <a href="Search.html">
                        <i class='bx bx-hash'></i>
                        <span class="link_name">검색</span>
                    </a>
                    <ul class="sub-menu blank">
                        <li><a class="link_name" href="Search.html">검색하기</a></li>
                    </ul>
                </li>
                <li>
                    <div class="iocn-link">
                        <a href="#">
                        <i class='bx bx-grid-alt' ></i>
                        <span class="link_name">카테고리</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow' ></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name" href="#">카테고리</a></li>
                        <li><a href="Game.html">게임</a></li>
                        <li><a href="Novel.html">소설</a></li>
                        <li><a href="TwoD.html">2D</a></li>
                        <li><a href="Person.html">인물</a></li>
                        <li><a href="Other.html">그 외</a></li>
                    </ul>
                </li>
                <li>
                    <div class="iocn-link">
                        <a href="#">
                            <i class='bx bx-comment'></i>
                            <span class="link_name">커뮤니티</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow' ></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a href="#" class="link_name">커뮤니티</a></li>
                        <li><a href="Sales.html">영업</a></li>
                        <li><a href="Cummunity.html">커뮤니티</a></li>
                    </ul>
                </li>
                <li>
                    <div class="iocn-link">
                        <a href="Service.html">
                            <i class='bx bx-question-mark' ></i>
                            <span class="link_name">고객센터</span>
                        </a>
                        <i class='bx bxs-chevron-down arrow' ></i>
                    </div>
                    <ul class="sub-menu">
                        <li><a class="link_name" href="Service.html">고객센터</a></li>
                        <li><a href="Notice.html">공지사항</a></li>
                        <li><a href="Event.html">이벤트</a></li>
                        <li><a href="QAndA">Q&A</a></li>
                        <li><a href="Quesiton.html">문의사항</a></li>
                    </ul>
                </li>
                <li>
                <a href="WritePage.html">
                    <i class='bx bx-pencil'></i>
                    <span class="link_name">작성하기</span>
                </a>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="WritePage.html">작성하기</a></li>
                </ul>
                </li>
                <li>
            <div class="profile-details">
                <div class="usericon">
                    <a href="<%= Link%>"><i class='bx bx-user' ></i></a>
                </div>
                <ul class="sub-menu blank">
                    <li><a class="link_name" href="<%= Link%>"><%= Name_main %></a></li>
                </ul>
                <div class="name-job">
                    <a href="<%= Link%>">
                        <div class="profile_name"><%= Name_main %></div>
                        <div class="job"><%=Name_sub%></div>
                    </a>
                </div>
            </div>
            </li>
        </ul>
        </div>
        <section class="home-section">
            <div class="home-content">
                <i class='bx bx-menu' ></i>
            </div>
        </section>
    <script>
    let arrow = document.querySelectorAll(".arrow");
    for (var i = 0; i < arrow.length; i++) {
        arrow[i].addEventListener("click", (e)=>{
            let arrowParent = e.target.parentElement.parentElement;//selecting main parent of arrow
            arrowParent.classList.toggle("showMenu");
        });
    }
    let sidebar = document.querySelector(".sidebar");
    let sidebarBtn = document.querySelector(".bx-menu");
    console.log(sidebarBtn);
    sidebarBtn.addEventListener("click", ()=>{
        sidebar.classList.toggle("close");
    });
    </script>
</body>
</html>