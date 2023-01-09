<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
     <link rel="stylesheet" href="CSS/viewwrite.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.3/TweenMax.min.js"></script>
    <script src="JS/jquery.min.js"></script>
    </head>
<body>
    <%
        String idx = (String)request.getParameter("idx");
		int viewcount = 0;	
		int likecheck = 0;
		String user_USER = (String)session.getAttribute("user_USER");
		session.setAttribute("post_IDK", idx);
		
		//비회원
		if(user_USER == null) {
			user_USER += "non";
		}
		
        //BTN
          String BTNLink = "";
          String icon = "";
          String BTNLink2 = "";
          String icon2 = "";
       
    
        try {
            Connection conn = null;
            Statement stmt = null;
            String sql = null;
            String usql = null;

            String dburl = "jdbc:mysql://localhost:3306/webdb?useSSL=false&characterEncoding=UTf-8&serverTimezone=Asia/Seoul";
            String dbid = "root";
            String dbpwd = "multi2020";

            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dburl, dbid, dbpwd); //연결
            stmt = conn.createStatement();

            sql = "select * from duckktable where IDK =" + idx ;
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()) {
                int Didk = rs.getInt("IDK");
                String DLocation = rs.getString("Location");
                String Dtitle = rs.getString("BoardTitle");
                String Dsubtitle = rs.getString("BoardSubTitle");
                String Dcontents = rs.getString("BoardContents");
                String Duser = rs.getString("Boarduser");
                int DuserIDK = rs.getInt("userIDK");
                String Dstatus = rs.getString("BoardStatus");
                String Ddate = rs.getString("regDate");
                viewcount = rs.getInt("viewcount");
                likecheck = rs.getInt("likecheck");
                
                /*viewcount*/
                viewcount = viewcount + 1;
                String tempcount = Integer.toString(viewcount);
                /* usql = "UPDATE boardtable SET viewcount = " + tempcount + " WHERE IDK = "+ Integer.toString(Didk);
                rs = stmt.executeQuery(sql);*/

                String useridk = Integer.toString(DuserIDK);
          		System.out.print(useridk);
          		
          		session.setAttribute("post_LOCATION", DLocation);
          		
                //게시물 버튼 바뀌기
                if (user_USER.equals(useridk) || user_USER.equals("1") ){
                  	BTNLink = "location.href='writeupdate.jsp'";
                  	icon = "<i class='bx bxs-cog'></i>";
                  	BTNLink2 = "deletecheck()";
                  	icon2 = "<i class='bx bx-trash'></i>";
                  	System.out.print(Didk + "\n");
                  	System.out.print(useridk);
                  }else if(user_USER == null ) {
                	BTNLink = "";
                  	icon = "<i class='bx bx-link' ></i>";
                  	BTNLink2 = "";
                  	icon2 = "<i class='bx bxs-heart' ></i>";
                  }else {
                	  BTNLink = "";
                    	icon = "<i class='bx bx-link' ></i>";
                    	BTNLink2 = "";
                    	icon2 = "<i class='bx bxs-heart' ></i>";
                  }
    %>
    <script>
    	function deletecheck() {
    		if(confirm("해당 게시물을 삭제하겠습니까? \n삭제된 게시물은 복구할 수 없습니다. ")){
            	location.href="process/writedelete.jsp";
                }
    	}
    
    </script>
    
    <div class="bigf">
        <%@include file="header.jsp" %>
        <div id="wrap" style="width:auto;">
        	<a class="location"  onclick="location.href='Game.jsp';"><i class='bx bx-left-arrow-alt'></i> 돌아가기</a>
            <div class="filetitle">
                 <p class="ageBox"><%=Dstatus%></p>
                <p><%=DLocation +" > "+ Dtitle%></p>
            </div>
            <div class="title"><%=Dtitle%></div>
            <div class="subtitle"><%=Dsubtitle%></div>
            <div class="statusAgenre">
                <div class="keyword">
                </div>
                <div class="user"><%=Duser%></div>
                <p><%=Ddate.substring(0,16)%></p>
                <div class="view"><i class='bx bx-show'></i><%=viewcount%></div>
                <div class="like"><i class='bx bx-heart' ></i><%=likecheck%></div>
                <div class="statusBTN">
                	<button class="btn" onclick="location.href='<%= BTNLink%>'"><%= icon%></button>
                	<button class="btn" onclick="<%= BTNLink2%>"><%= icon2%></button>
                </div>
            </div>
            <hr>
            <div class="contents">
                <%= Dcontents%>
            </div>
            
            <!-- 댓글구현 -->
            
        </div><!-- wrap Fin -->
        </div>
    <%
            }
            
                rs.close();
                stmt.close();
                PreparedStatement pst = null;
                sql = "update duckktable set viewcount=? where IDK=?"; 
        		pst = conn.prepareStatement(sql); 
        		pst.setInt(1, viewcount);
        		pst.setInt(2, Integer.parseInt(idx));
        		pst.executeUpdate(); //업데이트

        		pst.close();
                conn.close();
    
    }catch (Exception e) {
        System.out.println("SQL Error" + e.getMessage());
    }
%>
    
        
</body>
</html>