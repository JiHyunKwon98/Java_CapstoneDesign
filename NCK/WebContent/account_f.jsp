<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>

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
		right: 60px;
		text-decoration: none;
		color: rgb(178, 214, 202);
		font-size: 50px;
		font-weight: bold;
	}
	#acc-area {
		position: absolute;
		margin-bottom: 50px;
		width: 650px; height: 500px;
		left: 15%;
		top: 20%;
		font-size: 50px;
	}
	.af1 {
		margin: 0 auto;
		width: 200px;
	}
	.af {
		position: absolute;
		background-color: rgb(178, 214, 202);
		color: rgb(35, 42, 48);
		border-radius: 20px;
		font-size: 37px;
		font-weight: bold;
		text-align: center;
		padding: 17px 30px;
		width: 160px;
		bottom: 0;
	}
	.ac {
		width: 650px;
	}
	#sg {
		margin-top: 40px;
		height:100px;
		font-size:40px;
		border-radius: 16px;
		background-color: white;
	}s
</style>
</head>
<body>
 <%

 	String userID = null;
	if (session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");

	}
	 User user = new UserDAO().getUser(userID);
    %>

<div id="header-area" class="section">
	<h1>계좌 수정</h1>
	<a class="cancel" href="account.jsp">X</a>
</div>
<div id="acc-area" class="section">
 <form method="post" action="updateAction.jsp?userID=<%=userID%>">
	<select id="sg" name="userMbank" size="1">
		<option value="국민">국민은행</option>
		<option value="우리">우리은행</option>
		<option value="농협">농협은행</option>
		<option value="신한">신한은행</option>
		<option value="하나">하나은행</option>
		<option value="기업">기업은행</option>
		<option value="카카오">카카오뱅크</option>
	</select>
	<input id="sg" class="ac" type="text" name="userAccount" placeholder=" 계좌번호"><br>
	<div class="af1"><input class="af" type="submit" value="완료"></div>
	</form>
	
	

		
</div>

</body>
</html>