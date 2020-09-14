<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="nck.NckDAO" %>
<%@ page import="nck.Nck" %>
<%@ page import="java.util.ArrayList" %>
<% application.getContextPath(); %>
<% request.getSession().getServletContext().getRealPath("/"); %>
<% application.getRealPath("/register"); %>
<!DOCTYPE html>
<html>
<head>
<meta name=viewport content="width=device-width, initial-scale=1, user-scalable=no" charset="UTF-8">
<title>판매</title>
<style type = "text/css">

* {
font-family: HanSans;}
body {
	margin: 0;
	background-color:white;
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
	position: fixed;
	
}

#mine{
	padding-right:10px; 
	float: right;
	
}
#menu{
	padding-left:10px; 
	float: left;
	
}


#content-area2{
	color:black;
	font-weight: bold;
	padding:10px 5.5px 0px; 
	margin-top:55px;
}

a{
	font-size: small;
}
#box{
	float: center;
	border: solid 0.1px rgb(190, 190, 190);
	display: inline-block;
	width:48%;
	height:240px;
	font-size: 12px;
	text-align: center;
	margin-bottom: 10px;
}

p{
text-align: center;
}
hr{
	border: solid 0.1px rgb(190, 190, 190);
}
.img1{
	float: center;
	width: 170px;
	height:150px;
}
span{
	font-weight: lighter;
}

</style>	

</head>
<body>

<div id="header-area" class="section">
<h2><a href="menu.jsp"><img src="img/menu.png" id="menu" width="35px;" height ="35px;"></a> 
	NCK<a href="mypage.jsp"><img src="img/home.PNG" id="mine" width="38px;" height ="35px;"></a></h2>
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


<div id="content-area2" class="section">

&nbsp; <span> MENU> 경매> 전체보기</span>
<br><br>
	<%
        NckDAO nckDAO = new NckDAO();
        ArrayList<Nck> list = nckDAO.getsaleList(pageNumber);
        
        for(int i = 0; i < list.size(); i++)
           {
     %>
	
		
	<div id="box">
		<img class="img1" src="/NCK/register/<%=list.get(i).getNckImg()%>">
			<br>
			<span><a class="tag" href="detail.jsp?nckID=<%=list.get(i).getNckID()%>">번호&nbsp;<%=list.get(i).getNckID()%></a></span>
			&nbsp;&nbsp;
			<br>
			<span><%=list.get(i).getNckPdName() %></a></span><!--제품명: pdname-->
			<br>
			<span><%=list.get(i).getNckTerm1() %>~<%=list.get(i).getNckTerm2() %></span>
			<br>
			<span>현재가<%=list.get(i).getNckCurrent() %></span><br>
			<span>참여자 &nbsp;<%= list.get(i).getNckHit() %></span>
			
			<br>

		   
</div>

	  <%
           }
       %>
           
		</div>
    
</body>
</html>
