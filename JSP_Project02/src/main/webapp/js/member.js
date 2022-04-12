$(document).ready(function(){
	var exp =/^[0-9]{3}-[0-9]{4}-[0-9]{4}$/
	$("#sendBtn").click(function(){
		if($("#name").val()==""){
			alert("이름을 입력하세요");
			$("#name").focus();
			return false;
		}
		if($("#userid").val()==""){
			alert("아이디를 입력하세요");
			$("#userid").focus();
			return false;
		}
		if($("#pwd").val()==""){
			alert("비밀번호를 입력하세요");
			$("#pwd").focus();
			return false;
		}
		if($("#pwd").val()!=$("#pwd_check").val()){
			alert("비밀번호가 일치하지 않습니다");
			$("#pwd_check").focus();
			return false;
		}
		if($("#email").val()==""){
			alert("이메일을 입력하세요");
			$("#email").focus();
			return false;
		}
	
		/*if(!$("#phone").val().match(exp)){
			alert("전화번호 형식이 아닙니다")
			$("#phone").focus();
			return false;
		}*/
		
		if(!exp.test($("#phone").val())){
			alert("전화번호 형식이 아닙니다")
			$("#phone").focus();
			return false;
		}
		$("#frm").submit();
		});
	});
