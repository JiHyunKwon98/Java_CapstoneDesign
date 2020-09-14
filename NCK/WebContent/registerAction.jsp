<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="nck.NckDAO" %>
<%@ page import="nck.Nck" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%

String directory = application.getRealPath("../re/register/");
int maxSize = 1024*1024*100;
String encoding = "UTF-8";

MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());

String filename = multipartRequest.getOriginalFileName("file");
String fileRealName = multipartRequest.getFilesystemName("file");

   String cTg = multipartRequest.getParameter("nckcTg");
   String Title = multipartRequest.getParameter("nckPdName");
   String Ex = multipartRequest.getParameter("nckEx");
   String Start = multipartRequest.getParameter("nckStart");
   String Unit = multipartRequest.getParameter("nckUnit");
   String T1 = multipartRequest.getParameter("nckTerm1");
   String T2 = multipartRequest.getParameter("nckTerm2");
   String Ship = multipartRequest.getParameter("nckShip");
   //String Mail = multipartRequest.getParameter("userEmail");
   String Mail = null;
   String Current = multipartRequest.getParameter("nckCurrent");
   String userID = null;
   String beID = "정보없음";
   String beEmail= "정보없음";
   
   if(session.getAttribute("userID") != null){
      userID = (String) session.getAttribute("userID");
      User user = new UserDAO().getUser(userID);
      Mail = user.getUserEmail();
   }

   if(userID == null){
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('로그인을 하세요.')");
      script.println("location.href = 'login.jsp'");
      script.println("</script>");
   }else{
      int nckID = 0;
        if (request.getParameter("nckID") != null)
       {
           nckID = Integer.parseInt(request.getParameter("nckID"));
       }
          Nck nck = new NckDAO().getDetailNck(nckID);

               NckDAO nckDAO = new NckDAO();
               int result = nckDAO.register( userID, Mail,Title, cTg, 
                     Ex,filename,fileRealName, Start, Unit, 
                     T1, T2, Ship , Current, beID, beEmail);
         if (result == - 1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('글쓰기에 실패했습니다.')");
            script.println("</script>");
         }
         else{
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'detail.jsp'");
            script.println("</script>");
         }
      
   }
   


%>
</body>
</html>