<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
		<%
		try{
			String pwd = request.getParameter("pwd");
			String id= (String)session.getAttribute("user_ID");
			
			Connection conn = null;
			PreparedStatement pst = null;
			String sql = null;
			
			String dburl = "jdbc:mysql://localhost:3306/webdb?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
			String dbid = "root";
			String dbpwd = "multi2020";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dburl,dbid,dbpwd);
			
			sql ="select * from reg_20192068 where id=? and pwd=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, pwd);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()){
				
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(dburl,dbid,dbpwd);
				
				sql = "delete from reg_20192068 where id = ? and pwd=?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, id);
				pst.setString(2, pwd);
				
				pst.executeUpdate();
		%>
			<script> 
				alert("성공적으로 탈퇴하셨습니다.");
				location.href="login.jsp";
			</script>
		<% 
			session.invalidate(); //제거
		//제거	
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(int i = 0; i < cookies.length; i++){
				if(cookies[i].getName().equals("id")){
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
				}
			}
		}
			conn.close();
			pst.close();
			}else{
				%>
				<script>
				alert("입력하신 정보가 올바르지 않습니다. 다시 입력해주세요.");
				history.go(-1);
				</script>
				<%
			}
		}catch (SQLException e){
			%>
			<script>
			alert("입력하신 정보가 올바르지 않습니다. 다시 입력해주세요.");
			history.go(-1);
			</script>
			<%
			System.out.println("SQL Error" + e.getMessage());
		}
	%>		
</body>
</html>