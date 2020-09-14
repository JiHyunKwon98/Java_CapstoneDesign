<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="nck.NckDAO" %>
<%@ page import="nck.Nck" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>


<%
	String userID = null;

   String beEmail = "정보없음";
   String beID = "정보없음";
	int nckID = 0;

	if (request.getParameter("nckID") != null) {
		nckID = Integer.parseInt(request.getParameter("nckID"));
	}
	if (nckID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'detail.jsp'");
		script.println("</script>");
	}
	Nck nck = new NckDAO().getDetailNck(nckID);

	NckDAO nckDAO = new NckDAO();

	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
		beID = (String) session.getAttribute("userID");

		User user = new UserDAO().getUser(userID);
		beEmail = user.getUserEmail();
		
		nckDAO.updateb(nckID, beID, beEmail);

		String num = nck.getNckCurrent();
		int c = Integer.parseInt(num);
		String a = nck.getNckStart();
		int b = 0;
		b += Integer.parseInt(a);
		int e = c - b;
		int sum = b + Integer.parseInt(nck.getNckUnit());

		String d = Integer.toString(e + sum);

		int result = nckDAO.updatep(nckID, d);

		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글수정에 실패했습니다.')");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'detail.jsp'");
			script.println("</script>");
		}

	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}

	int i = nck.getNckHit();
	nckDAO.updateh(nckID, i + 1);
%>

</body>
</html>