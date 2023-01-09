<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String checkid = request.getParameter("checkid");
	%>
		<script>
		function check(form) {
			var id=document.resistform.id.value;
			var idreg = /^(?!(?:[0-9]+)$)([a-zA-Z]|[0-9a-zA-Z]){4,}$/; //영문·숫자 조합
			var blank_pattern = /[\s]/g; //공백

			if (id == ""){
				alert("아이디를 입력해주세요.");
				id.focus();
				return false;
			}else if(!idreg.test(id)|| blank_pattern.test(id)){
				alert("아이디를 조건에 맞게 입력해주세요.");
				id.focus();
				return false;
			}else if(id.length < 5 || id.length > 15){
				alert("아이디를 조건에 맞게 입력해주세요.");
				id.focus();
				return false;
			}else if(id){
			url="IDcheck.jsp?id="+id;
			location.href=url;
			}else{
			alert("ID를 입력하세요!");
			}
		}
		function IDclose() {
			opener.document.form.id.value ="<%= id%>";
			opener.document.form.IDC.value = 1;
			window.open('', '_self', ''); //크롬 오류 방지
			window.close();
			return false;
		}
	</script>
	
	<style>
	body{
		background: url("./image/updatef.png");
		background-position: top;
		background-size: inherit;
		background-attachment: fixed;
	}
		form{
			text-align: center;
			margin: auto;
			max-width: 460px;
			width: 100%;
			height: 260px;
			background: #cccccc;
		}
		h1{
			text-align: center;
			margin: 50px auto;
		}
		.box1{
			width: 100%;
			height: 50px;
		}
		h3{
			padding: 5px;
			margin: 10px auto;
		}
		input[type=text]{
			width: 300px;
			height: 30px;
			margin: 10px;
		}
		input[type=button]{
				width: 150px;
				height: 50px;
				padding: 5px;
				margin: 10px;
		}
	</style>
	<h1>아이디 중복확인 결과: </h1>
<form name="resistform" action="IDcheck.jsp" method="post">
<div class="box1"></div>
	<%
		try {
			Connection conn = null;
			PreparedStatement pst = null;
			String sql = null;

			String dburl = "jdbc:mysql://localhost:3306/webdb?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
			String dbid = "root";
			String dbpwd = "multi2020";

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dburl, dbid, dbpwd);
			sql = "select * from reg_20192068 Where id=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);

			ResultSet rs = pst.executeQuery();
		if (rs.next()) {
	%>
		
			<h3><strong><%= id %></strong>는/은 이미 존재하는 아이디입니다.</h3><br> 
			<input type="text" name="id" size="20" placeholder="공백없이 5자~15이내로 입력하세요."  autocomplete="off">
			<br><input type="button" value="중복확인" onclick="check(resistform)">
	<%
			} else{
			%>
			<h3><strong><%=id%></strong>는/은 사용할 수 있는 아이디입니다.</h3><br>
			<input type="button"  value="확인" onclick = "IDclose()">
		<%
			}
				conn.close();
				pst.close();
				rs.close();
			} catch (SQLException e) {
				System.out.println("SQL Error" + e.getMessage());
			}
		%>
	</form>
</body>
</html>