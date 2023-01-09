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
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile1 = request.getParameter("num1");
		String mobile2 = request.getParameter("num2");
		String mobile3 = request.getParameter("num3");
		try{
		Connection conn = null;
		PreparedStatement pst = null;
		String sql = null;
		
		String dburl = "jdbc:mysql://localhost:3306/webdb?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
		String dbid = "root";
		String dbpwd = "multi2020";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dburl,dbid,dbpwd);
		sql = "update reg_20192068 set pwd=?, name=?,  email=?,  mobile1=?, mobile2=?,  mobile3=? where id=?"; 
		pst = conn.prepareStatement(sql); 
		pst.setString(1, pwd);
		pst.setString(2, name);
		pst.setString(3, email);
		pst.setString(4, mobile1);
		pst.setString(5, mobile2);
		pst.setString(6, mobile3);
		pst.setString(7, id);
		pst.executeUpdate(); //업데이트
		
		sql = "select * from reg_20192068 where id=?";
		pst = conn.prepareStatement(sql);
		pst.setString(1,id);
		ResultSet rs = pst.executeQuery();
		%>
<!DOCTYPE html>
<html>
<head>
<style>
	body{
		background: url("./image/backG2.png");
		background-position: top;
		background-size: inherit;
		background-attachment: fixed;
	}
	.frame{
		max-width: 680px;
		width: 100%;
		height: 700px;
		margin: auto;
		background: #cccccc;
	}
	table{
		max-width: 490px;
		width: 100%;
		margin: auto;
		text-align: center;
		font-size: 20px;
	}
	caption{
		text-align: center;
		font-weight: 600;
		margin: 20px auto;
		font-size: 24px;
	}
	.box1{
		width: 100%;
		height: 30px;
	}
	.circle{
		width: 150px;
		height: 150px;
		margin: 42px auto;
		border-radius: 50%;
		background: url('./image/c1.png');
	    background-size: cover;
		background-attachment: scroll;
	}
	input[type=button]{
		margin-top: 15px;
		width: 100%;
		height: 44px;
		border: 0px;	
	}
	td{
		border: 0px;
		border-bottom: 2px solid #000000;
		padding: 8px;
	}
	#btn{
		padding: 8px;
		border: 0px;
	}
	
	</style>
</head>
<body>
		<script>
			alert("회원정보가 수정되었습니다.");
		</script>
		<%@include file="header.jsp" %>
		<div class="frame">
		<table border="0" cellspacing="0" cellpadding="6">
		<div class="box1"></div>
		<div class="circle"></div>
		<%
			if(rs.next()){
			//값 불러오기
			String u_id = rs.getString("id");
			String u_pwd = rs.getString("pwd");
			String u_name = rs.getString("name");
			String u_email = rs.getString("email");
			String u_mobile1 = rs.getString("mobile1");
			String u_mobile2 = rs.getString("mobile2");
			String u_mobile3 = rs.getString("mobile3");
			
			//세션 수정			
			session.setAttribute("user_ID", u_id);
			session.setAttribute("user_PWD", u_pwd);
			session.setAttribute("user_NAME", u_name);
			session.setAttribute("user_EMAIL", u_email);
			session.setAttribute("user_mobile1", u_mobile1);
			session.setAttribute("user_mobile2", u_mobile2);
			session.setAttribute("user_mobile3", u_mobile3);
		%>
		
		<caption><%= session.getAttribute("user_NAME") %><br>님의 수정된 회원정보</caption>			
			<tr>
				<td>아이디</td>
				<td><%= u_id%></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%= u_pwd%></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%= u_name%></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><%= u_email%></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><%= u_mobile1%>
					-
					<%= u_mobile2%>
					-
					<%= u_mobile3%>
					
				</td>
			</tr>
			<tr >
				<td colspan="2" id="btn">
					<input type="button" value="마이페이지로 돌아가기"  onclick="location.href='mypage.jsp'">
				</td>
			</tr>
		</table>
		</div>
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