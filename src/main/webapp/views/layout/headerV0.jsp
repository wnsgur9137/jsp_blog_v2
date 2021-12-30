<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath(); // => /jspProject
	pageContext.setAttribute("cp", cp);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Blog</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"/>

<!-- 부트스트랩 -->
<!-- 해더 색상과 슬라이드 이미지에 사용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<!-- ------- -->

<style>
	/* @import url(//fonts.googleapis.com/earlyaccess/hanna.css); */
	/* font-family: 'Hanna', sans-serif; */
	
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
	
	
	
	.header {
		/* *margin : 10px 5px 15px 20px; */
		margin-top : 0px;
		margin-bottom : 0px;
		
		/* padding-top : 10px;
		padding-bottom : 10px; */
		padding-left : 80px;
		
		background-color : #808080;
		height : 50px;
		text-align : left;
		line-height : 50px;
		font-size : 150%;
	}
	
	.menu, .slide, .panel {
		padding : 5px;
		text-align : center;
		width : 130px;
		/* border : solid 1px #c3c3c3; */
		
	}
	
	.menu {
		/* border-left : solid 1px black; */
		border-right : solid 1px black;
	}
	
	.slide { color : gray; }
	.slide:link { color : white; }
	.slide:visited { color : white; }
	.slide:hover { color : white; }
	.slide:active { color : white; }
	
	.panel {
		margin-left : -6px;
		list-style-type : none;
		display: none;
	}
	
	.userInfo {
		/* border : solid 1px; */
		position : absolute;
		top : 25%;
		right : 20px;
		align : center;
		color : white;
		font-size : 120%;
		
		font-family: 'Jeju Gothic', sans-serif;
	}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		$('.panel').hide();
		$('.slide').mouseover(function() {
			$(this).next("ul").slideDown();
			/* $('.panel').slideDown(); */
		});
		$('.menu').mouseleave(function() {
			$('.panel').slideUp();
		})
	})
</script>
</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="${cp}" style="margin-left : 10px;">Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

	
		<div class="collapse navbar-collapse" style="relative" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<%
					Object userInfo = session.getAttribute("userInfo");
					Object userName = session.getAttribute("userName");
					if (session.getAttribute("userInfo") == null) {
						%>
							<li class="nav-item"><a class="nav-link" href="${cp }/views/user/loginForm.jsp">로그인</a></li>
							<li style="text-align : right"class="nav-item"><a class="nav-link" href="${cp }/views/user/joinForm.jsp">회원가입</a></li>
						<%
					} else {
						%>
							<li class="menu" style="border-left : solid 1px black;">
								<a class="slide" style="">게시글</a> <!-- class="nav-link" -->
								<ul class="panel">
									<li class="nav-item"><a class="nav-link" href="${cp }/views/board/list.jsp?pageNumber=0">게시글 목록</a></li>
									<li class="nav-item"><a class="nav-link" href="${cp }/views/board/saveForm.jsp">글쓰기</a></li>
								</ul>
							</li>
							
							<%
								if(session.getAttribute("userInfo").equals("root")) {
									%>
										<li class="menu">
											<a class="slide" class="nav-link">관리자</a>
											<ul class="panel">
												<li class="nav-item"><a class="nav-link" href="${cp }/views/root/rootUserInfo.jsp">유저 계정 관리</a></li>
												<li class="nav-item"><a class="nav-link" href="${cp }/views/root/rootBoardInfo.jsp">게시글 관리</a></li>
												<li class="nav-item"><a class="nav-link" href="${cp }/views/root/rootForm.jsp">댓글 관리</a></li>
											</ul>
										</li>
									<%
								} %>
							
							<li class="menu" style="align : right">
								<a class="slide">계정</a> <!-- class="nav-link" -->
								<ul class="panel">
									<li class="nav-item"><a class="nav-link" href="${cp }/views/user/passwordCheck.jsp">계정 정보</a></li>
									<li class="nav-item"><a class="nav-link" href="${cp }/views/user/logout.jsp">로그아웃</a></li>
								</ul>
							</li>
							
							<li>
								<p class="userInfo">환영합니다 <%=userName%>님</p>
							</li>
					<%}
				%>
			</ul>
		</div>

	</nav>
	<br>
</body>
</html>