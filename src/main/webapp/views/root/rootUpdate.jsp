<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jspProject_final.domain.user.UserDAO" %>
<%@ page import="jspProject_final.domain.board.BoardDAO" %>
<%@ page import="jspProject_final.domain.comment.CommentDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>blog-root-update</title>
</head>
<body>
	<% // 관리자 계정이 아닐 시
		String sessionUserId = (String)session.getAttribute("userId");
		if(sessionUserId == null || sessionUserId.equals("root") == false) {
			%>
				<script type='text/javascript'>
					alert('권한이 없습니다.');
					location.href="../user/loginForm.jsp";
				</script>
			<%
		}
	%>
	<%
		String select = request.getParameter("select");
		System.out.println("rootUpdateForm select : " + select);
		if (select.equals("updatePassword")) {
			System.out.println("update");
			String userId = request.getParameter("userId");
			String updatePassword = request.getParameter("userPassword");
			
			System.out.println(userId);
			System.out.println(updatePassword);
			
			UserDAO userDAO = new UserDAO();
			int result = userDAO.passwordUpdate(userId, updatePassword);
			if (result == 1) {
				%>
					<script type='text/javascript'>
						alert('비밀번호 변경 성공');
						location.href="rootUserInfoForm.jsp";
					</script>
				<%
			} else {
				%>
					<script type='text/javascript'>
						alert('비밀번호 변경 실패');
						location.href="rootUserInfoForm.jsp";
					</script>
				<%
			}
		} else if (select.equals("delete")) {
			System.out.println("delete");
			String userId = request.getParameter("userId");
			
			UserDAO userDAO = new UserDAO();
			int result = userDAO.delete(userId);
			if (result == 1) {
				%>
				<script type='text/javascript'>
					alert('회원 탈퇴 성공');
					location.href="rootUserInfoForm.jsp";
				</script>
				<%
			} else {
				%>
				<script type='text/javascript'>w
					alert('회원 탈퇴 실패');
					location.href="rootUserInfoForm.jsp";
				</script>
				<%
			}
		} else if (select.equals("boardDelete")) {
			System.out.println("boardDelete");
			String boardKey = request.getParameter("boardKey");
			
			BoardDAO boardDAO = new BoardDAO();
			int result = boardDAO.delete(boardKey);
			if (result == 1) {
				%>
				<script type='text/javascript'>
					alert('게시글 삭제 성공');
					location.href="rootBoardInfoForm.jsp";
				</script>
				<%
			} else {
				%>
				<script type='text/javascript'>
					alert('게시글 삭제 실패');
					location.href="rootBoardInfoForm.jsp";
				</script>
				<%
			}
		} else if (select.equals("commentDelete")) {
			System.out.println("commentDelete");
			Integer commentKey = Integer.parseInt(request.getParameter("commentKey"));
			
			CommentDAO commentDAO = new CommentDAO();
			int result = commentDAO.commentDelete(commentKey);
			if (result == 1) {
				%>
				<script type='text/javascript'>
					alert('댓글 삭제 성공');
					location.href="rootCommentInfoForm.jsp";
				</script>
				<%
			} else {
				%>
				<script type='text/javascript'>
					alert('댓글 삭제 실패');
					location.href="rootCommentInfoForm.jsp";
				</script>
				<%
			}
		}
	%>
</body>
</html>