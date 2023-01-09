<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="shortcut icon" href="image/s-image/favicon.ico" type="image/x-icon">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="CSS/reset.css">
    <link rel="stylesheet" href="CSS/Genrelist.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.3/TweenMax.min.js"></script>
    <script src="JS/jquery.min.js"></script>
    <script src="JS/GenrePage.js"></script>
    <title>DUCKK</title>
</head>
<body>
    <div id="bigf">
        <%@include file="header.jsp" %>
        <div id="wrap" style="width:auto;">
            <div id="rightbox">
                <div class="logo">
                    <a href="index.html">
                        <img src="image/s-image/DUCKKLOGO.png" alt="">
                        <h3>duckk</h3>
                    </a>
                </div>
            </div>
            <div id="popup">
                <div id="popmenu">
                    <p>
                        <strong>현재 페이지는 "게임" 페이지입니다!</strong><br><br>
                        게임 장르에 관련된 모든 정보를 볼 수 있습니다.
    
                    </p>
                    <div class="exit">닫기</div>
                </div>
            </div>
            <div class="pageExplan">
                <h3>현재 페이지는 "게임" 페이지 입니다.<br>(Click)</h3>
            </div>
        <%

                try {
                    Connection conn = null;
                    Statement stmt = null;
                    String sql = null;

                    String dburl = "jdbc:mysql://localhost:3306/webdb?useSSL=false&characterEncoding=UTf-8&serverTimezone=Asia/Seoul";
                    String dbid = "root";
                    String dbpwd = "multi2020";

                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(dburl, dbid, dbpwd); //연결
                    stmt = conn.createStatement();

                    sql = "select * from duckktable where Location = 'Q&A'" ;
                    ResultSet rs = stmt.executeQuery(sql);
            %>
            <div class="list">
            <div class="listBTN">
                <button>인기순</button>
                &nbsp;&nbsp; | &nbsp;&nbsp;
                <button>최신순</button>
                &nbsp;&nbsp; | &nbsp;&nbsp;
                <button>가나다순</button>
            </div>
                <div class="wrtielist">
               <% 
               while (rs.next()) {
                       String Ddate = rs.getString("regDate");
               %>
                    <div class="writeBox">
                    <%
                        out.print("<a href='writeview.jsp?idx="+rs.getString(1) + "'> <img src='image/p-image/image1.png' alt=''></a>" );
                        %>
                        <div class="text">
                        <%
                        out.print("<h3> <a onlick=window.parent.location.href='writeview.jsp?idx="+rs.getString(1) + "'>" + rs.getString("BoardTitle") + "</a></h3>" );
                        %>
                            <p class="subtitle"><%=rs.getString(4)%></p>
                            <div class="keyword">
                                <div class="tag"><a href="">이번</a></div>
                                <div class="tag"><a href="">스토리</a></div>
                                <div class="tag"><a href="">실화인가?</a></div>
                                <div class="tag"><a href="">가슴이_웅장해짐</a></div>
                            </div>
                            <div class="status">
                                <p class="id"><%=rs.getString(5)%></p>
                                <div class="view">
                                    <i class='bx bx-show'></i>
                                    <p><%=rs.getString(11)%></p>
                                </div>
                                <div class="heart">
                                    <i class='bx bx-heart' ></i>
                                    <p><%=rs.getString(12)%></p>
                                </div>
                            </div>
                        </div>
                         </div>
                        <%
                }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (SQLException e) {
            %>
            <script>
                alert("아직 준비 중인 페이지입니다. \n불편을 드려 죄송합니다.");
                history.go(-1);
            </script>
            <%
                System.out.println("SQL Error" + e.getMessage());
                }
            %>
            
            </div><!--listFin-->
            <div class="paging">
                <button id="previous"><</button>
                <ul>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>…</li>
                    <li>10</li>
                </ul>
                <button id="next">></button>
            </div>

	
        </div><!--wrap Fin-->
    </div><!--bigf Fin-->
</body>
</html>