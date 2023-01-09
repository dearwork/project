<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     <%@ page import = "java.sql.*"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>
	body{
		background: url("./image/backG2.png");
		background-position: top;
		background-size: inherit;
		background-attachment: fixed;
	}
	form{
		text-align: center;
		margin: 80px auto;
		max-width: 900px;
		width: 100%;
		height: 800px;
		/*border-radius: 40px;*/
		background: #cccccc;
	}
	table{
		font-size: 20px;
		text-align: center;
		width: 820px;
		margin: auto;
		text-align: left;
		
	}
	caption{
		text-align: center;
		font-size: 42px;
		margin: 60px auto;
		padding: 20px;
		letter-spacing: 15px;
		font-weight: 900;
	}
	input[type=text],input[type=password]{
		width: 250px;
		height: 28px;
	}
	input[type=text]::placeholder,input[type=password]::placeholder{
		font-size: 15px;
		padding: 3px;
	}
	input[type=text]:focus,[type=password]:focus,[type=button]:focus {outline:none;}
	input[type=button],input[type=reset]{
		width: 100px;
		height: 60px;
		border: 0px;
		border-radius: 5px;
		font-size: 15px;
	}
	input[name=Check]{
		font-weight: 500;
		letter-spacing: 2px;
	}
	input[name=name]{
		width: 250px;
		height: 28px;
	}
	select{
		font-size: 15px;
		appearance: none;
		width: 98px;
		height: 38px;
		padding: 10px;
		maring: auto 5px;
		border: 1px solid;
		border-radius: 0px
	}
	input[name=num2],input[name=num3]{
		width: 80px;
		height: 15px;
		padding: 10px;
		maring: auto 5px;
		text-align: center;
	}
	input[id=make]{
		width: 100%;
		height: 65px;
		padding: 5px;
		font-size: 24px;
		font-weight: 900;
		letter-spacing: 5px;
	}input[class=btn1]{
		width: 220px;
		height: 30px;
		padding: 4px;
		margin: 5px;
		letter-spacing: 3px;
		font-size: 13px;
	}
	input[class=btn2]{
		width: 100%;
		height: 30px;
	}
	p{
		color: #FFC75B;
		font-size: 12px;
		padding: 0px;
		margin: 0px;
	}
</style>
	<%
	try{
	
	Connection conn = null;
	PreparedStatement ptmt = null;
	String sql = null;
	String Uid =(String) session.getAttribute("user_ID");
	String Uname =(String) session.getAttribute("user_NAME");
		
	String dburl = "jdbc:mysql://localhost:3306/webdb?useSSL=false&characterEncoding=UTf-8&serverTimezone=Asia/Seoul";
	String dbid = "root";
	String dbpwd = "multi2020";
		
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dburl,dbid,dbpwd); //연결
	
	sql ="select * from reg_20192068 where id=?";
	ptmt = conn.prepareStatement(sql); 
	ptmt.setString(1, Uid);
	ResultSet rs = ptmt.executeQuery();
	if(rs.next()){
		//쿼리에서 추출한 값 불러오기
		String Dpwd = rs.getString("pwd");
		String Demail = rs.getString("email");
		String Dmobile1 = rs.getString("mobile1");
		String Dmobile2 = rs.getString("mobile2");
		String Dmobile3 = rs.getString("mobile3");
		
		%>
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="CheckUP.jsp" %>
	<form name="form"  action="updateproc.jsp"  method="post" autocomplete="off" >
		<div id="box2"></div>
		<table border="0" cellspacing="0" cellpadding="14">
		<caption><%= session.getAttribute("user_NAME") %>님의<br>회원정보수정</caption>				
			<tr>
				<td align="center" >아이디</td>
				<td><input type="text" name="id" size="20" value=<%= session.getAttribute("user_ID") %> readonly></td>
				<td align="center">이름</td>
				<td  width="300"><input type="text" name="name"  value=<%= session.getAttribute("user_NAME") %> readonly ></td>
			</tr>
			<tr >
				<td align="center" >비밀번호</td>
				<td colspan="3"><input type="password" name="pwd" size="20" placeholder="공백없이 5자~15이내로 입력하세요."  value="<%= Dpwd%>">
			</tr>
			<tr>
				
			</tr>
			<tr>
				<td align="center">이메일</td>
				<td colspan="3"><input type="text" name="email" size="20"  value="<%= Demail%>"></td>
			</tr>
			<tr>
				<td align="center">전화번호</td>
				<td colspan="3"><select name="num1">
					<option value="<%= Dmobile1%>" selected><%= Dmobile1%></option>
					<option disabled>-----------</option>
					<option value="010" >010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="019">019</option>
					</select>
					-
					<input type="text" name="num2" size="4" maxlength="4" value="<%=Dmobile2%>">
					-
					<input type="text" name="num3" size="4" maxlength="4" value="<%= Dmobile3%>">
				</td>
			</tr>
			<tr>
				<td colspan="5" align="center">
					<input type="button" name= "make" value="수정하기" onclick="check()" id="make"> 
				</td>
			</tr>
			<tr >
				<td align="left" >
					<input type="reset" value="초기화" class="btn2">
				</td>
				<td align= "right" colspan="3" >
				<input type="button" value="돌아가기" class="btn1" onclick="location.href='mypage.jsp'">
				</td>
			</tr>
		</table>
	</form>
		
		<%
		
	}	
		rs.close();
ptmt.close();
conn.close();
} catch (SQLException e){
out.print("실패");
System.out.println("SQL Error" + e.getMessage());
}
	%>

	
</body>
</html>