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
  <title>메인</title>
  <meta name=viewport content="width=device-width, initial-scale=1, user-scalable=no" charset="UTF-8">
<style>

* {
font-family: HanSans;}
body {
   margin: 0;
   background-color:rgb(35, 42, 48);
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

#footer-area{
   height: 100%;
   color: rgb(224, 224, 224);
   text-align: center;
   font-weight: bold;
}

#content-area1{
   margin-top:55px;
   background-size: 100%;
   height:195px;
   background-repeat: no-repeat;
   background-position:0px 50%;
   background-image: url('img/event.png');
   }

#content-area2{
   color: white;
   font-weight: bold;
   padding:10px 0; 
}

a{
   font-size: small;
   color: white;
   text-decoration: none;
}
#box{
   display: inline-block;
   width:31%;
   height:110px;
   padding-top:30px;
   font-size: 12px;
   text-align: center;
}
p{
text-align: center;
}
hr{
   border: solid 0.1px rgb(190, 190, 190);
}
.img1{
   float: center;
   width:90%;
   height:100%;
   padding-left:12px;
}
.a {
   padding: 10px;
}

</style>


</head>
<body>

<div id="header-area" class="section">
<h2><a href="menu.jsp"><img src="img/menu.png" id="menu" width="35px;" height ="35px;"></a> 
   NCK<a href="mypage.jsp"><img src="img/mine.png" id="mine" width="38px;" height ="35px;"></a></h2>
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
<div id="content-area1" class="section">

</div>

<div id="content-area2" class="section">
   <div class="a">
   &nbsp;TOP6
   <div class="container">
      
   <%
        NckDAO nckDAO = new NckDAO();
        ArrayList<Nck> list = nckDAO.getmains(pageNumber);
        
        for(int i = 0; i < list.size(); i++)
           {
     %>

            <div id="box">
               <img src="/NCK/register/<%=list.get(i).getNckImg()%>" class="img1">
               <a class="tag" href="detail.jsp?nckID=<%=list.get(i).getNckID()%>">
               <p><%=list.get(i).getNckPdName() %></p></a>
               <hr>
               <span>현재가&nbsp;
               &nbsp;&nbsp;<%=list.get(i).getNckCurrent() %></span>
               <br>
               <span><%=list.get(i).getNckTerm1() %><!--경매기간1: term1-->~
               <%=list.get(i).getNckTerm2() %><!--경매기간2: term2--></span>
               <hr>
            </div>
              <%
           }
       %>
         </div>
   </div>
</div>


<div id="footer-area" class="section">
   <br>
   NCK
   <br>
   <a>서비스 이용 약관 | 개인정보 처리방침</a>
   <p>   </p>
</div>

</body>
</html>