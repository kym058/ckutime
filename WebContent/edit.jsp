<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="schedule.ScheduleDAO"%>
<%@ page import="lecture.Lecture"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<%
	ScheduleDAO scheduleDAO = new ScheduleDAO();
	request.setCharacterEncoding("utf-8");
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
		<script type="text/javascript">
			function setSelectedValue(selectObj, valueToSet) {
			    for (var i = 0; i < selectObj.options.length; i++) {
			        if (selectObj.options[i].value == valueToSet) {
			            selectObj.options[i].selected = true;
			            return;
			        }
			    }
			}		
			function collegeTypeEvent(collegeType) {
				var selected = collegeType.options[collegeType.selectedIndex].text;
				if(selected == "학부") {
					document.getElementById("area3Combobox").innerHTML = "<option value=''>선택하세요.</option><option value='교양'>교양</option><option value='전공'>전공</option>";
				}
				if(selected == "대학원") {
					document.getElementById("area3Combobox").innerHTML = "<option value=''>선택하세요.</option><option value='일반대학원'>일반대학원</option>";
				}
			}
			function area3Event(area3) {
				var selected = area3.options[area3.selectedIndex].text;
				if(selected == "교양") {
					document.getElementById("area4Combobox").innerHTML = "<option value='전체'>전체</option>"
<%
					ArrayList<String> list1 = scheduleDAO.getArea4("교양");
					for(int i = 0; i < list1.size(); i++) {
%>
						+ "<option value='<%= list1.get(i) %>'><%= list1.get(i) %></option>"
<%
					}
%>
				}
				if(selected == "전공") {
					document.getElementById("area4Combobox").innerHTML = "<option value='전체'>전체</option>"
<%
					ArrayList<String> list2 = scheduleDAO.getArea4("전공");
					for(int i = 0; i < list2.size(); i++) {
%>
						+ "<option value='<%= list2.get(i) %>'><%= list2.get(i) %></option>"
<%
					}
%>
				}
				if(selected == "일반대학원") {
					document.getElementById("area4Combobox").innerHTML = "<option value='전체'>전체</option>"
<%
					ArrayList<String> list3 = scheduleDAO.getArea4("일반대학원");
					for(int i = 0; i < list3.size(); i++) {
%>
						+ "<option value='<%= list3.get(i) %>'><%= list3.get(i) %></option>"
<%
					}
%>
				}				
			}	
			function searchSetting(search) {
				document.getElementById("search").value = search;
			}
		</script>
	</head>
	<body>
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
				<div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--4dp page-content">
					<div class="mdl-card__title">
						<h1 class="mdl-card__title-text">강의 검색</h1>
					</div>
					<br>
					<form method="POST" action="edit.jsp">
						<div style="text-align: center;">
						    <div class="col-xs-6 form-group">
						        <div class="col-xs-12 selectContainer">
						            <select id="collegeTypeCombobox" class="form-control" name="collegeType" onChange="javascript:collegeTypeEvent(this)">
						                <option value="">선택하세요.</option>
						                <option value="학부" selected>학부</option>
						                <option value="대학원">대학원</option>
						            </select>
						        </div>
						    </div>
						    <div class="col-xs-6 form-group">
						        <div class="col-xs-12 selectContainer">
						            <select id="area3Combobox" class="form-control" name="area3Combobox" onChange="javascript:area3Event(this)">
						                <option value="">선택하세요.</option>
						            </select>
						        </div>
						    </div>	
						    <div class="col-xs-12 form-group">
						        <div class="col-xs-12 selectContainer">
						            <select id="area4Combobox" class="form-control" name="area4Combobox" onChange="javascript:area4Event(this)">
						                <option value="">선택하세요.</option>
						            </select>
						        </div>
						    </div>		
						    <div class="col-xs-6 form-group">
						    	<div class="col-xs-5 control-label">요일</div>
						        <div class="col-xs-7 selectContainer">
						            <select id="dayCombobox" class="form-control" name="dayCombobox">
						                <option value="전체">전체</option>
						                <option value="월">월요일</option>
						                <option value="화">화요일</option>
						                <option value="수">수요일</option>
						                <option value="목">목요일</option>
						                <option value="금">금요일</option>
						                <option value="토">토요일</option>
						            </select>
						        </div>
						    </div>					
						    <div class="col-xs-6 form-group">
						    	<div class="col-xs-5 control-label">학점</div>
						        <div class="col-xs-7 selectContainer">
						            <select id="creditCombobox" class="form-control" name="creditCombobox">
						                <option value="전체">전체</option>
						                <option value="0">0학점</option>
						                <option value="1">1학점</option>
						                <option value="2">2학점</option>
						                <option value="3">3학점</option>
						                <option value="4">4학점</option>
						            </select>
						        </div>
						    </div>						
						    <div class="col-xs-12 form-group">
						        <div class="col-xs-9 selectContainer">
						            <input type="text" id="search" class="form-control" name="search" placeholder="강의명을 검색할 수 있습니다.">
						        </div>
						        <div class="col-xs-3 selectContainer">
									<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" type="submit">검색</button>
						        </div>
						    </div>				
					    </div>	
					</form>
				</div>
				<script type="text/javascript">
					setSelectedValue(document.getElementById('collegeTypeCombobox'), '학부');
					collegeTypeEvent(document.getElementById('collegeTypeCombobox'));
					setSelectedValue(document.getElementById('area3Combobox'), '교양');
					area3Event(document.getElementById('area3Combobox'));
				</script>		
<%
	String collegeType = null;
	if(request.getParameter("collegeType") != null) {
		collegeType = request.getParameter("collegeType");
	}
	String area3 = null;
	if(request.getParameter("area3Combobox") != null) {
		area3 = request.getParameter("area3Combobox");
	}
	String area4 = null;
	if(request.getParameter("area4Combobox") != null) {
		area4 = request.getParameter("area4Combobox");
	}
	String day = null;
	if(request.getParameter("dayCombobox") != null) {
		day = request.getParameter("dayCombobox");
	}
	String credit = null;
	if(request.getParameter("creditCombobox") != null) {
		credit = request.getParameter("creditCombobox");
	}
	String search = "";
	if(request.getParameter("search") != null) {
		search = request.getParameter("search");
	}
	ArrayList<Lecture> lectureList = new ArrayList<Lecture>();
	if(!(area4 == null || area4.equals(""))) {
		lectureList = scheduleDAO.getLectureList(collegeType, area3, area4, day, credit, search);
		out.println("<script type='text/javascript'>" +
						"setSelectedValue(document.getElementById('collegeTypeCombobox'), '" + collegeType + "');" +
						"collegeTypeEvent(document.getElementById('collegeTypeCombobox'));" +
						"setSelectedValue(document.getElementById('area3Combobox'), '" + area3 + "');" +
						"area3Event(document.getElementById('area3Combobox'));" +
						"setSelectedValue(document.getElementById('area4Combobox'), '" + area4 + "');" +
						"setSelectedValue(document.getElementById('creditCombobox'), '" + credit + "');" +
						"setSelectedValue(document.getElementById('dayCombobox'), '" + day + "');" +		
						"searchSetting('" + search + "');" +	
						"</script>");
	}
%>							
				<div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--4dp page-content">
					<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="8"><h4>검색 결과 (총 갯수: <%= lectureList.size() %>개)</h4></th>
							</tr>
							<tr>
								<th style="text-align: center; background-color: #fafafa; color: #000000;"><h5>학년</h5></th>
								<th style="text-align: center; background-color: #fafafa; color: #000000;"><h5>강의</h5></th>
								<th style="text-align: center; background-color: #fafafa; color: #000000;"><h5>교수</h5></th>
								<th style="text-align: center; background-color: #fafafa; color: #000000;"><h5>학점</h5></th>
								<th style="text-align: center; background-color: #fafafa; color: #000000;"><h5>분반</h5></th>
								<th style="text-align: center; background-color: #fafafa; color: #000000;"><h5>제한 인원</h5></th>
								<th style="text-align: center; background-color: #fafafa; color: #000000;"><h5>강의 시간</h5></th>
								<th style="text-align: center; background-color: #fafafa; color: #000000;"><h5>신청자</h5></th>
							</tr>
						</thead>
						<tbody>
<%
	for(int i = 0; i < lectureList.size(); i++) {
		Lecture lecture = lectureList.get(i);
%>						
							<tr>
								<td><a onclick="return confirm('추가하시겠습니까?')" href="insertAction.jsp?lectureID=<%= lecture.getLectureID() %>"><%= lecture.getLectureGrade() %></a></td>
								<td><a onclick="return confirm('추가하시겠습니까?')" href="insertAction.jsp?lectureID=<%= lecture.getLectureID() %>"><%= lecture.getLectureName() %></a></td>
								<td><a onclick="return confirm('추가하시겠습니까?')" href="insertAction.jsp?lectureID=<%= lecture.getLectureID() %>"><%= lecture.getLectureProfessor() %></a></td>
								<td><a onclick="return confirm('추가하시겠습니까?')" href="insertAction.jsp?lectureID=<%= lecture.getLectureID() %>"><%= lecture.getLectureCredit() %></a></td>
								<td><a onclick="return confirm('추가하시겠습니까?')" href="insertAction.jsp?lectureID=<%= lecture.getLectureID() %>"><%= lecture.getLectureDivide() %></a></td>
								<td><a onclick="return confirm('추가하시겠습니까?')" href="insertAction.jsp?lectureID=<%= lecture.getLectureID() %>"><%= lecture.getLectureLimit() %></a></td>
								<td><a onclick="return confirm('추가하시겠습니까?')" href="insertAction.jsp?lectureID=<%= lecture.getLectureID() %>"><%= lecture.getLectureTime() %></a></td>
								<td><a onclick="return confirm('추가하시겠습니까?')" href="insertAction.jsp?lectureID=<%= lecture.getLectureID() %>"><%= scheduleDAO.getNumber(lecture.getLectureID() + "") %>명</a></td>
							</tr>
<%
	}
%>
						</tbody>
					</table>	
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