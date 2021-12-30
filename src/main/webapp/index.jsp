<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jspProject_final.domain.board.Board" %>
<%@ page import="jspProject_final.domain.board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>blog-index</title>
<style>

</style>
</head>
<style>

	.row {
 		border : solid 1px;
	 	margin-left : 10px;
	 	width : 350px;
	 	height : 300px;
	}
	
	.indexDiv {
		text-align : center;
	}
 	
 	.indexContent {
 		/* border:solid 1px yellow; */
 		text-align : left;
 		margin : 50px 30px 30px 30px;
 	}
 	
</style>
<body>
	<jsp:include page="./views/layout/header.jsp"/>
	
	<hr>
	<div class="titleDiv indexDiv">
	
		<h2>이준혁의 블로그</h2>
		<hr>
		<div class="indexContent">
			<hr>
			
			<h3>기능</h3>
			<ul>
				<li>모바일 / 데스크탑 화면 지원</li>
				<li>회원가입/로그인 구현</li>
				<li>회원수정 페이지 구현</li>
				<li>종류별 게시판 구현(JSP, C# 등)</li>
				<li>게시글 검색/작성/수정/삭제 구현</li>
				<li>관리자 계정으로 접속시 관리자 메뉴 구현(유저, 게시글, 댓글 관리)</li>
			</ul>
			
			<hr>
			
			<h3>개발환경</h3>
			<table class="table table=bordered">
				<tr>
					<td>JAVA</td><td>JDK 15</td>
				</tr>
				<tr>
					<td>TOOL</td><td>이클립스</td>
				</tr>
				<tr>
					<td>TOMCAT</td><td>TOMCAT 8.5 (homebrew) port:8000</td>
				</tr>
				<tr>
					<td>DB</td><td>OracleDB 11g</td>
				</tr>
				<tr>
					<td>OS</td><td>MAC OS Monterey</td>
				</tr>
			</table>
			
			<hr>
			
		</div>
		<br><hr>
	</div>
	<hr>
	
 	<jsp:include page="./views/layout/footer.jsp"/>
</body>
</html>