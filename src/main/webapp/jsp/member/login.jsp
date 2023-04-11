<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

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
	
	
	JoinForm__submitDone = true;
	form.submit();
}
</script>

<body>
	<div><a style="color:green" href="../article/list">리스트로 돌아가기</a></div>
	<h1 style="border: 2px solid black; text-align:center; margin:10px 750px;">로그인</h1>
	
	<form style="border: 2px solid black; text-align:center; padding: 50px 0; margin:10px 750px;" method="post" action="doLogin" onsubmit="JoinForm__submit(this); return false;">
		<div>
			아이디 : <input type="text" placeholder="loginId" name="loginId" autocomplete="on"/>
		</div>
		<br />
		<div>
			비밀번호 : <input type="password" placeholder="loginPw" name="loginPw"/>
		</div>
		
		<button style="text-align:center; padding: 0 15px; margin-top:20px;" type="submit">로그인</button>
	</form>
</body>
</html>