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
		//테이블 생성
			try{
			Connection conn = null;
			Statement stmt = null;
			String sql = null;
			String tableN = "duckkUser";
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
			sql = "create table duckkUser(user  int(20) not null auto_increment, id varchar(10) not null, pwd varchar(10) not null, name varchar(10) not null, email varchar(20) not null, age varchar(10) not null, regDate Datetime not null default CURRENT_TIMESTAMP, primary key(user))";
			stmt.executeUpdate(sql);

			out.print("YOILAND 테이블이 생성되었습니다!");
			conn.close();
			stmt.close();
			}
			} catch(SQLException e){
					System.out.println("SQL Error" + e.getMessage());

					out.print("시발!");
			}
	%>
</body>
</html>