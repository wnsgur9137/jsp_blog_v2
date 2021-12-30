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
<title>blog-boardlist</title>
</head>
<body>
	<%
		String listType = "";
		if(request.getParameter("listType") == null) {
			listType = "all";
		} else {
			listType = request.getParameter("listType");
		}
		
		System.out.println("listType : " + listType);
		
		
		System.out.println("request.getParameter('pageNumber') : " + request.getParameter("pageNumber"));
		int pageNumber = 0;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		System.out.println("pageNumber : " + pageNumber);
		
		BoardDAO boardDAO = new BoardDAO();
		ArrayList<Board> list = boardDAO.getList(pageNumber, listType);
		request.setAttribute("boards", list);
		
	%>
	<jsp:include page="../layout/header.jsp"/>
	
		<div class="titleDiv">
			<h3><span><%=listType.toUpperCase() %> 게시글 목록</span></h3>
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
			<br><hr>
			<div style="margin-left:30px; margin-bottom:30px;">
				<c:if test="<%=pageNumber >= 1 %>">
					<a href="list.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">이전</a>
				</c:if>
				<c:if test="<%=pageNumber == 0 %>">
					<a class="btn btn-success disabled">이전</a>
					<a class="btn btn-success disabled" style="color:gray"><%=pageNumber - 1 %></a>
					<a class="btn btn-success disabled" style="color:gray"><%=pageNumber %></a>
				</c:if>
				<c:if test="<%=pageNumber == 1 %>">
					<a class="btn btn-success disabled" style="color:gray"><%=pageNumber - 1 %></a>
					<a href="list.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left"><%=pageNumber %></a>
				</c:if>
				<c:if test="<%=pageNumber >= 2 %>">
					<a href="list.jsp?pageNumber=<%=pageNumber - 2%>" class="btn btn-success btn-arraw-left"><%=pageNumber - 1%></a>
					<a href="list.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left"><%=pageNumber %></a>
				</c:if>
				<a class="btn btn-success btn-arraw-left" style="color:Aqua"><%=pageNumber + 1%></a>
				<a href="list.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-left"><%=pageNumber + 2 %></a>
				<a href="list.jsp?pageNumber=<%=pageNumber + 2%>" class="btn btn-success btn-arraw-left"><%=pageNumber + 3 %></a>
				<a href="list.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-left">이후</a>
				
				<form action="${cp }/boardController?cmd=search" method="post" style="margin-top:3px; display:inline; position:absolute; right : 200px;">
					<select name="searchType" required="required" >
						<option value="title">제목</option>
						<option value="userName">작성자</option>
						<option value="userId">작성자 아이디</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchName" required="required" placeholder="검색할 내용"/>
					<input type="submit" value="검색"/>
				</form>
				<a class="btn btn-success" style="position : absolute; right : 60px;"href="${cp }/boardController?cmd=saveForm">글쓰기</a>
			</div>
		</div>
	<jsp:include page="../layout/footer.jsp"/>
	
	<%-- <table border="1">
		<%
		for(int i=0; i<list.size(); i++) {
		%>
			<tr>
				<td><%= list.get(i).getBoardKey() %></td>
				<td><%= list.get(i).getBoardTitle() %></td>
				<td><%= list.get(i).getBoardContent() %></td>
				<td><%= list.get(i).getUserId() %></td>
				<td><%= list.get(i).getUserName() %></td>
				<td><%= list.get(i).getHits() %></td>
				<td><%= list.get(i).getBoardCreated() %></td>
				<td><input type="button" value="상세보기"></td>
			</tr>
			<% } %>
		</table> --%>
		<%-- <%
			System.out.println(list.size());
			System.out.println("------------------------");
			for(int i=0; i<list.size(); i++) {
				System.out.println(list.get(i).getBoardKey());
				System.out.println(list.get(i).getBoardTitle());
				System.out.println(list.get(i).getBoardContent());
				System.out.println(list.get(i).getUserId());
				System.out.println(list.get(i).getUserName());
				System.out.println(list.get(i).getHits());
				System.out.println(list.get(i).getBoardCreated());
			}
			System.out.println("------------------------");
		
		
		%> --%>
</body>
</html>