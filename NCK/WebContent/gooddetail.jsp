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
	#set {
		margin-top: 60px;
		margin-left: 30px;
		font-size:40px;
		border-radius: 16px;
	}
	.sg1 {
		width:250px;
		height:100px;
	}
	.sg2 {
		width:300px;
		height:100px;
	}
	.sg3 {
		border: 50px;
		font-size: 30px;
	}
	.sg4 {
		width: 500px;
		height:100px;
	}
	.sg5{
		width:700px;
	}
</style>
</head>
<body>

	
<%
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
    if (userID == null)
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 하세요')");
        script.println("location.href = 'login.jsp'");
        script.println("</script>");
    }
    int nckID = 0;
    if (request.getParameter("nckID") != null)
    {
        nckID = Integer.parseInt(request.getParameter("nckID"));
    }
    if (nckID == 0)
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'detail.jsp'");
        script.println("</script>");
    }
    Nck nck = new NckDAO().getDetailNck(nckID);
    
%>


<div id="header-area" class="section">
	<h1>물품관리</h1>
	<a class="cancel" href="admin.jsp">X</a>
	
</div>



<div id="form-area" class="section">

	<form method="post" action="goodAction.jsp?nckID=<%=nckID%>" enctype="multipart/form-data" ><!--속성 정하기-->
	카테고리 
	<select id="set" class="sg1" name="nckcTg" size="1" placeholder="<%=nck.getNckcTg()%>"><!--항목이름 정하기-->
		<option value="미술품">미술품</option>
		<option value="골동품">골동품</option>
		<option value="수집품">수집품</option>
		<option value="토이">토이</option>
		<option value="기타">기타</option>
	</select><br>
	
	제품명 &nbsp;&nbsp; <input id="set" class="sg4" type="text" name="nckPdName" placeholder="<%=nck.getNckPdName()%>"><br>
	상세설명 <textarea id="set" class="sg5" name="nckEx" cols="35" rows="8" placeholder="<%=nck.getNckEx()%>"></textarea><br>
	이미지 <input id="set" class="sg5" type="file" name="file"><br>
	시작가  &nbsp;&nbsp; <input id="set" class="sg4" type="text" name="nckStart" placeholder="<%=nck.getNckStart()%>"> 원<br>
	현재가  &nbsp;&nbsp; <input id="set" class="sg4" type="text" name="nckCurrent" placeholder="<%=nck.getNckCurrent()%>" >원<br> *시작가와 동일한 금액 입력 <br>
	입찰단위 <input id="set" class="sg4" type="text" name="nckUnit"  placeholder="<%=nck.getNckUnit()%>" ><br>
	경매기간 <input id="set" class="sg2" type="date" name="nckTerm1" placeholder="<%=nck.getNckTerm1()%>">
	&nbsp; ~<input id="set" class="sg2" type="date" name="nckTerm2" placeholder="<%=nck.getNckTerm2()%>"><br><br>
	배송  &nbsp; &nbsp; 
	<input id="set" class="sg3" type="checkbox" name="nckShip" value="택배" style="width:50px;height:50px;margin-top:30px;"> 택배
	<input id="set" type="checkbox" name="nckShip" value="우편" style="width:50px;height:50px;margin-top:30px;"> 우편
	<input id="set" type="checkbox" name="nckShip" value="협의" style="width:50px;height:50px;margin-top:30px;"> 협의
	<br>
	
	<input class="submit" type="submit" name="register" value="완료">
	
</form>
</div>


</body>
</html>