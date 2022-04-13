<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 	<script src ="../js/member.js"></script> -->
		<script src ="/JSP_Project02/js/member.js"></script>
		
				
	<script>
	$(function () {
		$("#loginBtn").click(function () {
			if($("#userid").val()==""){
				alert("아이디 입력");
				$("#userid").focus();
				return;
			}
			if($("#pwd").val()==""){
				alert("비밀번호 입력");
				$("#pwd").focus();
				return;
				}
			$.ajax({
				type:"post",
				url : "loginPro.jsp",
				data:{"userid" : $("#userid").val(),"pwd" : $("#pwd").val()},
				success: function(resp){
					if(resp.trim()==-1){
						alert("회원이 아닙니다.회원가입 하세요.")
					}
					else if(resp.trim()==0){
						alert("일반회원 로그인 성공")
						//location.href = "memberList.jsp"
						$(location).attr("href","memberView.jsp");
					}
					else if(resp.trim()==1){
						alert("관리자 로그인 성공")
						//location.href = "memberList.jsp"
						$(location).attr("href","memberList.jsp");
					}
					else if(resp.trim()==2){
						alert("비밀번호 오류")
					}
				},
				error : function (e) {
					alert("error: "+e);
				}
			})
		})
	})
	
	</script>
	
<title>Login</title>
</head>
<body>
<div class="container mt-5">
<h2>회원가입</h2>
		<form action="" >
			<div class="form-group">
				<label for="userid">UserID:</label> <input type="text"
					class="form-control" id="userid" placeholder="Enter userid" name="userid">
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" id="pwd" placeholder="Enter password"
					name="pwd">
			</div>
			<button type="button" class="btn btn-primary" id="loginBtn">로그인</button>
			<button type="reset" class="btn btn-secondary" >취소</button>
			<button type="button" class="btn btn-secondary" onclick="location.href='memberform.jsp'">회원가입</button>
			</form>
	</div>
</body>
</html>