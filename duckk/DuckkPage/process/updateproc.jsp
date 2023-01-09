<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%request.setCharacterEncoding("UTF-8");%>
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
    <script src="./../JS/side_header.js"></script>
    <script src="./../JS/Join.js"></script>
    <title>DUCKK</title>
</head>
<body>

		<%@include file="headerproc.jsp" %>
<%
		String id = (String) request.getParameter("id");
		String pwd = (String) request.getParameter("pass");
		String name = (String) request.getParameter("name");
		String age = (String) request.getParameter("age");
		String email = (String) request.getParameter("email");
		Object objsesion = session.getAttribute("user_ID");
		String str_session = (String)objsesion;
		
		
		try{
		Connection conn = null;
		PreparedStatement pst = null;
		String sql = null;
		
		String dburl = "jdbc:mysql://localhost:3306/webdb?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
		String dbid = "root";
		String dbpwd = "multi2020";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dburl,dbid,dbpwd);
		sql = "update duckkuser set id=?, name=?, pwd=?,  email=?, age=? where id=?"; 
		pst = conn.prepareStatement(sql); 
		pst.setString(1, id);
		pst.setString(2, name);
		pst.setString(3, pwd);
		pst.setString(4, email);
		pst.setString(5, age);
		pst.setString(6, str_session);
		pst.executeUpdate(); //업데이트
		
		sql = "select * from duckkuser where id=?";
		pst = conn.prepareStatement(sql);
		pst.setString(1,id);
		ResultSet rs = pst.executeQuery();
		%>
<!DOCTYPE html>
<html>
<head>
		<div id="bigf">
		<script>
			alert("회원정보가 수정되었습니다.");
		</script>
		<%
			if(rs.next()){
			//값 불러오기
			String Did = rs.getString("id");
			String Dpwd = rs.getString("pwd");
			String Dname = rs.getString("name");
			String Demail = rs.getString("email");
			String Dage = rs.getString("age");
			
			//세션 수정			
			session.setAttribute("user_ID", Did);
			session.setAttribute("user_PWD", Dpwd);
			session.setAttribute("user_NAME", Dname);
			session.setAttribute("user_EMAIL", Demail);
			session.setAttribute("user_AGE", Dage);
		%>
		<div id="wrap">
            <div class="box">
                <h3><%= session.getAttribute("user_NAME")%>님의 수정된 정보</h3>
                <div class="formBox">
                    <div class="inputBox">
                        <input type="text" name="name" id="name" required value="<%= Dname%>" readonly>
                        <label>이름(닉네임)</label>
                        <input type="hidden" id="inDuplication" value="udUncheck"></input>
                    </div>
                    <div class="inputBox radioBox">
		                <label style="margin-right: 10px; color: #fff;">선택한 연령: <%= Dage%></label>
                    </div>
                    <div class="inputBox idBox">
                        <input type="text" name="id" id="id" required  value="<%= Did%>" readonly>
                        <label>아이디(4~20자)</label>
                        <input type="hidden" name="IDC" value="2"  id="againCheck"><!-- 중복확인 -->
                    </div>
                    <div class="inputBox emailBox">
                        <input type="text" name="email" id="email" required  value="<%= Demail%>" readonly>
                        <label>이메일</label>
                    </div>
                    <div class="inputBox">
                        <input type="password" name="pass" id="passField" class="pass" required  value="<%= Dpwd%>" readonly>
                        <label>비밀번호(8~)</label>
                        <div class="show-btn">
                            <i class='bx bx-show'></i>
                            <i class='bx bx-hide'></i>
                        </div>
                    </div>
                    <a href="./../mypage.jsp">마이페이지로 돌아가기 </a>
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
		<%
		conn.close();
		pst.close();
		rs.close();
			}
		} catch (SQLException e){
		%>
		<script>
		alert("회원수정에 실패했습니다. 다시 입력해주세요.");
		history.go(-1);
		</script>
	<%
		System.out.println("SQL Error" + e.getMessage());
	}
%>

</body>
</html>