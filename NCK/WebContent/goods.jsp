<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="nck.NckDAO" %>
<%@ page import="nck.Nck" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
 <meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0" charset="UTF-8">

<title>물품 관리</title>
<style type = "text/css">

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
<h2> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품목록<a href="admin.jsp"><img src="img/cancle.png" id="back" width="30px;" height ="30px;"></a></h2>
</div>

<%
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
    int pageNumber = 1; // 기본페이지 기본적으로 페이지 1부터 시작하므로
    if (request.getParameter("pageNumber") != null)
    {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
%>

<div id="content-area" class="section">
<table>
	<tr align="center">
		<td id="title">No</td>
		<td id="title">ID</td>
		<td id="title">기간</td>
		<td id="title">제품명</td>
	
	</tr>
	
	<%
        NckDAO nckDAO = new NckDAO();
        ArrayList<Nck> list = nckDAO.getsaleList(pageNumber);
        
        for(int i = 0; i < list.size(); i++)
           {
     %>
	
	<tr align="center">
		<td id="user"><a class="tag" href="gooddetail1.jsp?nckID=<%=list.get(i).getNckID()%>"><%=list.get(i).getNckID()%></a></td>
		<td id="user"><%=list.get(i).getUserID() %></td>
		<td id="user"><%=list.get(i).getNckTerm1() %>-<%=list.get(i).getNckTerm2() %></td>
		<td id="user"><%=list.get(i).getNckPdName() %></td>
	
	</tr>
	
	<%
           }
       %>
</table>
</div>

</body>
</html>
