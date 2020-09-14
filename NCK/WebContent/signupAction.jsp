<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userAddress"/>
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="userMbank"/>
<jsp:setProperty name="user" property="userAccount"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPw"/>
<jsp:setProperty name="user" property="userPwc"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<%
	
	if(user.getUserName() == null || user.getUserAddress() == null || user.getUserEmail() == null || 
			user.getUserMbank() == null || user.getUserAccount() == null || 
			user.getUserID() == null || user.getUserPw() == null || 
			user.getUserPwc() == null ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		UserDAO userDAO = new UserDAO();
		int result = userDAO.signup(user);
		if (result == - 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("</script>");
		}
		else{
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
	}


%>
</body>
</html>