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
	.home_img {
		position: absolute;
		top: 30px;
		left: 30px;
		width: 85px;
	}
	.back_img {
		position: absolute;
		top: 25px;
		right: 20px;
		width: 100px;
	}
	#acc-area {
		position: absolute;
		margin-bottom: 50px;
		width: 600px; height: 370px;
		left: 18%;
		top: 20%;
		font-size: 50px;
	}
	.af1 {
		margin: 0 auto;
		width: 150px;
	}
	.af {
		position: absolute;
		background-color: rgb(178, 214, 202);
		border-color: rgb(178, 214, 202);
		color: rgb(35, 42, 48);
		border-radius: 20px;
		font-size: 37px;
		font-weight: bold;
		text-align: center;
		padding: 17px 30px;
		width: 100px;
		bottom: 0;
	}
	.ac {
		margin: 20px;
	}
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
	<h1>내 계좌</h1>
	<a href="main.jsp"><img class="home_img" src="img/home.PNG"></a>
	<a href="javascript:history.go(-1)"><img class="back_img" src="img/back.png"></a>
</div>


<div id="acc-area" class="section">
	<p class="ac"><% if( user != null){ %><%=user.getUserMbank()%> <%}%></p>
	<p class="ac"><% if( user != null){ %><%= user.getUserAccount() %> <%}%></p>
	<div class="af1"><a href="account_f.jsp"><input class="af" type="botton" value="수정"></a></div>
</div>

</body>
</html>