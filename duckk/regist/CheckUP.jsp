<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     <%@ page import = "java.sql.*"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<script>
	function check() {
		var form = document.form;
		var id = form.id;
		var pwd = form.pwd;
		var name = form.name;
		var email = form.email;
		var num1 = form.num1;
		var num2 = form.num2;
		var num3 = form.num3;

		var idreg = /^(?!(?:[0-9]+)$)([a-zA-Z]|[0-9a-zA-Z]){4,}$/; //영문·숫자 조합
		var passreg = /[0-9a-zA-Z.;\-]/; 
		var numreg = /^[0-9]+$/;
		var regexp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var blank_pattern = /[\s]/g; //공백
		
		//id
		if (id.value == ""){
			alert("아이디를 입력해주세요.");
			id.focus();
			return false;
		}else if(!idreg.test(id.value)|| blank_pattern.test(id.value)){
			alert("아이디를 조건에 맞게 입력해주세요.");
			id.focus();
			return false;
		}else if(id.value.length < 5 || id.value.length > 15){
			alert("아이디를 조건에 맞게 입력해주세요.");
			id.focus();
			return false;
		}
		//password
		if (pwd.value == ""){
			alert("비밀번호를 입력해주세요.");
			pwd.focus();
			return false;
		}else if(!passreg.test(pwd.value) || pwd.value.length<5 || pwd.value.length >15){
			alert("비밀번호를 조건에 맞게 입력해주세요.");
			pwd.focus();
			return false;
		}
		//이름
		if (name.value == ""){
			alert("이름을 입력해주세요.");
			name.focus();
			return false;
		}
		//email
		if(email.value ==""){
			alert("이메일을 입력해주세요.");
			email.focus();
			return false;
		}else if(!regexp.test(email.value)){
			alert("이메일을 올바르게 입력해주세요.");
			email.focus();
			return false;
		}
		//phone
		if(num2.value == "" || !numreg.test(num2.value) || num2.value.length < 4){
			alert("두번째 전화번호를 올바르게 입력해주세요.");
			num2.focus();
			return false;
		}else if(num3.value == "" || !numreg.test(num3.value) || num3.value.length < 4){
			alert("세번째 전화번호를 올바르게 입력해주세요.");
			num3.focus();
			return false;
		}
		
		form.submit();	
	}
	</script>
</body>
</html>