<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	
    User user = new UserDAO().getUser(userID);
			UserDAO userDAO = new UserDAO();
			int result = userDAO.update(request.getParameter("userMbank"), request.getParameter("userAccount"));
	
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'account.jsp'");
				script.println("</script>");
		
		
	


%>
</body>
</html>