<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     <%@ page import = "java.sql.*"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="shortcut icon" href="image/s-image/favicon.ico" type="image/x-icon">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="CSS/reset.css">
    <link rel="stylesheet" href="CSS/login.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.3/TweenMax.min.js"></script>
    <script src="JS/jquery.min.js"></script>
    <script src="JS/login.js"></script>
    <title>DUCKK</title>
</head>
<body>
    <div id="bigf">
   	 	<%@include file="header.jsp" %>
        <div id="wrap">
            <div class="box">
                <h3>login in</h3>
                <form name="form"  action="process/loginprocess.jsp"  method="post">
                    <div class="inputBox">
                        <input type="text" name="id"  id="" required>
                        <label>아이디 / ID</label>
                    </div>
                    <div class="inputBox">
                        <input type="password" name="pass"  id="passField" required>
                        <label>비밀번호 / password</label>
                        <div class="show-btn">
                            <i class='bx bx-show'></i>
                            <i class='bx bx-hide'></i>
                        </div>
                    </div>
                    <input type="button" name="" value="로그인" onclick="checklogin()"><br>
                    <div class="aBox"><a href="Findid.jsp">아이디</a> &nbsp; / &nbsp; <a href="Findpass.jsp"> 비밀번호 찾기 <span>Click!</span></a></div>
                    <a href="join.jsp">회원이 아니신가요? <span>Click!</span></a>
                </form>
            </div>
            <script>
            
           //show&hide
            const passField = document.querySelector("#passField");
            const showBtn = document.querySelector(".show-btn");
            showBtn.onclick = (()=>{
                if(passField.type === "password"){
                    passField.type = "text";
                    showBtn.classList.add("hide-btn");

                }else{
                    passField.type = "password";
                    showBtn.classList.remove("hide-btn");
                }
            });
            </script>

        </div><!--wrap Fin-->
    </div><!--bigf Fin-->
</body>
</html>