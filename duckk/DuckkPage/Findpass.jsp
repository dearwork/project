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
    <link rel="stylesheet" href="CSS/find.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.3/TweenMax.min.js"></script>
    <script src="JS/jquery.min.js"></script>
    <script src="JS/side_header.js"></script>
    <title>DUCKK</title>
</head>
<body>
	<div id="bigf">
<%@include file="header.jsp" %>
<div id="wrap">
            <div class="box">
                <h3>Find PWD</h3>
                <form name="form"  action="process/findprocess2.jsp"  method="post" autocomplete="off">
                    <div class="inputBox">
                        <input type="text" name="name" id="" required>
                        <label>이름 / 닉네임</label>
                    </div>
                    <div class="inputBox idBox">
                        <input type="text" name="id" id="id" required>
                        <label>아이디 / ID</label>
                    </div>
                    <div class="inputBox emailBox">
                        <input type="text" name="email" id="email" required>
                        <label>이메일 / Email</label>
                        <p class="text">*이메일을 입력해주세요.</p>
                    </div>
                    <input type="button" name="" value="비밀번호 찾기"  onclick="document.form.submit();"><br>
                    <a href="Findid.jsp">아이디 찾기 <span>Click!</span></a>
                    <div class="aBox">
                        <a href="Login.jsp">로그인페이지로 돌아가기</a>
                        &nbsp; / &nbsp; 
                        <a href="join.jsp">회원이 아니신가요?</a>
                    </div>
                </form>
            </div>


        </div><!--wrap Fin-->
    </div><!--bigf Fin-->
    <script>
        //getting all attribute
        const form = document.querySelector("form"),
        eInput = form.querySelector("#email"),
        text = form.querySelector(".text");

        eInput.addEventListener("keyup", (e)=>{
            e.preventDefault(); //preventing form from submitting
            let pattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/; //Regex pattern to validate email
            if(eInput.value == ""){
                text.innerText = "이메일을 적어주세요.";
                text.style.color = "red";
            }else if (!eInput.value.match(pattern) ) { 
                text.innerText = "이메일 형식에 맞게 적어주세요.";
                text.style.color = "red";
                return false;
            }else{
                text.innerText = "확인되었습니다.";
                text.style.color = "#ffc400";
                return true;
            }
        });
    </script>
</body>
</html>

</body>
</html>