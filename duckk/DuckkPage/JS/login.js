function checklogin() {
    var form = document.form;
    //id
    var id = form.id; 
    if(id.value == ""){
        id.focus();
        return false;
    }
    //password
    var pass = form.pass;
    var passAgain = form.passAgain;
    if(pass.value == ""){
        pass.focus();
        return false;
    }
    form.submit();
};

