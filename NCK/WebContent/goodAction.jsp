<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="nck.NckDAO" %>
<%@ page import="nck.Nck" %>
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
	
String userID = null;

if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
}


	int nckID = 0;
	  if (request.getParameter("nckID") != null)
    {
        nckID = Integer.parseInt(request.getParameter("nckID"));
    }
    Nck nck = new NckDAO().getDetailNck(nckID);

			NckDAO nckDAO = new NckDAO();
			int result = nckDAO.goodupdate2(nckID,
					multipartRequest.getParameter("nckPdName"),multipartRequest.getParameter("nckcTg"),
					multipartRequest.getParameter("nckEx"),filename,fileRealName,
					multipartRequest.getParameter("nckStart"),
					multipartRequest.getParameter("nckUnit"), multipartRequest.getParameter("nckTerm1"),
					multipartRequest.getParameter("nckTerm2"),multipartRequest.getParameter("nckShip"),multipartRequest.getParameter("nckCurrent")
					);
			if (result == - 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글수정에 실패했습니다.')");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'detail.jsp'");
				script.println("</script>");
			}

%>


</body>
</html>