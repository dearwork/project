<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String getNAME = (String)session.getAttribute("user_NAME");
		if(getNAME != null){
			session.invalidate(); //제거	
			 %>
		<script>
			alert("로그아웃 되었습니다.");
			location.href="login.jsp"
		</script>
			<%	
		}else{
			%>
			<script>
				alert("이미 로그아웃한 상태입니다. 다시 로그인해주세요.");
				location.href="login.jsp"
			</script>
				<%	
		}
		%>
</body>
</html>