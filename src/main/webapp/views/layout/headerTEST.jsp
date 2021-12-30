<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath(); // => /jspProject
	pageContext.setAttribute("cp", cp);
%>
<!DOCTYPE html>
<html>
<head>
<title>Blog</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"/>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="http://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style>
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
	
	.titleMenu {
		border : solid 1px #c3c3c3;
		/* position : fixed; */
		/* position : absolute; */
		/* position : relative; */
		position : absolute;
		top : 0px;
		right : 0px;
		algin : right;
		cursor : pointer;
		
		list-style-type : none;
	}
	
	.titlePanel {
		width : 400px;
		height : 100%;
		position : fixed;
		top : 0px;
		right : -402px;
		z-index : 10;
		border : 1px solid #c9c9c9;
		background-color : white;
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
	
	.close {
		position : absolute;
		top : 0px;
		right : 0px;
		cursor : pointer;
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
	
	.slide { color : gray; }
	.slide:link { color : black; }
	.slide:visited { color : black; }
	.slide:hover { color : black; }
	.slide:active { color : black; }
	
	.panel {
		margin-left : -6px;
		list-style-type : none;
		display: none;
	}
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		$('.titleMenu').click(function() {
			$(".titlePanel").addClass("open");
		})
		$('.close').click(function() {
			$(".titlePanel").removeClass("open");
		})
	})

/* $(document).ready(function() {
	$('.titlePanel').hide();
	$('.titleSlide').click(function() {
		var submenu = $(this).next("div");
		
		if(submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
		
		
	});
}) */

	$(document).ready(function() {
		$('.panel').hide();
		$('.slide').mouseover(function() {
			$(this).next("ul").slideDown();
		});
		$('.menu').mouseleave(function() {
			$('.panel').slideUp();
		})
	})
</script>
</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="${cp}">Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<!-- <ul> -->
			<div class="titleMenu">
				<a class="titleSlide"><img src="${cp}/resource/images/menu.png" alt="menubar" style="weight:50px; height:50px;"/></a>
				<div class="titlePanel">
				<div onclick="history.back();" class="page_cover"><img src="${cp}/resource/images/close.png" alt="close" style="weight:50px; height:50px;"/></div>
			<ul class="navbar-nav" style="position: absolute; top : 60px">
				<%
					System.out.println(session.getAttribute("userInfo"));
					if (session.getAttribute("userInfo") == null) {
						%>
							<li class="nav-item"><a class="nav-link" href="${cp }/views/user/loginForm.jsp">로그인</a></li>
							<li style="text-align : right"class="nav-item"><a class="nav-link" href="${cp }/views/user/joinForm.jsp">회원가입</a></li>
						<%
					} else {
						%>	
							<li class="menu">
								<a class="slide">게시글</a> <!-- class="nav-link" -->
								<ul class="panel">
									<li class="nav-item"><a style="color : black" href="${cp }/views/user/loginForm.jsp">게시글 목록</a></li>
									<li class="nav-item"><a style="color : black" href="${cp }/views/user/loginForm.jsp">글쓰기</a></li>
								</ul>
							</li>
							<%
								System.out.println("userInfo : " + session.getAttribute("userInfo"));
								if(session.getAttribute("userInfo").equals("root")) {
									%>
										<li class="menu">
											<a class="slide" class="nav-link">관리자</a>
											<ul class="panel">
												<li class="nav-item"><a style="color : black" href="${cp }/views/root/rootForm.jsp">관리자 목록</a></li>
											</ul>
										</li>
									<%
								} %>
							<li class="menu">
								<a class="slide">계정</a> <!-- class="nav-link" -->
								<ul class="panel">
									<li class="nav-item"><a style="color : black" href="${cp }/views/user/passwordCheck.jsp">계정 정보</a></li>
									<li class="nav-item"><a style="color : black" href="${cp }/views/user/logout.jsp">로그아웃</a></li>
								</ul>
							</li>				
					<%}%>
					</ul>
				</div>
			</div>
			<!-- </ul> -->						
		</div>
	</nav>
	<br>
</body>
</html>