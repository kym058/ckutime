<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="schedule.ScheduleDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String lectureID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(request.getParameter("lectureID") != null) {
		lectureID = (String) request.getParameter("lectureID");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CKU타임</title>
</head>
<body>
	<%
		ScheduleDAO scheduleDAO = new ScheduleDAO();
		int result = scheduleDAO.delete(userID, lectureID);
		if (result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='schedule.jsp'");
			script.println("</script>");
			script.close();
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제에 실패했습니다.');");
			script.println("location.href='index.jsp'");
			script.println("</script>");
			script.close();
		}
	%>
</body>
</html>