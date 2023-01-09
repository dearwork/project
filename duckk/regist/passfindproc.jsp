<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
</head>
<body>
	<%
	try{
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
	
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pst = null;
		String sql = null;
		
		String dburl = "jdbc:mysql://localhost:3306/webdb?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
		String dbid = "root";
		String dbpwd = "multi2020";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dburl,dbid,dbpwd);
		sql = "select * from reg_20192068 where id=? &&  email=?";
		pst = conn.prepareStatement(sql);
		pst.setString(1,id);
		pst.setString(2,email);
	
		ResultSet rs = pst.executeQuery();
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<style>
	body{
		background: url("./image/backG2.png");
		background-position: top;
		background-size: inherit;
		background-attachment: fixed;
	}
	.frame1{
		max-width: 500px;
		width: 100%;
		height: 550px;
		margin: auto;
		background: #cccccc;
	}
	table{
		margin: auto;
		text-align: center;
		font-size: 20px;
	}
	.box1{
		width: 100%;
		height: 30px;
	}
	.circle{
		width: 150px;
		height: 150px;
		margin: 50px auto;
		border-radius: 50%;
		background: #000000;
		background: url('./image/c3.png');
	    background-size: cover;
		background-attachment: scroll;
	}
	caption{
		margin: 20px auto;
		font-size: 24px;
	}
	th{
		letter-spacing: 6px;
	}
	input[type=button]{
		width: 150px;
		height: 40px;
		border: 0px;
		
	}
	
</style>
</head>
<body>
		<%@include file="header.jsp" %>
		<%if(rs.next()){
			String u_id = rs.getString("id");
			String u_pwd = rs.getString("pwd");
			String u_name = rs.getString("name");
		%>
			<div class="frame1">
			<table border="0" cellspacing="0" cellpadding="8" >
			<div class="box1"></div>
			<div class="circle"></div>
			<caption>검색결과: </caption>
				<tr height="10px">
					<td><%= u_name %>의 비밀번호는</td>
				</tr>
				<tr height="40px">
						<th><%=  u_pwd%>입니다.</th>
				</tr>
				<tr>
					<td><input type="button"  value="로그인" onclick="location.href='login.jsp'">
					&nbsp;&nbsp;&nbsp;<input type="button"  value="아이디찾기" onclick="location.href='Idfind.jsp'"></td>
				</tr>
			</table>
		<% }else{%>
			<script> 
				alert("입력하신 정보가 존재하지 않습니다.");
				history.go(-1);
			</script>
		<% }
			conn.close();
			pst.close();
			rs.close();
		} catch (SQLException e){
			System.out.println("SQL Error" + e.getMessage());
		}
		%>
		
</body>
</html>

</body>
</html>