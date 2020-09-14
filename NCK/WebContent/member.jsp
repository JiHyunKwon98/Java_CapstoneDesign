<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name=viewport content="width=device-width, initial-scale=1, user-scalable=no">
<title>회원목록</title>

<style type="text/css" content="text/html;">

* {
font-family: HanSans;}
body {
	margin: 0;
}
.section {
	float: left;
	width: 100%;
} 

#header-area h2{
	text-align: left;
	color: rgb(255, 255, 255);
	float: left;
	width: 100%;	
	height: 30px;
	margin: 12px 0px;
	line-height:30px;
	text-align: center;
	font-size: large;
	}


#header-area{
	background-color:rgb(35, 42, 48);
	float: left;
	
}

#back{
	margin-right:10px; 
	float: right;
	
}

#footer-area{
	height: 100%;
}
 
table{
    margin-left:auto; 
    margin-right:auto;
    text-align: center;
    line-height: 1.5;
    border: 1px solid #ccc;
    width:100%;
    border-collapse: collapse;
 
}
    
   
 #title{
    
	
    padding:5px;
    vertical-align: top;
    background-color:rgb(224, 224, 224);
    }
 #user{
     vertical-align: top;
  font-size: small;
 	padding:5px;
    }

a{
	text-decoration:none;
	color:black;
}
</style>

</head>
<body>


<div id="header-area" class="section">
<h2> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원목록<a href="admin.jsp"><img src="img/cancle.png" id="back" width="30px;" height ="30px;"></a></h2>
</div>



<div id="content-area" class="section">
<table>
	<tr align="center">
		<td id="title">name</td>
		<td id="title">ID</td>
		<td id="title">e-mail</td>
		<td id="title">rm</td>
	</tr>
	
	<%
    String userID = null;
    // 로그인 된 사람은 회원가입페이지에 들어갈수 없다
    if(session.getAttribute("userID") != null )
    {
        userID = (String) session.getAttribute("userID");
    }
    int pageNumber = 1; // 기본페이지 기본적으로 페이지 1부터 시작하므로
    if (request.getParameter("pageNumber") != null)
    {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
%>
	<%
	
	// 기본페이지 기본적으로 페이지 1부터 시작하므로
        UserDAO userDAO = new UserDAO();
        ArrayList<User> list = userDAO.getuserList(pageNumber);
        
        for(int i = 0; i < list.size(); i++)
           {
     %>
	<tr align="center">
		<td id="user"><%=list.get(i).getUserName()%></td>
		<td id="user"><%=list.get(i).getUserID() %></td>
		<td id="user"><%=list.get(i).getUserEmail() %></td>
		<td id="user"><a href='deletem.jsp?userID=<%=list.get(i).getUserID()%>'>x</a></td>
	
	</tr>
	
	<%
           }
       %>
</table>
</div>

</body>
</html>