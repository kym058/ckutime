<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="schedule.Schedule"%>
<%@ page import="schedule.ScheduleDAO"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- 기본 설정 -->
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>CKU타임</title>
		<!-- 디자인 파일 로딩 -->
		<link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;amp;lang=en" rel="stylesheet">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" rel="stylesheet">
		<link href="styles/main.css" rel="stylesheet">
		<link href="css/bootstrap.css" rel="stylesheet">
		<link rel="stylesheet" href="styles/custom.css">
	</head>
	<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		script.close();		
	}
	Schedule schedule = new Schedule();
	ScheduleDAO scheduleDAO = new ScheduleDAO();
	schedule.addFromList(scheduleDAO.getList(userID));
%>	
<!-- 내비게이션 바 -->
		<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
			<a href="schedule.jsp" id="contact-button" class="mdl-button mdl-button--fab mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-color--accent mdl-color-text--accent-contrast mdl-shadow--4dp">
				<i class="material-icons">event</i>
			</a>
			<header class="mdl-layout__header mdl-layout__header--waterfall site-header">
			<div class="mdl-layout__header-row site-logo-row">
				<span class="mdl-layout__title">
					<div class="site-logo"></div>
					<span class="site-description"><h4>CKU타임</h4></span>
				</span>
			</div>
			<div class="mdl-layout__header-row site-navigation-row mdl-layout--large-screen-only">
				<nav class="mdl-navigation mdl-typography--body-1-force-preferred-font">
					<a class="mdl-navigation__link" href="index.jsp">메인</a>
					<a class="mdl-navigation__link" href="edit.jsp">시간표 관리</a>
					<a class="mdl-navigation__link" href="schedule.jsp">내 시간표</a>
<%
	if(userID == null) {
%>					
					<a class="mdl-navigation__link" href="login.jsp">로그인</a>
					<a class="mdl-navigation__link" href="join.jsp">회원가입</a>
<%
	} else {
%>
					<a class="mdl-navigation__link" href="logoutAction.jsp">로그아웃</a>
<%
	}
%>
				</nav>
			</div>
		</header>
		<div class="mdl-layout__drawer mdl-layout--small-screen-only">
			<nav class="mdl-navigation mdl-typography--body-1-force-preferred-font">
					<a class="mdl-navigation__link" href="index.jsp">메인</a>
					<a class="mdl-navigation__link" href="edit.jsp">시간표 관리</a>
					<a class="mdl-navigation__link" href="schedule.jsp">내 시간표</a>
<%
	if(userID == null) {
%>					
					<a class="mdl-navigation__link" href="login.jsp">로그인</a>
					<a class="mdl-navigation__link" href="join.jsp">회원가입</a>
<%
	} else {
%>
					<a class="mdl-navigation__link" href="logoutAction.jsp">로그아웃</a>
<%
	}
%>
			</nav>
		</div>
		<div class="mdl-layout__content">
		<div class="site-content">
			<div class="mdl-grid site-max-width">
				<div
					class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--4dp page-content">
					<div class="mdl-card__title">
						<h3 class="mdl-card__title-text">내 시간표</h3>
					</div>
					<table class="table table-striped table-hover table-bordered" style="text-align: center;">
						<thead>	
							<tr>
								<th style="background-color: #3E4EB8; text-align: center; color: #ffffff"></th>
								<th style="background-color: #3E4EB8; text-align: center; color: #ffffff">월</th>
								<th style="background-color: #3E4EB8; text-align: center; color: #ffffff">화</th>
								<th style="background-color: #3E4EB8; text-align: center; color: #ffffff">수</th>
								<th style="background-color: #3E4EB8; text-align: center; color: #ffffff">목</th>
								<th style="background-color: #3E4EB8; text-align: center; color: #ffffff">금</th>
								<!-- <th style="background-color: #3E4EB8; text-align: center; color: #ffffff">금</th> -->
							</tr>
						</thead>
						<tbody>
<%
							for(int i = 0; i <= 13; i++) {
%>
							<tr>
								<td><%out.print((i + 0) + "");%></td>
								<td><%if(schedule.mondayList[i].equals("X"))
										out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
									  else 
										out.print("<a onclick=\"return confirm('삭제하시겠습니까?')\" href='deleteAction.jsp?lectureID=" + schedule.mondayListID[i] + "'>" + schedule.mondayList[i] + "</a>");%></td>
								<td><%if(schedule.tuesdayList[i].equals("X"))
										out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
									  else 
										out.print("<a onclick=\"return confirm('삭제하시겠습니까?')\" href='deleteAction.jsp?lectureID=" + schedule.tuesdayListID[i] + "'>" + schedule.tuesdayList[i] + "</a>");%></td>
								<td><%if(schedule.wendesdayList[i].equals("X"))
										out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
									  else 
										out.print("<a onclick=\"return confirm('삭제하시겠습니까?')\" href='deleteAction.jsp?lectureID=" + schedule.wendesdayListID[i] + "'>" + schedule.wendesdayList[i] + "</a>");%></td>
								<td><%if(schedule.thursdayList[i].equals("X"))
										out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
									  else 
										out.print("<a onclick=\"return confirm('삭제하시겠습니까?')\" href='deleteAction.jsp?lectureID=" + schedule.thursdayListID[i] + "'>" + schedule.thursdayList[i] + "</a>");%></td>
								<td><%if(schedule.fridayList[i].equals("X"))
										out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
									  else 
										out.print("<a onclick=\"return confirm('삭제하시겠습니까?')\" href='deleteAction.jsp?lectureID=" + schedule.fridayListID[i] + "'>" + schedule.fridayList[i] + "</a>");%></td>
								<!-- <td><%if(schedule.saturdayList[i].equals("X"))
										out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
									  else 
										out.print("<a onclick=\"return confirm('삭제하시겠습니까?')\" href='deleteAction.jsp?lectureID=" + schedule.saturdayListID[i] + "'>" + schedule.saturdayList[i] + "</a>");%></td> -->
							</tr>
<%
							}
%>
						</tbody>
					</table>
					&nbsp;(총 학점: <%= schedule.total %>학점)<br>
					<form method="get" action="allDeleteAction.jsp">
						&nbsp;
						<a
							class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"
							onclick="return confirm('신청한 모든 강의를 삭제하시겠습니까?')" href="allDeleteAction.jsp">초기화</a>
					</form>	
				</div>
			</div>
		</div>
		<!-- 푸터 정보 -->
		<footer class="mdl-mini-footer">
			<div class="footer-container">
				<div class="mdl-logo">
					개발 관련 피드백: cosltkfkd@naver.com
				</div>
			</div>
		</footer>
		<script src="https://code.getmdl.io/1.3.0/material.min.js" defer></script>
	</div>
</body>
</html>