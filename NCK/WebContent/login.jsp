<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style type="text/css" content="text/html;">
* { margin: 0; padding: 0; }
body{
	margin: 0 auto;
	width: 600px;
}
.section {
	float: left;
	width: 100%;
} 
#header-area {
	height: 700px;
}
#login-area {
	position: relative;
	text-align: center;
}
.login_img {
	position: relative;
	top: 50%;
	left: 50%;
	margin-left: -275px;
	width: 550px;
}
.login {
	margin: 20px;
	width:500px;
	height:100px;
	font-size:30px;
	border-radius: 16px;
}
.submit {
	background-color: rgb(35, 42, 48);
	border-radius: 10px;
	color: white;
	font-size: 35px;
	margin-top: 40px;
	padding: 25px 40px;
}
.sg {
	margin-top: 40px;
	position: absolute;
	font-size: 40px;
	color: gray;
}
a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
<div id="header-area" class="section">
	<img class="login_img" src="img/login.png">
</div>
<div id="login-area" class="section">
	<form method="post" action="loginAction.jsp"><!--속성 정하기-->
	<input class="login" type="text" name="userID" placeholder=" 아이디"><br>
	<input class="login" type="password" name="userPw" placeholder=" 비밀번호"><br>
	<div>
	<input class="submit" type="submit" value="로그인"><!--이동파일-->
	<br>
	</div>
	</form>
	<p class="sg">회원이 아니신가요? <a id="signup" href="signup.jsp" title="회원가입">회원가입</a></p>
</div>



</body>
</html>