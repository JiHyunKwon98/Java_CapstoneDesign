<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="nck.Nck" %>
<%@ page import="nck.NckDAO" %> 
<% application.getContextPath(); %>
<% request.getSession().getServletContext().getRealPath("/re/register/"); %>
<% application.getRealPath("/register"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품상세</title>

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
	.menu_img {
		position: absolute;
		top: 40px;
		left: 30px;
		width: 85px;

	}
	.back_img {
		position: absolute;
		top: 25px;
		right: 50px;
		background-color: rgb(178, 214, 202);
		color: rgb(35, 42, 48);
		border-radius: 20px;
		font-size: 37px;
		font-weight: bold;
		padding: 17px 35px;
		text-decoration:none;
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
		top: 140px;
		width: 100%;
		padding-bottom: 20px;
	}
	#info {
		text-align: center;
		font-size: 38px;
	}
	.pd_img {
		height: 700px; 
		padding-top:50px;
		margin:0,50px;
	}
	.pdname {
		font-weight: bold;
		padding-bottom: 40px;
		border-bottom: 2px solid gray;
	}
	table {
		padding: 10px;
		width: 100%;
		height: 400px;
		font-size: 38px;
	}
	.term1, .term2, .term {
		float: left;
	}
	#ex {
		padding: 30px;
		font-size: 38px;
	}
	#ex p {
		padding: 10px 0;
	}
	.fixedA {
		position: fixed;
		width:530px;
		margin: 9px;
		height: 160px;
		font-size: 38px;
		bottom: 0; left: 0;
		box-shadow: 0px 5px 10px gray;
		border-radius: 20px 0 0 20px;
		background-color: rgb(178, 214, 202);
	}
	.fixedB {
		position: fixed;
		width: calc(100% - 550px);
		margin: 9px;
		height: 160px;
		font-size: 38px;
		bottom: 0; right: 0;
		box-shadow: 5px 5px 10px gray;
		border-radius: 0 20px 20px 0;
		background-color: rgb(178, 214, 202);
	}
	.prinow {
		padding:50px 25px;
		border-right: 2px solid rgb(58, 58, 58);
	}
	#ps {
		padding-top: 10px;
		color: rgb(192, 57, 43);
	}
	#pn {
		font-size: 50px;
	}
	.unit {
		font-size: 50px;
		padding:50px 25px;
	}
	input.up_img {
		position: absolute;
		top: 0;
		right: 0;
		width: 90px; height: 90px;
		border: none;
		padding:35px 20px;
	}
	#price{
		width:80%; height:90px;
		line-hegit:90px;
		font-size:40px;
		background-color: rgb(178, 214, 202);
		border: none;
	}
	#p{
	 text-decoration:none;
	 color:black;
	}
.su{
		color:rgb(178, 214, 202);
	}
</style>
</head>
<body>

	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int nckID = 0;
		if(request.getParameter("nckID") != null){
			try{
				nckID = Integer.parseInt(request.getParameter("nckID"));
			}catch(NumberFormatException e){
				nckID = 100;
			}
		}
		if(nckID==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'detail.jsp'");
			script.println("</script>");
		}
		
		Nck nck = new NckDAO().getDetailNck(nckID);	
		
	
	%>

<div id="header-area" class="section">
	<h1>NCK</h1>
	<a href="menu.jsp"><img class="menu_img" src="img/home.PNG"></a>
	<a href="gooddetail.jsp?nckID=<%= nckID %>" class="back_img">수정</a>
</div>
<div id="dt-area" class="section">
	<div id="info">
		<img class="pd_img" src="/NCK/register/<%=nck.getNckImg()%>">
		<p class="pdname"><%=nck.getNckPdName()%></p><!--제품명: pdname-->
	</div>
	<div id="info">
		<table border="1">
			<tr>
			<td>기간</td><td><p class="term1"><%=nck.getNckTerm1()%></p><!--경매기간1: term1-->
			<p class="term"> ~ </p>
			<p class="term2"><%= nck.getNckTerm2() %></p><!--경매기간2: term2--></td>
		</tr>
			<tr>
			<td>시작가</td><td><p class="term"><%= nck.getNckStart() %></p><!--시작가: start--><p class="term">&nbsp;원</p></td>
		</tr>
			<tr>
			<td>입찰 단위</td><td><p class="term"><%= nck.getNckUnit() %></p><!--입찰단위: unit--><p class="term">&nbsp;원</p></td>
		</tr>
			<tr>
			<td>참여자 수</td><td>
			<p class="term" id="n"><%= nck.getNckHit() %></p><!--참여자: part--><p class="term">&nbsp;명</p></td>
		</tr>
		</table>
	</div>
	<div id="ex">
		<p>상세 설명</p><!--상세 설명: ex-->
		<br>
		<pre>
<%= nck.getNckEx() %>
		</pre>
	</div>
	<div id="ex">
		<p>배송</p><!--배송: ship-->
		<p><%= nck.getNckShip() %></p>
		<br>
		<p>판매자 정보</p>
		<p class="term">ID</p><pre class="term"></pre><p><%= nck.getUserID() %></p><!--id: id-->
		<p class="term">e-mail &nbsp;</p><p><%= nck.getUserEmail() %></p><!--e-mail: em-id,e-mail-->
		<br><br><br>
	</div>
	<div class="fixedA">
		<div class="prinow">
			<p class="term" id="ps">현재가 &nbsp;</p>
			<p class="term" id="pn"><%= nck.getNckCurrent()%></p><!--현재가: now--><p id="pn">&nbsp; 원</p>
		</div>
	</div>
	<div class="fixedB">
      <div class="unit">
         <p class="term">
         
         <form method="post" action="updatepAction.jsp?nckID=<%=nckID%>">
               
         <a href="detail.jsp?nckID=<%=nckID %>" id="p"><%= nck.getNckUnit()%>
		<input type="image" class="up_img" name="up" src="img/up.png"></a>
         </form>
         
      </div>
   </div>

</div>

</body>
</html>