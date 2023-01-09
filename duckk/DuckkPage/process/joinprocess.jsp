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
		<%@include file="createDB.jsp" %>
		<%
		String id = (String) request.getParameter("id");
		String pwd = (String) request.getParameter("pass");
		String name = (String) request.getParameter("name");
		String age = (String) request.getParameter("age");
		String email = (String) request.getParameter("email");
	
		try{
		//값 불러오기 => 넣기
		
		Connection conn = null;
		PreparedStatement ptmt = null;
		String sql = null;
		
		String dburl = "jdbc:mysql://localhost:3306/webdb?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
		String dbid = "root";
		String dbpwd = "multi2020";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dburl,dbid,dbpwd); //연결

		sql = "insert into duckkuser(id, pwd, name, email, age) values(?, ?, ?, ?, ?)";
		ptmt = conn.prepareStatement(sql); 
		
		ptmt.setString(1, id);
		ptmt.setString(2, pwd);
		ptmt.setString(3, name);
		ptmt.setString(4, email);
		ptmt.setString(5, age);
		ptmt.executeUpdate(); //업데이트
		
		session.setAttribute("userNAME", name);
		
		ptmt.close();
		conn.close();
	%>
		<script>
		alert("<%= name%>님\nDUCKK에 오신걸 환영합니다.");
		location.href="./../Login.jsp";
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