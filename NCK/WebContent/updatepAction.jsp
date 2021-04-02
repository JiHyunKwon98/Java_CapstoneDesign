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

		//현재가
		String num = nck.getNckCurrent();
		// String형인  현재가를 int형으로 저장하는 변수 선언   
		int currentCost = Integer.parseInt(num);
		 
		//시작가 
		String startCost = nck.getNckStart();
		
		// String형인  시작가를 int형으로 누적해서 저장하는 변수 선언   
		int startNumCost = 0;
		startNumCost += Integer.parseInt(startCost);
		
		// 현재가 - 시작가  = 오르는 단위 
		int unitCost = currentCost - startNumCost;
		
		// sum = 시작가 + 오르는 단위 
		int sum = startNumCost + Integer.parseInt(nck.getNckUnit());
		
		// 최종 가격 = 현재가 - 시작가  + 시작가  + 오르는 단위  
		String finalCost = Integer.toString(unitCost + sum);

		int result = nckDAO.updatep(nckID, finalCost);

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