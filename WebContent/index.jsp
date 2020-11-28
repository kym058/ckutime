<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="schedule.ScheduleDAO" %>
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
	ScheduleDAO scheduleDAO = new ScheduleDAO();
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
				<div class="container">
					<br><section class="mdl-grid site-max-width">
						<!-- 공지사항 -->
						<div class="mdl-cell mdl-card mdl-cell--8-col mdl-cell--4-col-tablet  mdl-shadow--4dp portfolio-card">
							<div class="mdl-card__title">
								<h2 class="mdl-card__title-text">공지사항</h2>
							</div>
							<ul class="demo-list-three mdl-list">
								<li class="mdl-list__item mdl-list__item--three-line">
									<span class="mdl-list__item-primary-content">
										<i class="material-icons mdl-list__item-avatar">person</i>
										<span>소프트웨어학과 </span>
										<span class="mdl-list__item-text-body">2020년 11월 07일</span>
									</span>
								</li>
								<li class="mdl-list__item mdl-list__item--three-line">
									<span class="mdl-list__item-primary-content">
										<i class="material-icons mdl-list__item-avatar">person</i>
										<span>공지사항 체크용</span>
										<span class="mdl-list__item-text-body">2020년 11월 07일</span>
									</span>
								</li>
							</ul>
						</div>
						<!-- 강의 변경 사항 -->
						<div class="demo-card-event mdl-cell mdl-card mdl-shadow--4dp event-card portfolio-card">
							<div class="mdl-card__title mdl-card--expand">
								<h4>시간표를 자유롭게 작성해볼 수 있습니다!</h4>
							</div>
							<div class="mdl-card__title mdl-card--expand">
							2020년 2학기 이용자 : <%= 3 %>명
							</div>							
							<div class="mdl-card__actions mdl-card--border">
								<a href="edit.jsp" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent">시간표 관리</a>
								<div class="mdl-layout-spacer"></div>
								<i class="material-icons">schedule</i>
							</div>
						</div>
					</section>
					<!-- 소개 -->
					<br><section class="section--center mdl-grid site-max-width">
						<div class="mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone  mdl-shadow--4dp" style="margin: 0 auto;">
                          <iframe width="560" height="315" src="https://www.youtube.com/embed/z_Nhc_6Xg94" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							<div class="mdl-card__title">
								<h2 class="mdl-card__title-text">CKU타임</h2>
							</div>
							<div class="mdl-card__supporting-text">CKU타임은 소프트웨어학과 학생들이 개발한 수강신청 도우미 프로그램입니다.</div>
						</div>
					</section>
					<!-- 풍경 사진 -->
					<section class="section--center mdl-grid site-max-width">
						<div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
							<div class="mdl-card__media">
								<img class="article-image" src="img/portfolio1.jpg" border="0" alt="">
							</div>
							<div class="mdl-card__title">
								<h2 class="mdl-card__title-text">마리아관</h2>
							</div>
							<div class="mdl-card__supporting-text">관동대 마리아관의 모습입니다.</div>
						</div>
						<div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
							<div class="mdl-card__media">
								<img class="article-image" src="img/bookcafe.jpg" border="0"
									alt="">
							</div>
							<div class="mdl-card__title">
								<h2 class="mdl-card__title-text">중앙도서관</h2>
							</div>
							<div class="mdl-card__supporting-text">관동대 중앙도서관 내부의 모습입니다.</div>
						</div>
						<div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
							<div class="mdl-card__media">
								<img class="article-image" src="img/changjo.jpg" border="0"
									alt="">
							</div>
							<div class="mdl-card__title">
								<h2 class="mdl-card__title-text">창조관</h2>
							</div>
							<div class="mdl-card__supporting-text">관동대 창조관 모습입니다.</div>
						</div>
					</section>
					<!-- 시간표나 작성하기가기 버튼 -->
					<section class="section--center mdl-grid site-max-width homepage-portfolio">
						<a class="mdl-button mdl-button--raised mdl-js-button mdl-js-ripple-effect mdl-button--accent"
							href="edit.jsp">시간표나 작성하러가기</a>
					</section>
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