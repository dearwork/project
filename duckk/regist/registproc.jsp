<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
		
		<%
		String id = (String) request.getParameter("id");
		String pwd = (String) request.getParameter("pwd");
		String name = (String) request.getParameter("name");
		String email = (String) request.getParameter("email");
		String mobile1 = (String) request.getParameter("num1");
		String mobile2 = (String) request.getParameter("num2");
		String mobile3 = (String) request.getParameter("num3");
	
		try{
		//값 불러오기 => 넣기
		
			
		//request.getSession().setAttribute("id", id);
		Connection conn = null;
		PreparedStatement ptmt = null;
		String sql = null;
		
		String dburl = "jdbc:mysql://localhost:3306/webdb?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
		String dbid = "root";
		String dbpwd = "multi2020";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dburl,dbid,dbpwd); //연결

		sql = "insert into reg_20192068(id, pwd, name, email, mobile1, mobile2, mobile3) values(?, ?, ?, ?, ?, ?, ?)";
		ptmt = conn.prepareStatement(sql); 
		
		ptmt.setString(1, id);
		ptmt.setString(2, pwd);
		ptmt.setString(3, name);
		ptmt.setString(4, email);
		ptmt.setString(5, mobile1);
		ptmt.setString(6, mobile2);
		ptmt.setString(7, mobile3);
		ptmt.executeUpdate(); //업데이트
		
		ptmt.close();
		conn.close();
	%>
		<script>
		alert("회원가입에 성공했습니다.\n로그인페이지로 이동합니다.");
		location.href="login.jsp";
		</script>
	<%
		
		} catch (SQLException e){
		%>
			<script>
			alert("회원가입에 실패했습니다. \n 다시 확인해주세요.");
			history.go(-1);
			</script>
		<%
			System.out.println("SQL Error" + e.getMessage());
		}
	%>
	<script>
			//
	</script>
</body>
</html>