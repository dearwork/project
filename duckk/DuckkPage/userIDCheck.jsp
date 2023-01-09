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
<form name="form" action="userIDcheck.jsp" method="post">
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
			sql = "select * from duckkuser Where id=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);

			ResultSet rs = pst.executeQuery();
		if (rs.next()) {
	%>
			<script>
			opener.document.form.id.value ="사용중인 아이디입니다.";
				opener.document.form.IDC.value = 0;
				window.open('', '_self', ''); //크롬 오류 방지
				window.close();
			</script>
	<%
			} else{
			%>
				
			<script>
			function IDclose() {
				opener.document.form.id.value ="<%= id%>";
				opener.document.form.IDC.value = 1;
				window.open('', '_self', ''); //크롬 오류 방지
				window.close();
				return false;
			}
			IDclose();
		</script>
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