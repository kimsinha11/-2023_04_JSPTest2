<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!--  <script>
function jbSubmit() {
	 var pw1 = document.getElementById( 'pw1' ).value;
     var pw2 = document.getElementById( 'pw2' ).value;
     if (pw1 != pw2) {
     alert('비밀번호가 일치하지 않습니다');
     return false;
     }
}
</script>
-->

</head>
<script  type = "text/javascript">
var JoinForm__submitDone = false;
function JoinForm__submit(form) {
	if(JoinForm__submitDone){
		alert('처리중 입니다.');
		return;
	}
	
	
	var loginId = form.loginId.value.trim();
	var loginPw = form.loginPw.value.trim();
	var loginPwConfirm = form.loginPwConfirm.value.trim();
	var name = form.name.value.trim();
	
	if(loginId.length == 0) {
		alert('아이디를 입력해주세요');
		form.loginId.focus();
		return;
	}
	
	if(loginPw.length == 0) {
		alert('비밀번호를 입력해주세요');
		form.loginPw.focus();
		return;
	}
	
	
	if(loginPwConfirm.length == 0) {
		alert('비밀번호 확인란을 입력해주세요');
		form.loginPwConfirm.focus();
		return;
	}
	if(loginPw != loginPwConfirm) {
		alert('비밀번호가 일치하지 않습니다');
		form.loginPw.focus();
		return;
	}
	
	if(name.length == 0) {
		alert('이름 입력해주세요');
		form.name.focus();
		return;
	}
	
	JoinForm__submitDone = true;
	form.submit();
}
</script>

<body>
	<div><a style="color:green" href="../home/main">메인으로 돌아가기</a></div>
	<h1 style="border: 2px solid black; text-align:center;">회원가입</h1>
	
	<form style="border: 2px solid black; text-align:center;" method="post" action="doJoin" onsubmit="JoinForm__submit(this); return false;">
		<div>
			아이디 : <input type="text" placeholder="loginId" name="loginId" autocomplete="on"/>
		</div>
		<br />
		<div>
			비밀번호 : <input type="password" placeholder="loginPw" name="loginPw"/>
		</div>
		<br />
		<div>
			비밀번호 확인: <input type="password" placeholder="loginPwConfirm" name="loginPwConfirm"/>
		</div>
		<br />
		<div>
			이름 : <input type="text" placeholder="name" name="name"/>
		</div>
		<br />
		<button style="text-align:center;" type="submit" onclick="if(confirm('회원가입하시겠습니까?')==false) return false;">회원가입</button>
	</form>
</body>
</html>