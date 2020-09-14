<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style type="text/css" content="text/html;">
	* { margin: 0; padding: 0; }
	.section {
	float: left;
	width: 100%;
	} 
	#header-area {
		height: 140px;
		background-color: rgb(35, 42, 48);
		
	}
	#header-area h1 {	
		margin: 0 auto;
		text-align: center;
		line-height: 140px;
		color: white;
		width: 400px;
		font-size: 40px;
	}
	.cancel {
		position: absolute;
		top: 35px;
		left: 60px;
		text-decoration: none;
		color: rgb(178, 214, 202);
		font-size: 50px;
		font-weight: bold;
	}
	.submit {
		float: right;
		background-color: rgb(178, 214, 202);
		color: rgb(35, 42, 48);
		border-radius: 20px;
		font-size: 37px;
		font-weight: bold;
		padding: 17px 35px;
	}
	#form-area {
		position: relative;
		margin-left: 40px;
		margin-bottom: 40px;
		font-size: 35px;
		width: 900px;
		font-weight: bold;
	}
	#sg {
		margin-top: 110px;
		margin-left: 30px;
		height:100px;
		font-size:40px;
		border-radius: 16px;
	}
	.sg1 {
		width:400px;
	}
	.sg2 {
		width:700px;
	}
	.sg4 {
		width: 300px;
	}
	.sg5{
		width:500px;
	}
	
</style>
</head>
<body>
<div id="header-area" class="section">
	<h1>회원가입</h1>
	<a class="cancel" href="login.jsp">X</a>
</div>
<div id="form-area" class="section">
	<form method="post" action="signupAction.jsp"><!--속성 정하기-->
	성명  &nbsp; &nbsp; <input id="sg" class="sg1" type="text" name="userName"><br>
	주소  &nbsp; &nbsp; <input id="sg" class="sg2" type="text" name="userAddress"><br>
	E-mail&nbsp; <input id="sg" class="sg5" type="email" name="userEmail"> &nbsp;
	<br>
	계좌 &nbsp; &nbsp;
	<select id="sg" name="userMbank" size="1">
		<option value="국민">국민은행</option>
		<option value="우리">우리은행</option>
		<option value="농협">농협은행</option>
		<option value="신한">신한은행</option>
		<option value="하나">하나은행</option>
		<option value="기업">기업은행</option>
		<option value="카카오">카카오뱅크</option>
	</select>
	<input id="sg" class="sg1" type="text" name="userAccount" placeholder="계좌번호"><br>
	아이디 &nbsp; <input id="sg" class="sg5" type="text" name="userID"><br>
	비밀번호 <input id="sg" class="sg5" type="password" name="userPw"><br>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input id="sg" class="sg5" type="password" name="userPwc" placeholder=" 비밀번호 확인 "><br>
	<input class="submit" type="submit" name="singup" value="완료">
</form>
</div>

</body>
</html>