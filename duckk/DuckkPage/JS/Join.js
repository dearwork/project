function checkID(form){
		var form = document.form;
		var id = form.id;
		var Engnumreg = /^(?!(?:[0-9]+)$)([a-zA-Z]|[0-9a-zA-Z]){4,}$/; //영문·숫자 조합
        let pattern = /^[a-zA-Z][a-zA-Z0-9]{3,20}$/; 
		var blank_pattern = /[\s]/g; //공백
		
		if(id.value == ""){
			id.focus();
			return false;
		}else if(!pattern.test(id.value) || blank_pattern.test(id.value)){
			id.focus();
			return false;
		}else if(id.value.length < 4){
			id.focus();
			return false;
		}
			url = "userIDCheck.jsp?id="+id.value;
			window.open(url,"아이디중복확인","width=500,height=400, top=600, left=900, resizable=no, toolbars=no, menubar=no");
	}
function checkAfter() {
    var form = document.form;
    var IDC = form.IDC;
    var Idtext = form.querySelector(".textid");
 	if(IDC.value == 0){
 		Idtext.innerText = "사용중인 아이디입니다.";     
       Idtext.style.color = "red";
 		id.focus();
 		return false;
 	}else if(IDC.value == 1){
 		Idtext.innerText = "사용 가능한 아이디입니다.";             
       Idtext.style.color = "#ffc400";
   }
	
} 
function checkjoin() {
    var form = document.form;
    //name
    var name = form.name;
    var nameP = form.querySelector("#namep");
    if(name.value ==""){
        name.focus();
        return false;
    }
    //radio
    var age = form.age;
    if(age.value == ''){
        alert("연령을 선택해주세요.");
        return false;
    }
    //id
    var id = form.id;
    let IDpattern = /^[a-zA-Z][a-zA-Z0-9]{3,20}$/; 
    if(id.value == ""){
        id.focus();
        return false;
    }else if (!IDpattern.test(id.value)) {
        id.focus();
        return false;
    }
    //email
    var email = form.email;
    let EMAILpattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    if(email.value ==""){
        email.focus();
        return false;
    }else if(!EMAILpattern.test(email.value)){
        email.focus();
        return false;
    }
    //password
    var pass = form.pass;
    var passAgain = form.passAgain;
    let PASSpattern = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
    if(pass.value == ""){
        pass.focus();
        return false;
    }else if (!PASSpattern.test(pass.value)){
        pass.focus();
        return false;
    }
    if (passAgain.value ==""){
        passAgin.focus();
        return false;
    }else if(pass.value != passAgain.value){
        return false;
    }
    //agree
    var agree1 = document.querySelector('input[id="Check"]');
    var agree2 = document.querySelector('input[id="Check2"]');
    if (agree1.checked != true){
        alert("개인정보취급방침에 동의해주세요.");
        return false;
    }else if( agree2.checked != true){
        alert("회원이용약관에 동의해주세요.");
        return false;
    }

    //IDC check
     var IDC = form.IDC;
     var Idtext = form.querySelector(".textid");
  	if(IDC.value == 0){
  		Idtext.innerText = "사용중인 아이디입니다.";     
        Idtext.style.color = "red";
  		id.focus();
  		return false;
  	}else if(IDC.value == 1){
  		Idtext.innerText = "사용 가능한 아이디입니다.";             
        Idtext.style.color = "#ffc400";
    }
      
    form.submit();
};

