<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DUCKK</title>
</head>
<body>


            <div class="slide" id="slide">
            <div class="auto">
                <button type="button" class="stop">stop</button>
                <button type="button" class="play">play</button>
            </div>
            <div class="btn">
                <button type="button" class="prev"><</button>
                <button type="button" class="next">></button>
            </div>
            <ul class="cnt">
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

                sql = "select * from duckktable where Location =" + locat ;
                ResultSet rs = stmt.executeQuery(sql);
                    
                    while (rs.next()) {
                            String Ddate = rs.getString("regDate");
            %>
                <li>
                <%
                        out.print("<a href='writeview.jsp?idx="+rs.getString(1) + "'> <img src='image/p-image/eya.png' alt=''></a>" );
                        %>
                    <div class="text">
                        <div class="title">
                            <h3>베스트 인기글</h3>
                            <hr>
                        </div>
                         <%
                        out.print("<h3> <a href='writeview.jsp?idx="+rs.getString(1) + "'>" + rs.getString("BoardTitle") + "</a></h3>" );
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
                </li>
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
            </ul>
        </div><!-- slide -->
</body>
</html>