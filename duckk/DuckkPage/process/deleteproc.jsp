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
			String pwd = request.getParameter("pass");
			String user= (String)session.getAttribute("user_USER");
			System.out.print(user);
			
			Connection conn = null;
			PreparedStatement pst = null;
			String sql = null;
			
			String dburl = "jdbc:mysql://localhost:3306/webdb?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
			String dbid = "root";
			String dbpwd = "multi2020";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dburl,dbid,dbpwd);
			
			sql ="select * from duckkuser where id=? or pwd=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, user);
			pst.setString(2, pwd);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()){
				
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(dburl,dbid,dbpwd);
				
				sql = "delete from duckkuser where user = ? && pwd=?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, user);
				pst.setString(2, pwd);
				
				pst.executeUpdate();
		%>
			<script> 
				alert("성공적으로 탈퇴하셨습니다.");
				location.href="./../Login.jsp";
			</script>
		<% 
				session.removeAttribute("user_USER");
				session.removeAttribute("user_ID");
				session.removeAttribute("user_PWD");
				session.removeAttribute("user_NAME");
			conn.close();
			pst.close();
			}%>
			<script>
			alert("입력하신 정보가 올바르지 않습니다. 다시 입력해주세요.");
			history.go(-1);
			</script>
			<%
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