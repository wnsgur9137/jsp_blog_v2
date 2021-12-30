<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath(); // => /jspProject
	pageContext.setAttribute("cp", cp);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 줄바꿈을 이용하기 위해  -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
	pageContent.setAttribute("br", "<br/>");
	pageContent.setAttribute("cn", "\n");
%> --%>
<%@ page import="jspProject_final.domain.board.BoardDAO"%>
<%@ page import="jspProject_final.domain.board.BoardDTO" %>
<%@ page import="jspProject_final.domain.comment.Comment" %>
<%@ page import="jspProject_final.domain.comment.CommentDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>blog-content</title>
<style>
	form {
		display : inline;
		/* position : absolute; */
		/* top : 0;
		right : 60px; */
		/* height : 35px;
		width : 50px; */
		/* border : solid 1px yellow; */
	}
	.commentBox {
		/* border : solid 1px red; */
		width : 100%;
	}
</style>
</head>
<body>
	<%
		int boardKey = Integer.parseInt(request.getParameter("boardKey"));
		BoardDAO boardDAO = new BoardDAO();
		BoardDTO boardDTO = boardDAO.content(boardKey);
		if(boardDTO == null) {
			%>
				<script type='text/javascript'>
					alert('게시글 상세보기 실패');
					location.href='list.jsp';
				</script>
			<%
		}
		request.setAttribute("dto", boardDTO);
		
		System.out.println(session.getAttribute("userId"));
		
		// 해당 게시글의 댓글 가져오기
		CommentDAO commentDAO = new CommentDAO();
		ArrayList<Comment> commentList = commentDAO.getCommentList(boardKey);
		request.setAttribute("comments", commentList);
	%>
	<jsp:include page="../layout/header.jsp"/>
	<div class="titleDiv">
		<div style="margin-top : 35px;"class="container">
			<p style="font-size:200%;">${dto.boardTitle }</p>
			<span>글 번호 : ${dto.boardKey } 작성자 : ${dto.userName }</span>
			<hr>
			<div>
				<div><pre><c:out value="${dto.boardContent }"/></pre></div>
			</div>
			<br><br>
			<div align="right" class="container">
				<c:if test="${userId == dto.userId}">
					<form action="${cp }/boardController?cmd=updateForm" method="post">
						<input type="hidden" name="boardKey" value="${dto.boardKey }"/>
						<input type="hidden" name="boardTitle" value="${dto.boardTitle }"/>
						<input type="hidden" name="boardContent" value="${dto.boardContent }"/>
						<button id="btn-update" class="btn btn-warning">수정</button>
					</form>
					<form action="${cp }/boardController?cmd=delete" method="post">
						<input type="hidden" name="boardKey" value="${dto.boardKey }"/>
						<button id="btn-delete" class="btn btn-danger" type="submit">삭제</button>
					</form>
				</c:if>
			</div>
			<!-- 댓글------------ -->
			<br>
			<hr>
			<div class="card">
				<form action="${cp}/boardController?cmd=saveComment" method="post">
					<div class="card-body">
						<p>댓글 등록</p>
						<input type="hidden" name="boardKey" value="${dto.boardKey }"/>
						<%-- <input type="hidden" name="userId" value="${userId }"/>
						<input type="hidden" name="userName" value="${userName }"/> --%>
						<input type="text" name="commentContent" id="reply-content" class="form-control" style="resize:none;"/>
						<!-- <textarea id="reply-content" class="form-control" style="resize:none;"rows="1"></textarea> -->
					</div>
					<div class="card-footer">
						<input type="submit" id="btn-reply-save" class="btn btn-primary" value="등록"/>
						<!-- <button type="button" id="btn-reply-save" class="btn btn-primary">등록</button> -->
					</div>
				</form>
			</div>
			<br>
			<div class="card">
				<div class="card-header">
					<b>댓글 리스트</b>
				</div>
				<ul id="reply-box" class="list-group">
					<li id="reply-1" class="list-group-item d-flex justify-content-between">
						<div class="commentBox">
							<hr>
							<c:forEach var="comment" items="${comments}">
								<!-- 댓글 아이템 시작 -->
								<h4 style="font-size : 12px" >댓글 번호 : ${comment.commentKey}  /  댓글 작성자 : ${comment.commentUserName}</h4>
								<h3>${comment.commentContent }</h3>
								<c:if test="${userId.equals(comment.commentUserId)}">
									<form action="${cp }/boardController?cmd=updateComment" method="post" class="commentForm">
										<input type="hidden" name="commentKey" value="${comment.commentKey }"/>
										<input type="hidden" name="commentBoardKey" value="${comment.commentBoardKey }"/>
										<input type="hidden" name="commentContent" value="${comment.commentContent }"/>
										<input type="submit" value="수정"/>
									</form>
								</c:if>
								<c:if test="${userId.equals(dto.userId) or userId.equals(comment.commentUserId) or userId.equals('root')}">
									<form action="${cp }/boardController?cmd=deleteComment" method="post" class="commentForm">
										<input type="hidden" name="commentKey" value="${comment.commentKey }"/>
										<input type="submit" value="삭제"/>
									<!-- <button class="badge">삭제</button> -->
									</form>
								</c:if>
								<hr>
							</c:forEach>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>