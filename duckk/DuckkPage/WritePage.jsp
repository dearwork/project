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
    <link rel="stylesheet" href="CSS/write.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.3/TweenMax.min.js"></script>
    <script src="JS/jquery.min.js"></script>
    <script src="JS/textwrite.js"></script>
    <title>DUCKK</title>
</head>
<body>
    <div id="bigf">
        <%@include file="header.jsp" %>
        <div id="wrap">
            <div id="rightbox">
                <div class="logo">
                    <a href="index.html">
                        <img src="image/s-image/DUCKKLOGO.png" alt="">
                        <h3>duckk</h3>
                    </a>
                </div>
            </div>
            <form name="form" action="process/write.jsp"  method="POST">
                <div class="toolbar">
                    <ul class="tool-list">
                        <li class="tool">
                            <button 
                                type="button" 
                                data-command='justifyLeft'
                                class="tool--btn">
                                <i class='bx bx-align-left'></i>
                            </button>
                        </li>
                        <li class="tool">
                            <button 
                                type="button" 
                                data-command='justifyCenter' 
                                class="tool--btn">
                                <i class='bx bx-align-middle' ></i>
                            </button>
                        </li>
                        <li class="tool">
                            <button 
                                type="button" 
                                data-command='justifyRight' 
                                class="tool--btn">
                                <i class='bx bx-align-right' ></i>
                            </button>
                        </li>
                        <li class="tool">
                            <button 
                                type="button" 
                                data-command='justifyFull' 
                                class="tool--btn">
                                <i class='bx bx-align-justify' ></i>
                            </button>
                        </li>
                        <li class="tool">
                            <button 
                                type="button" 
                                data-command="bold" 
                                class="tool--btn">
                                <i class='bx bx-bold' ></i>
                            </button>
                        </li>
                        <li class="tool">
                            <button 
                                type="button" 
                                data-command="italic"
                                class="tool--btn">
                                <i class='bx bx-italic' ></i>
                            </button>
                        </li>
                        <li class="tool">
                            <button 
                                type="button" 
                                data-command="underline"
                                class="tool--btn">
                                <i class='bx bx-underline' ></i>
                            </button>
                        </li>
                        <li class="tool">
                            <button 
                                type="button" 
                                data-command="insertOrderedList"
                                class="tool--btn">
                                <i class='bx bx-list-ol'></i>
                            </button>
                        </li>
                        <li class="tool">
                            <button 
                                type="button" 
                                data-command="insertUnorderedList"
                                class="tool--btn">
                                <i class='bx bx-list-ul'></i>
                            </button>
                        </li>
                        <li class="tool">
                            <button 
                                type="button" 
                                data-command="createLink" 
                                class="tool--btn">
                                <i class='bx bx-link' ></i>
                            </button>
                        </li>
                        <li class="tool">
                            <button type="button" data-command="showCode" name="active" class="tool--btn">
                                <i class='bx bx-code' ></i>
                            </button>
                        </li>
                        <li class="tool">
                        	<input type="button" name="sendBTN"  class="tool--btn" value="작성완료"  onclick="checkText()">
                        </li>
                    </ul>
                </div>
                <input type ="text"  name="title" id="title" placeholder="제목을 입력하세요." maxlength="50" required>
            <input type ="text"   name="subtitle" id="subtitle" placeholder="부제목을 입력하세요." maxlength="50"  required>
            <hr>
            <textarea name="contents"  id="output" name="textField" class="iframe" allowpaymentrequest="true" style="resize: none;"></textarea>
            <hr>
            <div class="checkbox">
                <input type="file" name="" id="">

                <div class="selectbox">
                    <label for="allCheck" class="checkbox adultBox">
                        <input type="checkbox" name="age" id="allCheck" value="성인">
                        <div id="icon"></div>
                        <p>성인</p>
                    </label>
                    <select name="locationXY" id="locationXY">
                        <option value="게임">게임</option>
                        <option value="소설">소설</option>
                        <option value="2D">2D</option>
                        <option value="인물">인물</option>
                        <option value="그 외">그 외</option>
                        <option value="영업">영업</option>
                        <option value="커뮤니티">커뮤니티</option>
                        <option value="Q&A">Q&A</option>
                        <option value="문의사항">문의사항</option>
                    </select>
                </div>
            </div>
        </form>
        <script>
        function checkText() {
        	var form = document.form;
        	var  title = form.title;
        	var subtitle = form.subtitle;
        	var contents = form.contents;
        	
        	
        	if(title.value == ""){
        		alert("제목을 입력해주세요.");
        		title.focus;
        		return false;
    		}else if(subtitle.value  == ""){
        		alert("부제목을 입력해주세요.");
        		subtitle.focus;
        		return false;
    		}else if(contents.value == "") {
        		alert("내용을 입력해주세요.");
        		contents.focus;
        		return false;
    		}
            if(confirm("작성을 완료하시겠습니까?")){
        	form.submit();
            }
        }
        
        </script>
        </div><!--wrap Fin-->
    </div><!--bigf Fin-->
</body>
</html>