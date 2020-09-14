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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매</title>
<style type = "text/css">
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
	.pres {
		position: absolute;
		font-size: 40px;
		padding: 40px 0;
		width: 100%;
		height: 50px;
		top: 140px;
		border-bottom: 2px solid gray;
	}
	#dt-area {
		position: absolute;
		top: 272px;
		width: 100%;
		padding-bottom: 20px;
	}
	#dts {
		padding: 35px 0;
		height: 620px;
		border-bottom: 2px solid gray;
	}
	.sl {
		float: right;
		width: 570px;
		font-size: 38px;
	}
	.sl p{
		padding-bottom: 10px;
	}
	.term1, .term {
		float: left;
	}
	.pd_img {
		width: 340px; 
		height:100%;
		padding: 0 20px;
	}
	.pdname {
		font-weight: bold;
	}
	.tag{
		text-decoration:none;
		 color: #000000;
	}
</style>	
</head>
<body>
<div id="header-area" class="section">
	<h1>판매</h1>
	<a href="main.jsp"><img class="home_img" src="img/home.PNG"></a>
	<a href="javascript:history.go(-1)"><img class="back_img" src="img/back.png"></a><!--이미지: pdimg-->
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

<div class="pres">&nbsp; 판매 현황</div>
<div id="dt-area" class="section">
	<%
        NckDAO nckDAO = new NckDAO();
        ArrayList<Nck> list = nckDAO.getsaleList(pageNumber);
        
        for(int i = 0; i < list.size(); i++)
           {
     %>
	
	<div id="dts">
	
		<img class="pd_img" src="/NCK/register/<%=list.get(i).getNckImg()%>">
		
		<div class="sl">
			<span><a class="tag" href="detail.jsp?nckID=<%=list.get(i).getNckID()%>">번호&nbsp;<%=list.get(i).getNckID()%></a></span>
			<p class="pdname"><%=list.get(i).getNckPdName() %></a></p><!--제품명: pdname-->
			<p class="term1"><%=list.get(i).getNckTerm1() %></p><!--경매기간1: term1-->
			<p class="term"> ~ </p>
			<p class="term2"><%=list.get(i).getNckTerm2() %></p><!--경매기간2: term2-->
			<p class="term">시작가 &nbsp;</p><p class="term"><%=list.get(i).getNckStart() %></p><!--시작가: start--><p>&nbsp;원</p>
			<p class="term">현재가 &nbsp;</p><p class="term"><%=list.get(i).getNckCurrent() %></p><!--현재가: now--><p>&nbsp;원</p>
			<p class="term">참여자 &nbsp;</p><p class="term"><%= list.get(i).getNckHit() %></p><!--참여자: part--><p id="count">&nbsp;명</p>
			<p class="term">상태 &nbsp; &nbsp;</p><p>진행중</p><!--상태: state-->
			<br>
			<p>낙찰자 정보</p>
			<p class="term">ID &nbsp;</p> <p><%=list.get(i).getbID() %></p>
			<p class="term">E-mail &nbsp;</p><p> <%=list.get(i).getBemail() %></p>
		</div>
		   
	</div>

	  <%
           }
       %>
           
	
</div>



    
</body>
</html>
