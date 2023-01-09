<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ page import = "java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="shortcut icon" href="./../image/s-image/favicon.ico" type="image/x-icon">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.3/TweenMax.min.js"></script>
    <link rel="stylesheet" href="./../CSS/reset.css">
     <link rel="stylesheet" href="./../CSS/checktext.css">
    <script src="./../JS/jquery.min.js"></script>
    <title>Document</title>
</head>
<body>
    <%
        //값 넣기
        String title = (String)request.getParameter("title"); //제목
        String subtitle = (String)request.getParameter("subtitle"); //소제목
        String contents = (String)request.getParameter("contents"); //내용
      //줄바꿈
        contents = contents.replace("\r\n","<br>");
        String adult = (String)request.getParameter("age");// 성인물
        String age = "";
        if (adult == null) {
        	age = "모든 덕크들";
        }else {
        	age = adult;
        }	
        //위치
        String locationXY = (String)request.getParameter("locationXY");
		String userNAME = (String)session.getAttribute("user_NAME");
		String user_USER = (String)session.getAttribute("user_USER");

        
        try{
                    Connection conn = null;
                    Statement stmt = null;
                    String sql = null;
                    String tableN = "duckktable";
                    PreparedStatement ptmt = null;
                    
                    String dburl = "jdbc:mysql://localhost:3306/webdb?characterEncoding=UTf-8&serverTimezone=Asia/Seoul";
                    String dbid = "root";
                    String dbpwd = "multi2020";
                        
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(dburl,dbid,dbpwd); //연결
                    
                    
                    sql ="show tables like ?";
                    ptmt = conn.prepareStatement(sql); 
                    ptmt.setString(1, tableN);
                    
                    ResultSet rs = ptmt.executeQuery();
                        
                    if(!rs.next()){
                        stmt = conn.createStatement();
                        sql = "create table duckktable(IDK bigint(20) not null auto_increment,Location varchar(2000) not null,BoardTitle varchar(2000) not null,BoardSubTitle varchar(2000) not null, Boarduser varchar(2000) not null, userIDK int(20) not null, Boardgenre varchar(2000),BoardContents text not null,regDate Datetime not null default CURRENT_TIMESTAMP,BoardStatus varchar(20) not null,viewcount int(11) not null default 0,likecheck int(11) not null default 0, primary key(IDK))";
                        stmt.executeUpdate(sql);
                    }
                    

    %>
    <!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./../CSS/reset.css">
        <link rel="stylesheet" href="./../CSS/checkcontents.css">
        <title>내용확인</title>
    </head>
    <body>
        <div id="wrap">
            <header class="header">
                <div class="logo"></div>
            </header>
            <div class="filetitle">
                <p class="ageBox"><%=age%></p>
                <p><%=locationXY%> > <%=title%></p>
            </div>
            <div class="title"><%=title%></div>
            <div class="subtitle"><%=subtitle%></div>
            <div class="statusAgenre">
                <div class="keyword"></div>
                <div class="user"><%=userNAME%></div>
            </div>
            <hr>
            <div class="contents">
                <%= contents%>
            </div>
            <input type="button" name="send" id="send" value="완료">
        </div>
        <script>
            $('#send').click(function() {
                    alert('완료되었습니다.');
                    
                    <%
                        sql = "insert into duckktable(Location, BoardTitle, BoardSubTitle, Boarduser, userIDK, BoardContents,BoardStatus) values(?, ?, ?, ?, ?, ?, ?)";
                        ptmt = conn.prepareStatement(sql); 
                        
                        ptmt.setString(1, locationXY);
                        ptmt.setString(2, title);
                        ptmt.setString(3, subtitle);
                        ptmt.setString(4, userNAME);
                        ptmt.setString(5, user_USER);
                        ptmt.setString(6, contents);
                        ptmt.setString(7, age);
                        ptmt.executeUpdate(); //업데이트
                        ;
                      //세션 저장
						session.setAttribute("post_TITLE", title);
						session.setAttribute("post_SUBTITLE", subtitle);
						session.setAttribute("post_LOCATION", locationXY);
						session.setAttribute("post_AGE", age);
                        
                        ptmt.close();
                        conn.close();

						String post_LOCATION= (String)session.getAttribute("post_LOCATION");
                      //페이지 넘어가기
						String  LocalPage = "";
						if(post_LOCATION.equals("게임")) {
							LocalPage = "Game.jsp";
						}else if (post_LOCATION.equals("소설")) {
							LocalPage = "Novel.jsp";
						}else if (post_LOCATION.equals("2D")) {
							LocalPage = "TwoD.jsp";
						}else if (post_LOCATION.equals("인물")) {
							LocalPage = "Novel.jsp";
						}else if (post_LOCATION.equals("그 외")) {
							LocalPage = "Other.jsp";
						}else if (post_LOCATION.equals("영업")) {
							LocalPage = "Sales.jsp";
						}else if (post_LOCATION.equals("커뮤니티")) {
							LocalPage = "Cummunity.jsp";
						}else if (post_LOCATION.equals("Q&A")) {
							LocalPage = "QAndA.jsp";
						}else if (post_LOCATION.equals("문의사항")) {
							LocalPage = "Question.jsp";
						}else if (post_LOCATION.equals("공지사항")) {
							LocalPage = "Notice.jsp";
						}else{
							LocalPage = "index.jsp";
						}
                    %>
                    location.href="./../<%=LocalPage%>";
            });
            <%
        } catch(SQLException e){
                System.out.println("SQL Error" + e.getMessage());
                System.out.print("error");
        }
            %>
        </script>
</body>
</html>
</body>
</html>