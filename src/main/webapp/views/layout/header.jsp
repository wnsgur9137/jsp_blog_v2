<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath(); // => /jspProject
	pageContext.setAttribute("cp", cp);
	
	Object userName = session.getAttribute("userName");
	Object userId = session.getAttribute("userId");
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"/>

<!-- 부트스트랩 -->
<!-- 해더 색상과 슬라이드 이미지에 사용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<!-- ------- -->
<title>Insert title here</title>
</head>
<style>
	/* 폰트 */
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	* { font-family: 'Jeju Gothic', sans-serif; }
	input, table {
	/* Jeju Gothic 폰트를 할 경우 패스워드 입력 란에 문자가 보이지 않기 때문에
		각 OS마다 기본 폰트로 지정 */
		font-family: -apple-system,
					BlinkMacSystemFont,					
					"Segoe UI",
					Roboto,
					Oxygen-Sans,
					Ubuntu,
					Cantarell,
					"Helvetica Neue",
					sans-serif;
	}
	/* --------------------- */

	/*
		position
			static = 요소들이 겹치지 않고 한 줄에 하나씩 배치
			realativ = 원래 배치되어야 할 위치에 지정한 값에 배치
			absolute = 가장 가까운 상위 요소의 위치를 기준으로 지정한 값만큼 떨어진 곳에 배치
			fixed = 웹 브라우저 화면 전체를 기준으로 배치.
	*/

	
	/* 스마트폰, 태블릿 */
	@media (max-width:970px) {
		/* .test1 {
			background-color : blue;
		} */
		
		.titleMenu {
			border : solid 1px #c3c3c3;
			position : fixed;
			top : 0px;
			right : 0px;
			algin : right;
			cursor : pointer;
			opacity : 0.8;
			list-style-type : none;
		}
		
		.desktopMenu {
			display : none;
		}
		
		.topImage {
			position : static;
			top : 0px;
			right : 0px;
			width : 100%;
		}
		
		.titleDiv {
			margin-top : 50px;
			margin-right : 50px;
			margin-bottom : 10px;
			margin-left : 50px;
			overflow: auto;
		}
		.topHeader {
			position : fixed;
			top : 10px;
			right : 20px;
			left : 20px;
			z-index : 9;
		}
		.titleSlide {
			position : fixed;
			top : 13px;
			right : 25px;
		}
		
		/* .desktopHeaderMenu {
			margin-top : 10px;
			margin-right : 10px;
			margin-left : 30px;
			margin-bottom : 10px;
		} */
		
		.nav-link {
			color : black;
		}
		
		.bold {
			font-weight : bold;
			font-size : 120%;
		}
		
		.footer {
			margin-top : 350px;
			/* border : 1px solid red; */
			text-align : center;
			position : absolute;
	 		width : 100%;
	 		overflow : auto;
	 		color : gray;
		}
	}
	
	/* 데스크탑 */
	@media (min-width:970px) {
		/* .test1 {
			background-color : yellow;
		} */
		
		.topHeader {
			display : none;
		}
		
		.desktopMenu {
			width : 400px;
			height : 100%;
			position : fixed;
			top : 0px;
			left : 0px;
			z-index : 10;
			border : 1px solid;
			background-color : lightcyan;
			/* opacity : 0.5; */
			
			min-height : 100%;
			background-position : center;
			background-size : cover;
			
		}
		
		.desktopHeaderMenu {
			margin-top : 10px;
			margin-right : 10px;
			margin-left : 30px;
			margin-bottom : 10px;
		}
		
		.nav-link {
			color : white;
		}
		
		.titleDiv {
			/* border : solid 1px; */
			margin-top : 0px;
			margin-right : 50px;
			margin-bottom : 10px;
			margin-left : 50px;
			position : absolute;
			top : 100px;
			left : 400px;
			width : 70%;
			overflow : auto;
		}
		
		.topImage {
			display : none;
		}
		
		.footer {
			margin-top : 1100px;
			/* border : 1px solid red; */
			text-align : center;
			position : fixed;
			left : 0px;
			bottom : 0px;
	 		width : 400px;
	 		height : 100px;
	 		overflow : auto;
	 		z-index : 11;
	 		color : white;
		}
	}
	
	.titlePanel {
		width : 400px;
		height : 100%;
		position : fixed;
		top : 0px;
		right : -402px;
		z-index : 10;
		border : 1px solid #c9c9c9;
		background-color : #c9c9c9;
		text-align : center;
		
		/* 애니메이션 */
		transition : All 0.2s ease;
		-webkit-transition : All 0.2s ease;
		-moz-transition : All 0.2s ease;
		-o-transition : All 0.2s ease;
	}
	
	.titlePanel.open {
		right : 0px;
	}
	
	.titlePanel.panelClose {
		right : -400px;
	}
	
	.close {
		position : absolute;
		top : 5px;
		right : 15px;
		cursor : pointer;
		font-size : 170%;
		
	}
	
	.menu, .slide, .panel {
		padding : 5px;
		text-align : center;
		width : 130px;
		/* border : solid 1px #c3c3c3; */
	}
	
	.menu {
		border : solid 1px;
		/* border-left : solid 1px;
		border-right : solid 1px; */
	}
	
	/* 아래 slide, panel 클래스는 슬라이드 메뉴 사용 시 */ 
	/*
	.slide { color : gray; }
	.slide:link { color : black; }
	.slide:visited { color : black; }
	.slide:hover { color : black; }
	.slide:active { color : black; }
	
	.panel {
		margin-left : -6px;
		list-style-type : none;
		display: none;
	} */
	
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		$('.titleMenu').click(function() {
			$(".titlePanel").addClass("open");
		})
		$('.close').click(function() {
			$(".titlePanel").removeClass("open");
			$(".titlePanel").addClass("panelClose");
		})
	})

	/* 슬라이드 메뉴 사용할 시 */ 
	/* $(document).ready(function() {
		$('.panel').hide();
		$('.slide').click(function() {
			$(this).next("ul").slideDown();
		});
	}) */
</script>
<body>

	<!-- 데스크탑 버전 -->
	<div class="desktopMenu" style="background-image : url(${cp}/resource/images/desktopIndex.jpeg)">
		<br>
		<a class="nav-link" href="${cp}" style="padding-left:15px; font-size:130%; font-weight:bold;">이준혁의 Blog</a>
		<% if(userId != null)  {%>
			<br>
			<p style="color:white; margin-left:15px;">환영합니다 <%=userName %>님</p>
		<% } %>
		
			<%
			if(userId == null) {
			%>
				<a class="nav-link desktopA" href="${cp }/userController?cmd=loginForm">로그인</a>
				<a class="nav-link desktopA" href="${cp }/userController?cmd=joinForm">회원가입</a>
			<%
		} else {
			%>
				<br>
				<div class="desktopHeaderMenu">
					<p style="color:white;">게시글</p>
					<a class="nav-link" href="${cp }/boardController?cmd=list&listType=all">전체 게시글</a>
					
					<a class="nav-link" href="${cp }/boardController?cmd=list&listType=java">JAVA</a>
					<a class="nav-link" href="${cp }/boardController?cmd=list&listType=jsp">JSP</a>
					<a class="nav-link" href="${cp }/boardController?cmd=list&listType=cs">C#</a>
					<a class="nav-link" href="${cp }/boardController?cmd=list&listType=phyton">파이썬</a>
					<a class="nav-link" href="${cp }/boardController?cmd=list&listType=theory">이론 과목</a>
					<a class="nav-link" href="${cp }/boardController?cmd=list&listType=mac">MAC 관련 자료</a>
					
					<a class="nav-link" href="${cp }/boardController?cmd=saveForm">글쓰기</a>				
				</div>
			<%
				if(userId.equals("root")) {
			%>
					<br>
					<div class="desktopHeaderMenu">
						<p style="color:white;">관리자</p>
						<a class="nav-link" href="${cp }/userController?cmd=rootUserInfoForm">유저 계정 관리</a>
						<a class="nav-link" href="${cp }/userController?cmd=rootBoardInfoForm">게시글 관리</a>
						<a class="nav-link" href="${cp }/userController?cmd=rootCommentInfoForm">댓글 관리</a>
					</div>  
			<% } %>
				<br>
				<div class="desktopHeaderMenu" style="margin-left : 15px;">
					<a class="nav-link" href="${cp }/userController?cmd=passwordCheckForm">계정 정보</a>
					<a class="nav-link" href="${cp }/userController?cmd=logout">로그아웃</a>
				</div>
		<%}%>
	</div>

	<!-- 모바일 버전 -->
	<img class="topImage" src="${cp }/resource/images/mainIndex1.jpg"/>
	<div class="topHeader">
		<nav class="navbar navbar-expand-md bg-dark navbar-dark">
			<a class="navbar-brand" href="${cp}" style="padding-left:15px; font-size:130%; font-weight:bold;">이준혁의 Blog</a>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<!-- 목록 메뉴 -->
				<div class="titleMenu">
					<% if(userId != null)  {%>
						<br>
						<p style="color:white; margin-left:15px; position:absolute; width:200px; right:50px;">환영합니다 <%=userName %>님</p>
					<% } %>
					<a class="titleSlide"><img src="${cp}/resource/images/menu.png" alt="menubar" style="weight:50px; height:50px;"/></a>
					<div class="titlePanel">
						<div class="close">X<span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
						<br><br><hr>
						
						<br>
						<a class="nav-link" href="${cp}" style="padding-left:15px; font-size:130%; font-weight:bold;">이준혁의 Blog</a>
							<%
							if(userId == null) {
							%>
								<a class="nav-link desktopA" href="${cp }/userController?cmd=loginForm">로그인</a>
								<a class="nav-link desktopA" href="${cp }/userController?cmd=joinForm">회원가입</a>
							<%
						} else {
							%>
								<br>
								<div class="desktopHeaderMenu">
									<p style="color:black;"><span class="bold">게시글</span></p>
									<a class="nav-link" href="${cp }/boardController?cmd=list&listType=all">전체 게시글</a>
									
									<a class="nav-link" href="${cp }/boardController?cmd=list&listType=java">JAVA</a>
									<a class="nav-link" href="${cp }/boardController?cmd=list&listType=jsp">JSP</a>
									<a class="nav-link" href="${cp }/boardController?cmd=list&listType=cs">C#</a>
									<a class="nav-link" href="${cp }/boardController?cmd=list&listType=phyton">파이썬</a>
									<a class="nav-link" href="${cp }/boardController?cmd=list&listType=theory">이론 과목</a>
									<a class="nav-link" href="${cp }/boardController?cmd=list&listType=mac">MAC 관련 자료</a>
									
									<a class="nav-link" href="${cp }/boardController?cmd=saveForm">글쓰기</a>				
								</div>
							<%
								if(userId.equals("root")) {
							%>
									<br>
									<div class="desktopHeaderMenu">
										<p style="color:black;"><span class="bold">관리자</span></p>
										<a class="nav-link" href="${cp }/userController?cmd=rootUserInfoForm">유저 계정 관리</a>
										<a class="nav-link" href="${cp }/userController?cmd=rootBoardInfoForm">게시글 관리</a>
										<a class="nav-link" href="${cp }/userController?cmd=rootCommentInfoForm">댓글 관리</a>
									</div>  
							<% } %>
								<br>
								<div class="desktopHeaderMenu">
									<p style="color:black"><span class="bold">계정</span></p>
									<a class="nav-link" href="${cp }/userController?cmd=passwordCheckForm">계정 정보</a>
									<a class="nav-link" href="${cp }/userController?cmd=logout">로그아웃</a>
								</div>
						<%}%>
						
						<%-- 슬라이드 메뉴 (현재 사용 안함)
						<%
							if(userId == null) {
								%>
									<a class="nav-link" style="color:black" href="${cp }/userController?cmd=loginForm">로그인</a>
									<a class="nav-link" href="${cp }/userController?cmd=joinForm">회원가입</a>
								<%
							} else {
								%>
									<div>
									<a class="slide">게시글</a> <!-- class="nav-link" -->
									<ul class="panel">
										<li class="nav-item"><a style="color : black" href="${cp }/boardController?cmd=list">게시글 목록</a></li>
										<li class="nav-item"><a style="color : black" href="${cp }/boardController?cmd=saveForm">글쓰기</a></li>
										
										<li class="nav-item"><a class="nav-link" href="${cp }/boardController?cmd=list&listType=all">게시글 목록</a></li>
										<li class="nav-item"><a class="nav-link" href="${cp }/boardController?cmd=list&listType=java">JAVA</a></li>
										<li class="nav-item"><a class="nav-link" href="${cp }/boardController?cmd=list&listType=jsp">JSP</a></li>
										<li class="nav-item"><a class="nav-link" href="${cp }/boardController?cmd=list&listType=cs">C#</a></li>
										<li class="nav-item"><a class="nav-link" href="${cp }/boardController?cmd=list&listType=phyton">파이썬</a></li>
										<li class="nav-item"><a class="nav-link" href="${cp }/boardController?cmd=list&listType=theory">이론 과목</a></li>
										<li class="nav-item"><a class="nav-link" href="${cp }/boardController?cmd=list&listType=mac">MAC 관련 자료</a></li>
										<li class="nav-item"><a class="nav-link" href="${cp }/boardController?cmd=saveForm">글쓰기</a></li>
									</ul>
									</div>
								<% 
									if(userId.equals("root")) {
										%>
											<div>
												<a class="slide" class="nav-link">관리자</a>
												<ul class="panel">
													<li class="nav-item"><a class="nav-link" href="${cp }/userController?cmd=rootUserInfoForm">유저 계정 관리</a></li>
													<li class="nav-item"><a class="nav-link" href="${cp }/userController?cmd=rootBoardInfoForm">게시글 관리</a></li>
													<li class="nav-item"><a class="nav-link" href="${cp }/userController?cmd=rootCommentInfoForm">댓글 관리</a></li>
												</ul>
											</div>
										<%
									} %>
									<a style="color : black" href="${cp }/userController?cmd=passwordCheckForm">계정 정보</a>
									<a style="color : black" href="${cp }/userController?cmd=logout">로그아웃</a>
							<%}
						%> --%>
					</div> <!-- class="titlePanel" -->
				</div>	<!-- class="titleSlide" -->				
			</div> <!-- class="titleMenu -->
		</nav>
	</div>
	
	<div class="titleDiv">
	
	</div>
</body>
</html>