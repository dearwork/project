<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="shortcut icon" href="image/s-image/favicon.ico" type="image/x-icon">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="CSS/reset.css">
    <link rel="stylesheet" href="CSS/header.css">
    <link rel="stylesheet" href="CSS/mypage.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.3/TweenMax.min.js"></script>
    <script src="JS/jquery.min.js"></script>
    <title>DUCKK</title>
</head>
<body>
    <div id="bigf">
        <%@include file="header.jsp" %>
        <%
	try{
	
	Connection conn = null;
	PreparedStatement ptmt = null;
	String sql = null;
	String Uid =(String) session.getAttribute("user_ID");
	String Uname =(String) session.getAttribute("user_NAME");
		
	String dburl = "jdbc:mysql://localhost:3306/webdb?useSSL=false&characterEncoding=UTf-8&serverTimezone=Asia/Seoul";
	String dbid = "root";
	String dbpwd = "multi2020";
		
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dburl,dbid,dbpwd); //연결
	
	sql ="select * from duckkuser where id=?";
	ptmt = conn.prepareStatement(sql); 
	ptmt.setString(1, Uid);
	ResultSet rs = ptmt.executeQuery();
	if(rs.next()){
		//쿼리에서 추출한 값 불러오기
		String Did = rs.getString("id");
		String Dname = rs.getString("name");
		String Demail = rs.getString("email");
		String Dage = rs.getString("age");
		String Dregdate = rs.getString("regDate");
		
		%>
        <div id="wrap">
            <div id="rightbox">
                <div class="logo">
                    <a href="index.html">
                        <img src="image/s-image/DUCKKLOGO.png" alt="">
                        <h3>duckk</h3>
                    </a>
                </div>
            </div>
            <div class="banner"></div>
            <div id="title">
                <h3>Mypage</h3>
                <p>마이페이지</p>
            </div>
            <div class="userName">
                <div class="NameId">
                    <p class="name"><%=Dname%></p>
                    <p class="id"><%=Did%></p>
                    <p class="email"><%=Demail%></p>
                    <p class="age"><%= Dage%></p>
                </div>
                <hr>
                <div class="date_numder">
                    <div class="list_num">
                        <div class="writeview">
                            <p>14</p>
                            <p>게시물</p>
                        </div>
                        <div class="writeview">
                            <p>50</p>
                            <p>좋아요</p>
                        </div>
                    </div>
                    <br>
                    <p class="date">가입한 날짜: <%=Dregdate.substring(0,16)%></p>
                </div>
                <hr>
                <div class="iconbox">
                    <a href="update.jsp"><i class='bx bx-cog'><span>수정하기</span></i></a>
                    <a href="logout.jsp"><i class='bx bx-log-out-circle' ><span>로그아웃</span></i></a>
                    <a href="delete.jsp"><i class='bx bx-block'><span>탈퇴하기</span></i></a>
                </div>
            </div>
            <div class="contentBox">
                <div class="writelist">
                    <div class="titleBox">
                        <h3>내가 쓴 게시물</h3>
                        <hr>
                    </div>
                    <div class="writeBox">
                        <a href="">
                            <img src="image/p-image/image1.png" alt="">
                        </a>
                        <div class="text">
                            <h3>title</h3>
                            <p class="subtitle">subtitle</p>
                            <div class="keyword">
                                <div class="tag"><a href="">ads</a></div>
                                <div class="tag"><a href="">ads</a></div>
                                <div class="tag"><a href="">ads</a></div>
                                <div class="tag"><a href="">ads</a></div>
                            </div>
                            <div class="status">
                                <p class="id">asd123</p>
                                <div class="view">
                                    <i class='bx bx-show'></i>
                                    <p>123</p>
                                </div>
                                <div class="heart">
                                    <i class='bx bx-heart' ></i>
                                    <p>123</p>
                                </div>
                            </div>
                        </div>
                        <div class="iconbox">
                            <button class="view"><i class='bx bx-file-blank' ></i></button>
                            <button class="modify"><i class='bx bxs-edit-alt' ></i></button>
                            <button class="delete"><i class='bx bxs-trash-alt'></i></button>
                        </div>
                    </div>
                    <div class="writeBox">
                        <a href="">
                            <img src="image/p-image/image1.png" alt="">
                        </a>
                        <div class="text">
                            <h3>title</h3>
                            <p class="subtitle">subtitle</p>
                            <div class="keyword">
                                <div class="tag"><a href="">ads</a></div>
                                <div class="tag"><a href="">ads</a></div>
                                <div class="tag"><a href="">ads</a></div>
                            </div>
                            <div class="status">
                                <p class="id">asd123</p>
                                <div class="view">
                                    <i class='bx bx-show'></i>
                                    <p>123</p>
                                </div>
                                <div class="heart">
                                    <i class='bx bx-heart' ></i>
                                    <p>123</p>
                                </div>
                            </div>
                        </div>
                        <div class="iconbox">
                            <button class="view"><i class='bx bx-file-blank' ></i></button>
                            <button class="modify"><i class='bx bxs-edit-alt' ></i></button>
                            <button class="delete"><i class='bx bxs-trash-alt'></i></button>
                        </div>
                    </div>
                    <div class="writeBox">
                        <a href="">
                            <img src="image/p-image/image1.png" alt="">
                        </a>
                        <div class="text">
                            <h3>title</h3>
                            <p class="subtitle">subtitle</p>
                            <div class="keyword">
                                <div class="tag"><a href="">ads</a></div>
                                <div class="tag"><a href="">ads</a></div>
                                <div class="tag"><a href="">ads</a></div>
                            </div>
                            <div class="status">
                                <p class="id">asd123</p>
                                <div class="view">
                                    <i class='bx bx-show'></i>
                                    <p>123</p>
                                </div>
                                <div class="heart">
                                    <i class='bx bx-heart' ></i>
                                    <p>123</p>
                                </div>
                            </div>
                        </div>
                        <div class="iconbox">
                            <button class="view"><i class='bx bx-file-blank' ></i></button>
                            <button class="modify"><i class='bx bxs-edit-alt' ></i></button>
                            <button class="delete"><i class='bx bxs-trash-alt'></i></button>
                        </div>
                    </div>
                    <div class="writeBox">
                        <a href="">
                            <img src="image/p-image/image1.png" alt="">
                        </a>
                        <div class="text">
                            <h3>title</h3>
                            <p class="subtitle">subtitle</p>
                            <div class="keyword">
                                <div class="tag"><a href="">ads</a></div>
                                <div class="tag"><a href="">ads</a></div>
                                <div class="tag"><a href="">ads</a></div>
                            </div>
                            <div class="status">
                                <p class="id">asd123</p>
                                <div class="view">
                                    <i class='bx bx-show'></i>
                                    <p>123</p>
                                </div>
                                <div class="heart">
                                    <i class='bx bx-heart' ></i>
                                    <p>123</p>
                                </div>
                            </div>
                        </div>
                        <div class="iconbox">
                            <button class="view"><i class='bx bx-file-blank' ></i></button>
                            <button class="modify"><i class='bx bxs-edit-alt' ></i></button>
                            <button class="delete"><i class='bx bxs-trash-alt'></i></button>
                        </div>
                    </div>
                    <div class="paging">
                        <ul>
                            <li><button class="previous"><i class='bx bx-left-arrow'></i></button></li>
                            <li><a href="">1</a></li>
                            <li><a href="">2</a></li>
                            <li><a href="">3</a></li>
                            <li><a>…</a></li>
                            <li><a href="">7</a></li>
                            <li><button class="next"><i class='bx bx-right-arrow' ></i></button></li>
                        </ul>
                    </div>
                </div>
                <div class="heartlist">
                    <div class="titleBox">
                        <h3>좋아요 목록</h3>
                        <hr>
                    </div>
                    <div class="heartBox">
                        <a href=""><img src="" alt="">  
                            <div class="text">
                                <h3>title</h3>
                                <div class="keyword">
                                    <div class="tag"><a href="">ads</a></div>
                                    <div class="tag"><a href="">ads</a></div>
                                    <div class="tag"><a href="">ads</a></div>
                                </div>
                                <div class="status">
                                    <p class="id">asd123</p>
                                    <div class="view">
                                        <i class='bx bx-show'></i>
                                        <p>123</p>
                                    </div>
                                    <div class="heart">
                                        <i class='bx bx-heart' ></i>
                                        <p>123</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="heartBox">
                        <a href=""><img src="" alt="">  
                            <div class="text">
                                <h3>title</h3>
                                <div class="keyword">
                                    <div class="tag"><a href="">ads</a></div>
                                    <div class="tag"><a href="">ads</a></div>
                                    <div class="tag"><a href="">ads</a></div>
                                </div>
                                <div class="status">
                                    <p class="id">asd123</p>
                                    <div class="view">
                                        <i class='bx bx-show'></i>
                                        <p>123</p>
                                    </div>
                                    <div class="heart">
                                        <i class='bx bx-heart' ></i>
                                        <p>123</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="heartBox">
                        <a href="">
                        <div class="text">
                            <h3>title</h3>
                            <div class="keyword">
                                <div class="tag"><a href="">ads</a></div>
                                <div class="tag"><a href="">ads</a></div>
                                <div class="tag"><a href="">ads</a></div>
                            </div>
                            <div class="status">
                                <p class="id">asd123</p>
                                <div class="view">
                                    <i class='bx bx-show'></i>
                                    <p>123</p>
                                </div>
                                <div class="heart">
                                    <i class='bx bx-heart' ></i>
                                    <p>123</p>
                                </div>
                            </div>
                        </div>
                        </a>
                    </div>
                    <div class="paging">
                        <ul>
                            <li><button class="previous"><i class='bx bx-left-arrow'></i></button></li>
                            <li><a href="">1</a></li>
                            <li><a href="">2</a></li>
                            <li><a href="">3</a></li>
                            <li><a>…</a></li>
                            <li><a href="">7</a></li>
                            <li><button class="next"><i class='bx bx-right-arrow' ></i></button></li>
                        </ul>
                    </div>
                </div>
            </div>

        </div><!--wrap Fin-->
    </div><!--bigf Fin-->
    <%
		
	}	
		rs.close();
ptmt.close();
conn.close();
} catch (SQLException e){
out.print("실패");
System.out.println("SQL Error" + e.getMessage());
}
	%>
</body>
</html>