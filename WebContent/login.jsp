<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" href="styles/custom.css">
	</head>
	<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
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
		<div class="mdl-layout__content">
		<div class="site-content">
			<div class="mdl-grid site-max-width">
				<div
					class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--4dp page-content">
					<div class="mdl-card__title">
						<h1 class="mdl-card__title-text">로그인</h1>
					</div>
					<div class="mdl-card__media">
						<img class="article-image" src="img/contact.jpg" border="0"
							alt="Contact">
					</div>
					<div class="mdl-grid site-copy">
						<div class="mdl-cell mdl-cell--12-col">
							<div class="mdl-card__supporting-text">
								<p>로그인을 합시다.</p>
								<form action="loginAction.jsp"
									method="POST" class="form-contact">
									<div
										class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="text" id="userID" name="userID" maxlength="20">
										<label class="mdl-textfield__label" for="userID">아이디</label>
										<span class="mdl-textfield__error">아이디를 바르게 입력하세요.</span>
									</div>
									<div
										class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input" type="password" id="userPassword" name="userPassword" maxlength="20">
										<label class="mdl-textfield__label" for="userPassword">비밀번호</label>
										<span class="mdl-textfield__error">비밀번호를 바르게 입력하세요.</span>
									</div>											
									<p>
										<button
											class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"
											type="submit">로그인</button>
									</p>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 푸터 정보 -->
		<footer class="mdl-mini-footer">
			<div class="footer-container">
				<div class="mdl-logo">
					개발 관련 피드백: ndb796@naver.com
				</div>
			</div>
		</footer>
		<script src="https://code.getmdl.io/1.3.0/material.min.js" defer></script>
	</div>
</body>
</html>