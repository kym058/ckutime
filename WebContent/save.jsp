<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
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
		<main class="mdl-layout__content">
		<div class="site-content">
			<div class="container">
				<div class="mdl-grid site-max-width">
					<div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
						<div class="mdl-card__media">
							<img class="article-image" src="img/portfolio1.jpg" border="0"
								alt="">
						</div>
						<div class="mdl-card__title">
							<h2 class="mdl-card__title-text">Rocky Peak</h2>
						</div>
						<div class="mdl-card__supporting-text">Enim labore aliqua
							consequat ut quis ad occaecat aliquip incididunt. Sunt nulla eu
							enim irure enim nostrud aliqua consectetur ad consectetur sunt..
						</div>
						<br>
						<div class="mdl-card__actions mdl-card--border">
							<a
								class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent"
								href="portfolio-page.html"> Learn More </a>
						</div>
					</div>
					<div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
						<div class="mdl-card__media">
							<img class="article-image" src="img/portfolio2.jpg" border="0"
								alt="">
						</div>
						<div class="mdl-card__title">
							<h2 class="mdl-card__title-text">Night Shadow</h2>
						</div>
						<div class="mdl-card__supporting-text">Enim labore aliqua
							consequat ut quis ad occaecat aliquip incididunt. Sunt nulla eu
							enim irure enim nostrud aliqua consectetur ad consectetur sunt..
						</div>
						<br>
						<div class="mdl-card__actions mdl-card--border">
							<a
								class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent"
								href="portfolio-page.html"> Learn More </a>
						</div>
					</div>
					<div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
						<div class="mdl-card__media">
							<img class="article-image" src="img/portfolio3.jpg" border="0"
								alt="">
						</div>
						<div class="mdl-card__title">
							<h2 class="mdl-card__title-text">Sky Reach</h2>
						</div>
						<div class="mdl-card__supporting-text">Enim labore aliqua
							consequat ut quis ad occaecat aliquip incididunt. Sunt nulla eu
							enim irure enim nostrud aliqua consectetur ad consectetur sunt..
						</div>
						<br>
						<div class="mdl-card__actions mdl-card--border">
							<a
								class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent"
								href="portfolio-page.html"> Learn More </a>
						</div>
					</div>
					<br>
					<div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
						<div class="mdl-card__media">
							<img class="article-image" src="img/portfolio4.jpg" border="0"
								alt="">
						</div>
						<div class="mdl-card__title">
							<h2 class="mdl-card__title-text">Pencil Tip</h2>
						</div>
						<div class="mdl-card__supporting-text">Enim labore aliqua
							consequat ut quis ad occaecat aliquip incididunt. Sunt nulla eu
							enim irure enim nostrud aliqua consectetur ad consectetur sunt..
						</div>
						<br>
						<div class="mdl-card__actions mdl-card--border">
							<a
								class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent"
								href="portfolio-page.html"> Learn More </a>
						</div>
					</div>
					<br>
					<div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
						<div class="mdl-card__media">
							<img class="article-image" src="img/portfolio5.jpg" border="0"
								alt="">
						</div>
						<div class="mdl-card__title">
							<h2 class="mdl-card__title-text">Magic Leaves</h2>
						</div>
						<div class="mdl-card__supporting-text">Enim labore aliqua
							consequat ut quis ad occaecat aliquip incididunt. Sunt nulla eu
							enim irure enim nostrud aliqua consectetur ad consectetur sunt..
						</div>
						<br>
						<div class="mdl-card__actions mdl-card--border">
							<a
								class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent"
								href="portfolio-page.html"> Learn More </a>
						</div>
					</div>
					<br>
					<div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
						<div class="mdl-card__media">
							<img class="article-image" src="img/portfolio6.jpg" border="0"
								alt="">
						</div>
						<div class="mdl-card__title">
							<h2 class="mdl-card__title-text">Water Flow</h2>
						</div>
						<div class="mdl-card__supporting-text">Enim labore aliqua
							consequat ut quis ad occaecat aliquip incididunt. Sunt nulla eu
							enim irure enim nostrud aliqua consectetur ad consectetur sunt..
						</div>
						<br>
						<div class="mdl-card__actions mdl-card--border">
							<a
								class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent"
								href="portfolio-page.html"> Learn More </a>
						</div>
					</div>
					<br>
					<div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
						<div class="mdl-card__media">
							<img class="article-image" src="img/portfolio7.jpg" border="0"
								alt="">
						</div>
						<div class="mdl-card__title">
							<h2 class="mdl-card__title-text">Lonely Bridge</h2>
						</div>
						<div class="mdl-card__supporting-text">Enim labore aliqua
							consequat ut quis ad occaecat aliquip incididunt. Sunt nulla eu
							enim irure enim nostrud aliqua consectetur ad consectetur sunt..
						</div>
						<br>
						<div class="mdl-card__actions mdl-card--border">
							<a
								class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent"
								href="portfolio-page.html"> Learn More </a>
						</div>
					</div>
					<br>
					<div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
						<div class="mdl-card__media">
							<img class="article-image" src="img/portfolio8.jpg" border="0"
								alt="">
						</div>
						<div class="mdl-card__title">
							<h2 class="mdl-card__title-text">Busy Street</h2>
						</div>
						<div class="mdl-card__supporting-text">Enim labore aliqua
							consequat ut quis ad occaecat aliquip incididunt. Sunt nulla eu
							enim irure enim nostrud aliqua consectetur ad consectetur sunt..
						</div>
						<br>
						<div class="mdl-card__actions mdl-card--border">
							<a
								class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent"
								href="portfolio-page.html"> Learn More </a>
						</div>
					</div>
					<br>
					<div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
						<div class="mdl-card__media">
							<img class="article-image" src="img/portfolio9.jpg" border="0"
								alt="">
						</div>
						<div class="mdl-card__title">
							<h2 class="mdl-card__title-text">City Scape</h2>
						</div>
						<div class="mdl-card__supporting-text">Enim labore aliqua
							consequat ut quis ad occaecat aliquip incididunt. Sunt nulla eu
							enim irure enim nostrud aliqua consectetur ad consectetur sunt..
						</div>
						<br>
						<div class="mdl-card__actions mdl-card--border">
							<a
								class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent"
								href="portfolio-page.html"> Learn More </a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 푸터 정보 --> <footer class="mdl-mini-footer">
			<div class="footer-container">
				<div class="mdl-logo">개발 관련 피드백: cosltkfkd@naver.com</div>
			</div>
		</footer> <script src="https://code.getmdl.io/1.3.0/material.min.js" defer></script>
	</div>
</body>
</html>