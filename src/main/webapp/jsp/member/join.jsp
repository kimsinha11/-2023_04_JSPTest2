<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
function jbSubmit() {
	 var pw1 = document.getElementById( 'pw1' ).value;
     var pw2 = document.getElementById( 'pw2' ).value;
     if (pw1 != pw2) {
     alert('비밀번호가 일치하지 않습니다');
     return false;
     }
}
</script>
</head>
<body>
	<div><a style="color:green" href="../home/main">메인으로 돌아가기</a></div>
	<h1 style="text-align:center;">회원가입</h1>
	
	<form style="text-align:center;" method="post" action="doJoin" onsubmit="return jbSubmit();">
		<div>
			아이디 : <input type="text" placeholder="loginId" name="loginId" autocomplete="on" required/>
		</div>
		<br />
		<div>
			비밀번호 : <input type="password" placeholder="loginPw" name="loginPw" required id="pw1"/>
		</div>
		<br />
		<div>
			비밀번호 확인: <input type="password" placeholder="loginPwConfirm" name="loginPwConfirm" required id="pw2"/>
		</div>
		<br />
		<div>
			이름 : <input type="text" placeholder="name" name="name" required/>
		</div>
		<br />
		<button style="text-align:center;" type="submit">회원가입</button>
	</form>
</body>
</html>