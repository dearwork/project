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
    <link rel="stylesheet" href="CSS/join.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.3/TweenMax.min.js"></script>
    <script src="JS/jquery.min.js"></script>
    <script src="JS/side_header.js"></script>
    <script src="JS/Join.js"></script>
    <title>DUCKK</title>
</head>
<body>
    <div id="bigf">
   	 	<%@include file="header.jsp" %>
        <div id="wrap">
            <div class="box">
                <h3>join us</h3>
                <form name="form" action="process/joinprocess.jsp" method="post" autocomplete="off">
                    <div class="inputBox">
                        <input type="text" name="name" id="name" required>
                        <label>이름(닉네임)</label>
                        <p id="namep">* 이름(닉네임)은 언제든 변경이 가능합니다.</p>
                        <input type="hidden" id="inDuplication" value="udUncheck"></input>
                    </div>
                    <div class="inputBox radioBox">
                        <input type="radio" name="age" id="nonAdult" value="미성년자">
                        <label for="nonAdult">미성년자</label>
                        <input type="radio" name="age" id="Adult" value="성인">
                        <label for="Adult">성인</label>
                    </div>
                    <div class="inputBox idBox">
                        <input type="text" name="id" id="id" required onkeyup="checkID()">
                        <label>아이디(4~20자)</label>
                        <p class="textid">* 영문자·숫자로만 입력하세요.</p>
                        <input type="hidden" name="IDC" value="2"  id="againCheck"><!-- 중복확인 -->
                    </div>
                    <div class="inputBox emailBox">
                        <input type="text" name="email" id="email" required>
                        <label>이메일</label>
                        <p class="text">*이메일을 입력해주세요.</p>
                    </div>
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
                    <ul class="faq-text">
                        <li>
                            <div class="logincheck">
                                <div class="question">개인정보처리방침 <i class='bx bx-chevron-down arrow' ></i></div>
                                <input type="checkbox" name="Check" id="Check"  onclick="checkSelectAll(this)">
                                <label for="Check" id="icon"></label>
                            </div>
                            <p>
                                <strong>■ 수집하는 개인정보</strong><br>
                                · 수집항목: 아이디, 비밀번호, 이메일<br>
                                · 수집방법: 회원가입, 사이트 이용<br>
                                <br>
                                <strong>■ 개인정보의 이용</strong><br>
                                · 회원/차단/게시판 시스템<br>
                                <br>
                                <strong>■ 개인정보의 보유</strong><br>
                                · 가입시부터 탈퇴시까지 보유 후 탈퇴와 동시에 폐기<br>
                                <br>
                                <strong>■ 개인정보 제공</strong><br>
                                이용자의 개인정보나 활동내역을 외부에 제공하지 않습니다.<br>
                                아래 예외 항목을 제외한 어떤 경우에도 제공하지 않습니다.<br>
                                <br>
                                - 디도스, 해킹, 도배테러, 반복저인 혐짤 업로드 등<br>
                                심각한 사이트 운영 방해로 법적 조치 하는 경우<br>
                                <br>
                            </p>
                        </li>
                        <li>
                            <div class="logincheck">
                                <div class="question">회원이용약관 <i class='bx bx-chevron-down arrow' ></i></div>
                                <input type="checkbox" name="Check" id="Check2" onclick="checkSelectAll(this)">
                                <label for="Check2" id="icon"></label>
                            </div>
                            <p>
                                <strong>■ 회원혜택</strong><br>
                                · MY, 좋아요, 북마크, 게시물 올리기 등 회원 전용 기능이 제공됩니다.<br>
                                · 아이디, 닉네임을 포함한 모든 회원 정보는 타인에게 노출되지 않습니다.<br>
                                <br>
                                <strong>■ 주의사항</strong><br>
                                · 가입 후 24시간내에 신고차단 당하면 아이디가 자동 탈퇴됩니다.<br>
                                · 비정상적인 의도로 가입했다고 판단되는 아이디는 삭제됩니다.<br>
                                · 이메일을 잊어버리면 아이디, 비밀번호를 찾을 수 없습니다. <br>
                                <br>
                            </p>
                        </li>
                        <div class="allcheckbox">
                            <label for="allCheck" class="checkbox">
                                <input type="checkbox" name="selectall" id="allCheck" onclick="selectAll(this)" value="y" >
                                <div id="icon"></div>
                                <p>모든 약관에 동의합니다.</p>
                            </label>
                        </div>
                    </ul>
                    <input type="button" value="회원가입" onclick="checkjoin()"><br>
                    <div class="aBox"><a href="Findid.jsp">아이디</a> &nbsp; / &nbsp; <a href="Findpass.jsp"> 비밀번호 찾기 <span>Click!</span></a></div>
                    <a href="Login.jsp">로그인페이지로 돌아가기 <span>Click!</span></a>
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
        //id
        var idInput = form.querySelector("#id");
        var againCheck = form.querySelector("#againCheck");
        var Idtext = form.querySelector(".textid");

        idInput.addEventListener("keyup", (e)=>{
            e.preventDefault(); //preventing form from submitting
            let pattern = /^[a-zA-Z][a-zA-Z0-9]{3,20}$/; 
            if(idInput.value == ""){
                Idtext.innerText = "아이디를 적어주세요.";
                Idtext.style.color = "red";
                return false;
            }else if (!idInput.value.match(pattern) ) { //if patter is not matched with user's enter value
                Idtext.innerText = "아이디 형식에 맞게 적어주세요.";
                Idtext.style.color = "red";
                return false;
            }else{
            Idtext.innerText = "확인되었습니다";        
                Idtext.style.color = "#ffc400";
            }
        });
        
        //pass
        var passInput = form.querySelector(".pass");
        var Passtext = form.querySelector(".textpass");

        passInput.addEventListener("keyup", (e)=>{
            e.preventDefault(); //preventing form from submitting
            let pattern = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
            if(passInput.value == ""){
                Passtext.innerText = "비밀번호를 적어주세요.";
                Passtext.style.color = "red";
                return false;
            }else if (!passInput.value.match(pattern) ) { //if patter is not matched with user's enter value
                Passtext.innerText = "비밀번호 형식에 맞게 적어주세요.";
                Passtext.style.color = "red";
                return false;
            }else{
                Passtext.innerText = "확인되었습니다.";
                Passtext.style.color = "#ffc400";
                return true;
            }
        });

        //getting all attribute
        var eInput = form.querySelector("#email");
        var text = form.querySelector(".text");

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
        //allcheck
            //전체동의 및 해제
            function checkSelectAll(checkbox)  {
            const selectall 
                = document.querySelector('input[name="selectall"]');
            
            if(checkbox.checked === false)  {
                selectall.checked = false;
            }
            }

            function selectAll(selectAll)  {
            const checkboxes 
                = document.getElementsByName('Check');
            
            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked
            })
            }
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
        //accordion text
        const agreeBTN = document.querySelectorAll(".question");
        for(let i=0; i < agreeBTN.length; i++ ) {
            agreeBTN[i].addEventListener("click", (e)=>{
            let clickedLi;
            if(e.target.classList.contains("logincheck")){
            clickedLi = e.target.parentElement;
            }else{
            clickedLi = e.target.parentElement.parentElement;
            }
        clickedLi.classList.toggle("showAnswer");
        });
        }
		
    </script>
</body>
</html>