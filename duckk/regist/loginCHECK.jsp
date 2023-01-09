<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("user_ID");
	
		if(id == null){
		%>
				<script>
					alert("로그인상태가 아닙니다. 로그인해주세요.");
					location.href="login.jsp";
				</script>
		<%
		}else{
			%>
			<script>
				location.href="mypage.jsp";
			</script>
		<%	
		}
	%>
</body>
</html>