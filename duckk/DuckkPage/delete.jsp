<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="shortcut icon" href="image/s-image/favicon.ico" type="image/x-icon">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="CSS/reset.css">
    <link rel="stylesheet" href="CSS/header.css">
    <link rel="stylesheet" href="CSS/find.css">
    <script src="JS/jquery.min.js"></script>
    <script src="JS/side_header.js"></script>
    <script src="JS/Join.js"></script>
	<script>
			function checkpwd(){
				var form = document.form;
				var pwd = form.pass;
				var pwd1 = form.passAgain;
				
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
				form.submit();
			}
	</script>
</head>
<body>
<div id="bigf">
   	 	<%@include file="header.jsp" %>
        <div id="wrap">
            <div class="box">
                <h3>탈퇴하기</h3>
			<form name ="form" action="process/deleteproc.jsp"  method="post">
				<div class="inputBox">
                        <input type="password" name="pass" id="passField" class="pass" required>
                        <label>비밀번호(8~)</label>
                        <div class="show-btn">
                            <i class='bx bx-show'></i>
                            <i class='bx bx-hide'></i>
                        </div>
                        <p class="textpass">* 영문자·숫자·특수문자로만 입력하세요.</p>
                    </div>
                    <div class="inputBox">
                        <input type="password" name="passAgain" id="passField" class="passAgain" required>
                        <label>비밀번호 재입력</label>
                        <p class="passagaincheck">* 비밀번호를 다시 입력해주세요.</p>
                    </div>
                    <input type="button" value="탈퇴하기" onclick="checkpwd()"><br>
                    <a href="mypage.jsp">마이페이지로 돌아가기</a>
	</form>
	</div>
        </div><!--wrap Fin-->
    </div><!--bigf Fin-->
	<script>

    const form = document.form;

    //password == passwordAgain
    const pass = document.querySelector('.pass');
    const passAgain = document.querySelector('.passAgain');
    const passagaincheck = document.querySelector('.passagaincheck')

    passAgain.addEventListener('keyup', () => {
        if(pass.value == passAgain.value) {
            passagaincheck.innerText = "입력하신 비밀번호와 일치합니다.";
            passagaincheck.style.color = "#ffc400";
            return true;
        }else {    
            passagaincheck.innerText = "입력하신 비밀번호와 일치하지 않습니다.";
            passagaincheck.style.color = "red";
            return false;
        }
    });
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
</body>
</html>