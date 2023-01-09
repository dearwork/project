<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*"%>
    <% request.setCharacterEncoding("utf-8"); %><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="shortcut icon" href="image/s-image/favicon.ico" type="image/x-icon">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="CSS/reset.css">
    <link rel="stylesheet" href="CSS/header.css">
    <link rel="stylesheet" href="CSS/main.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.3/TweenMax.min.js"></script>
    <script src="JS/jquery.min.js"></script>
    <script src="JS/main.js"></script>
    <title>DUCKK</title>
<title></title>
    <div class="bigf">
   	 	<%@include file="header.jsp" %>
        <div id="wrap" style="width: auto;">
        	<div class="banner">
                    <div class="text">
                        <h3>duckk에 오신걸 환영합니다!</p>
                        <p>게임·소설·2D등 분야에 맞는 사람들과 함께 소통하며 덕질해요!</p>
                    </div>
                </div>
                <section class="content_first">
                    <div class="imgBox"></div>
                    <div class="text">
                        <h3>덕크란?
                            <p>덕크(duckk)가 무엇인가요?</p>
                        </h3>
                        <p>덕크는 웹툰, 소설, 애니, 게임, 아이돌 등 다양한 '덕질'을 위해 제작된 게시판입니다. 그림, 글, 영상 등 자유롭게 올리며, 자신의 '덕질'을 즐겨보세요.</p>
                    </div>
                </section>
                <section class="content_second">
                    <div class="textBox">
                        <div id="num">01</div>
                        <div class="imgBox"> <img src="" alt=""></div>
                        <div class="text">
                            <h3>다양한 사람과 소통하기</h3>
                            <p>덕크는 남여노소 누구나 사용할 수 있는 커뮤니티입니다. 자신의 분야, 장르와 맞는 사람들과 함께 소통하며 덕질해요!</p>
                        </div>
                    </div>
                    <div class="textBox">
                        <div id="num">02</div>
                        <div class="imgBox"> <img src="" alt=""></div>
                        <div class="text">
                            <h3>분야 선택하기</h3>
                            <p>게임, 웹툰, 소설 등 원하는 분야에서 사람들과 소통해요. 자신이 뭔하는 분야가 없다면  문의사항에 문의해주세요!</p>
                        </div>
                    </div>
                    <div class="textBox">
                        <div id="num">03</div>
                        <div class="imgBox"> <img src="" alt=""></div>
                        <div class="text">
                            <h3>영업하기</h3>
                            <p>직접 자신의 장르를 예쁘게, 멋지게 만들어 홍보하고 덕크들과 함꼐 그 장르에 대해 소통하고 덕질해보세요!</p>
                        </div>
                    </div>
                </section>
                <section class="slidebox">
            <div class="slide">
                <button type="button" class="prev"> < </button>
                <ul>
                    <li><a href="event.jsp"><img src="image/p-image/slide1.png" alt=""></a></li>
                    <li><a href="event.jsp"><img src="image/p-image/slide2.png" alt=""></a></li>
                    <li><a href="event.jsp"><img src="image/p-image/slide3.png" alt=""></a></li>
                    <li><a href="event.jsp"><img src="image/p-image/slide4.png" alt=""></a></li>
                </ul>
                <button type="button" class="next"> > </button>
            </div>
        </section>
                <section class="content_Third">
                    <div class="imgBox"></div>
                    <div class="text">
                        <h3>이용안내
                            <p>덕크(duckk)는 어떻게 사용하는 건가요?</p>
                        </h3>
                        <p>덕크는 누구나 사용할 수 있는 커뮤니티입니다. 아래의 주의사항과 분위기를 충분히 파악한 후 활동해보세요.</p>
                    </div>
                </section>
                <h4>주의사항</h4>
                <section class="warning">
                    <div class="textBox">
                        <div id="num">01</div>
                        <div class="imgBox"></div>
                        <div class="text">
                            <h3>반말 사용하기</h3>
                            <p>
                                덕크는 반말 사용을 기본으로 합니다. 충분히 눈팅을 통해 규칙과 분위기를 충분히 파악한 후 활동 하시기를 부탁드립니다.
                            </p>
                        </div>
                    </div>
                    <div class="textBox">
                        <div id="num">02</div>
                        <div class="imgBox"></div>
                        <div class="text">
                            <h3>취향 존중하기</h3>
                            <p> 자신이 싫어하는 작품이 다른 사람들에게는 소중하고 사랑하는 작품일 수 도 잇습니다. 다른 사람의 취향을 혐오하거나 무시하지 마세요. </p>
                        </div>
                    </div>
                    <div class="textBox">
                        <div id="num">03</div>
                        <div class="imgBox"></div>
                        <div class="text">
                            <h3>눈치주지 말기</h3>
                            <p>타인의 게시물에 눈치를 주거나 방해하지 마세요. 덕크는 다양한 주제의 게시물이 작성되는 커뮤니티입니다. 문제되는 게시물은 신고기능을 이용하세요.</p>
                        </div>
                    </div>
                    <div class="textBox">
                        <div id="num">04</div>
                        <div class="imgBox"></div>
                        <div class="text">
                            <h3>사이트 내 창작물 공유</h3>
                            <p>
                                작성자에게 동의를 받고 공유해주세요.
                            </p>
                        </div>
                    </div>
                </section>
        
        </div>
    </div>
    
	
<body>
</body>
</html>