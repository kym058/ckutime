<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF-8"%>
<%@ page import="schedule.Schedule"%>
<%@ page import="schedule.ScheduleDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	String lectureID = null;
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
		if (userID == null || lectureID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생했습니다.');");
			script.println("location.href = 'index.jsp';");
			script.println("</script>");
			script.close();
		} else {
			Schedule schedule = new Schedule();
			ScheduleDAO scheduleDAO = new ScheduleDAO();
			schedule.addFromList(scheduleDAO.getList(userID));
			if(!schedule.validate(scheduleDAO.getTime(lectureID))) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('시간표가 중복됩니다.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
			}
			int result = scheduleDAO.insert(userID, lectureID);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('추가에 실패했습니다.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
			} else {
				session.setAttribute("userID", userID);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('성공적으로 추가했습니다.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
			}
		}
	%>
</body>
</html>