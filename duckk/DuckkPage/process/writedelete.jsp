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

			String post_IDK= (String)session.getAttribute("post_IDK");
			String post_LOCATION= (String)session.getAttribute("post_LOCATION");
			
			Connection conn = null;
			PreparedStatement pst = null;
			String sql = null;
			
			String dburl = "jdbc:mysql://localhost:3306/webdb?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
			String dbid = "root";
			String dbpwd = "multi2020";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dburl,dbid,dbpwd);
			
			sql ="select * from duckktable where IDK=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, post_IDK);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()){
				
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(dburl,dbid,dbpwd);
				
				sql = "delete from duckktable where IDK =? ";
				pst = conn.prepareStatement(sql);
				pst.setString(1, post_IDK);
				
				pst.executeUpdate();
				
				//페이지 넘어가기
				String  LocalPage = "";
				if(post_LOCATION.equals("게임")) {
					LocalPage = "Game.jsp";
				}else if (post_LOCATION.equals("소설")) {
					LocalPage = "Novel.jsp";
				}else if (post_LOCATION.equals("2D")) {
					LocalPage = "TwoD.jsp";
				}else if (post_LOCATION.equals("인물")) {
					LocalPage = "Novel.jsp";
				}else if (post_LOCATION.equals("그 외")) {
					LocalPage = "Other.jsp";
				}else if (post_LOCATION.equals("영업")) {
					LocalPage = "Sales.jsp";
				}else if (post_LOCATION.equals("커뮤니티")) {
					LocalPage = "Cummunity.jsp";
				}else if (post_LOCATION.equals("Q&A")) {
					LocalPage = "QAndA.jsp";
				}else if (post_LOCATION.equals("문의사항")) {
					LocalPage = "Question.jsp";
				}else if (post_LOCATION.equals("공지사항")) {
					LocalPage = "Notice.jsp";
				}else{
					LocalPage = "index.jsp";
				}
		%>
			<script> 
				alert("게시물을 삭제했습니다.");
				location.href="./../<%=LocalPage%>";
			</script>
		<% 
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