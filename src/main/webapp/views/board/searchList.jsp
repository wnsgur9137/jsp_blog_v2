<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath(); // => /jspProject
	pageContext.setAttribute("cp", cp);
%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jspProject_final.domain.board.Board" %>
<%@ page import="jspProject_final.domain.board.BoardDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board-searchlist</title>
</head>
<body>
	<%
		String searchType = request.getParameter("searchType");
		String searchName = request.getParameter("searchName");
		
		BoardDAO boardDAO = new BoardDAO();
		ArrayList<Board> list = boardDAO.getSearchList(searchType, searchName);
		request.setAttribute("boards", list);
	%>
	<jsp:include page="../layout/header.jsp"/>
	
		<div class="titleDiv">
			<h3><span>검색한 게시글 목록</span></h3>
			<br><hr>
			<div class="container">
				<c:forEach var="board" items="${boards}">
				<!-- 게시글 아이템 시작 -->
				<div class="card gap_b_20">
					<div class="card-body">
						<h4 class="card-title">${board.boardTitle}</h4>
						<img class="img-rounded" style="width:100%; height:100px;" src="${cp }/resource/images/banner.png"/><br>
						<a style="font-size : 12px" >글 번호 : ${board.boardKey}  /  게시글 종류 : ${board.listType}  /  글 작성자 : ${board.userName}</a><br>
						<form action="${cp }/boardController?cmd=content" method="post">
							<input type="hidden" name="boardKey" value="${board.boardKey }"/>
							<input class="btn btn-primary" type="submit" value="상세보기"/>
							<%-- <a href="content.jsp?boardKey=${board.boardKey}" class="btn btn-primary">상세보기</a> --%>
						</form>
					</div>
				</div>
				<!-- 게시글 아이템 종료 -->
				</c:forEach>
			</div>
		</div>
	
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>