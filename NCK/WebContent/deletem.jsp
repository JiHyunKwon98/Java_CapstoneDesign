<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장사용 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 파일을 UTF-8로 -->
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP게시판 웹사이트</title>
</head>
<body>
    <%
		String user = request.getParameter("userID");   
        UserDAO userDAO = new UserDAO();
            
        int result = userDAO.delete(user);
                if(result == -1){ 
                    PrintWriter script = response.getWriter(); //하나의 스크립트 문장을 넣을 수 있도록.
                    script.println("<script>");
                    script.println("alert('회원 삭제에 실패했습니다.')");
                    script.println("history.back()");
                    script.println("</script>");
                }
                else {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("location.href= 'member.jsp'");
                    script.println("</script>");

                }
    %>
</body>
</html> 