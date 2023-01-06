//명령어 설정하기

//명령어 생성자
var cmd_name = $(".system_form .cmd_name"),
	cmd_code = $(".system_form .cmd_code"); //입력한 값 저장

var cmd_make = function(name, code, result) {
	this.name = name;
	this.code = code;
	this.result = result;
}

//명령어 리스트
var cmd_list = {
	//명령어, 실행되는 코드

}