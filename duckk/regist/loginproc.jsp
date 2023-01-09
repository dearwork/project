<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	try{
	//입력한 값 불러오기
	String id = (String) request.getParameter("id");
	String pwd = (String) request.getParameter("pwd");
	String save = (String) request.getParameter("save");
	
	Connection conn = null;
	PreparedStatement ptmt = null;
	String sql = null;
		
	String dburl = "jdbc:mysql://localhost:3306/webdb?useSSL=false&characterEncoding=UTf-8&serverTimezone=Asia/Seoul";
	String dbid = "root";
	String dbpwd = "multi2020";
		
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dburl,dbid,dbpwd); //연결
	
		sql ="select * from reg_20192068 where id=?";
	
		
		ptmt = conn.prepareStatement(sql); 
		ptmt.setString(1, id);
		
		ResultSet rs = ptmt.executeQuery();
		
			if(rs.next()){
				
				//쿼리에서 추출한 값 불러오기
				String Did = rs.getString("id");
				String Dpwd = rs.getString("pwd");
				String Dname = rs.getString("name");
			
			if(id.equals(Did)){ //로그인 && 비밀번호가 같을때
				if(pwd.equals(Dpwd)){
					%>
					<script>
						alert("<%= Dname%>님 환영합니다.");
						location.href="mypage.jsp";						
					</script>
					<%
					//세션 저장
					session.setAttribute("user_ID", Did);
					session.setAttribute("user_PWD", Dpwd);
					session.setAttribute("user_NAME", Dname);
					//쿠키 로그인 유지
					if(save != null){
						Cookie cookie = new Cookie("id",id);
						
						cookie.setMaxAge(60*1); //60초
						response.addCookie(cookie); // 저장
					}
					rs.close();	
				}
				else if(!pwd.equals(Dpwd)){ //로그인 || 비밀번호가 같을때
				%>
				<script>
				alert("아이디 혹은 비밀번호가 틀렸습니다. \n다시 확인해주세요.");
				history.go(-1);
				</script>
				<%
				rs.close();
				}
			
				}
			}else{ //로그인 && 비밀번호가 없을 때
				%>
				<script>
				alert("입력하신 정보가 존재하지 않습니다. \n회원가입을 해주세요.");
				location.href="agree.jsp";	
				</script>
				<%
				rs.close();
		}
		ptmt.close();
		conn.close();
	} catch (SQLException e){
		%>
		<script>
		alert("입력하신 정보가 존재하지 않습니다. \n회원가입을 해주세요.");
		location.href="agree.jsp";	
		</script>
		<%
			System.out.println("SQL Error" + e.getMessage());
		}
	
	%>

</body>
</html>