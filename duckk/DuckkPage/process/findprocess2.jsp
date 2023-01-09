<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="shortcut icon" href="./../image/s-image/favicon.ico" type="image/x-icon">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./../CSS/reset.css">
    <link rel="stylesheet" href="./../CSS/update.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.3/TweenMax.min.js"></script>
    <script src="./../JS/jquery.min.js"></script>
    <title>DUCKK</title>
</head>
<body>
	<%
	try{
	//입력한 값 불러오기
	String id = (String) request.getParameter("id");
	String name = (String) request.getParameter("name");
	String email = (String) request.getParameter("email");
	
	Connection conn = null;
	PreparedStatement ptmt = null;
	String sql = null;
		
	String dburl = "jdbc:mysql://localhost:3306/webdb?useSSL=false&characterEncoding=UTf-8&serverTimezone=Asia/Seoul";
	String dbid = "root";
	String dbpwd = "multi2020";
		
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dburl,dbid,dbpwd); //연결
	
		sql ="select * from duckkuser where id=? && name= ? && email =? ";
		ptmt = conn.prepareStatement(sql); 
		ptmt.setString(1, id);  
		ptmt.setString(2, name); 
		ptmt.setString(3, email); 
		
		ResultSet rs = ptmt.executeQuery();
		%>
		<!DOCTYPE html>
		<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="shortcut icon" href="./../image/s-image/favicon.ico" type="image/x-icon">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./../CSS/reset.css">
    <link rel="stylesheet" href="./../CSS/find.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.3/TweenMax.min.js"></script>
    <script src="./../JS/jquery.min.js"></script>
    <title>DUCKK</title>
</head>
		<body>
		
		<%@include file="headerproc.jsp" %>
		<%
				if(rs.next()){
					String u_name = rs.getString("name");
					String u_pwd = rs.getString("pwd");
				%>
		<div id="wrap"style="width:auto;">
            <div class="box">
                <h3>검색결과</h3>
                <div class="formBox">
                    <div class="inputBox">
                        <input type="text" name="name" id="name" required value="<%=  u_pwd%>" readonly>
                        <label><%= u_name %>의 비밀번호 : </label>
                        <input type="hidden" id="inDuplication" value="udUncheck"></input>
                    </div>
                <a href="./../Login.jsp" style="width:100%; color:#fff; margin:auto;">로그인페이지로 돌아가기 </a>
                    </div>
                
                </div>
            </div>
            
        </div><!--wrap Fin-->
    </div><!--bigf Fin-->
    <script>
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
		
				<% }else{%>
					<script> 
						alert("입력하신 정보가 존재하지 않습니다.");
						history.go(-1);
					</script>
				<% }
					conn.close();
					ptmt.close();
					rs.close();
				} catch (SQLException e){
					System.out.println("SQL Error" + e.getMessage());
				}
				%>

</body>
</html>