<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="jspProject_final.database.DBConn" %>
<%@ page import="jspProject_final.domain.comment.Comment" %>
<%@ page import="jspProject_final.domain.comment.CommentDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>blog-root-commentInfo</title>
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
	
	<jsp:include page="../layout/header.jsp"/>
	
	<div class="titleDiv">
		<h3>댓글 목록</h3><br><hr>
		<table class="tabel table-condensed" border="1" style="text-align:center; width:100%">
			<tr>
				<td>COMMENTKEY</td><td>BOARDKEY</td><td>USERID</td><td>USERNAME</td><td>CONTENT</td><td>CREATED</td><td>DELETE</td>
			</tr>
			<%
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "SELECT * FROM Comments";
				try {
					conn = DBConn.getConnection();
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						out.println("<tr><td>");
						String commentKey = String.valueOf(rs.getInt("commentKey"));
						String commentBoardKey = String.valueOf(rs.getInt("commentBoardKey"));
						String commentUserId = rs.getString("commentUserId");
						String commentUserName = rs.getString("commentUserName");
						String commentContent = rs.getString("commentContent");
						String commentCreated = rs.getString("commentCreated");
						
						out.println(commentKey + "</td><td>");
						out.println(commentBoardKey + "</td><td>");
						out.println(commentUserId + "</td><td>");
						out.println(commentUserName + "</td><td>");
						out.println(commentContent + "</td><td>");
						out.println(commentCreated + "</td><td>");
						
						out.println("<form action='rootUpdate.jsp' method='post'>");
						out.println("<input type='hidden' name='select' value='commentDelete'/>");
						out.println("<input type='hidden' name='commentKey' value='" + commentKey + "'/>");
						out.println("<input type='submit' value='댓글 삭제'/>");
						out.println("</form> </td></tr>");
					}
					
				} catch(Exception e) {
					System.out.println("DB연결 실패(rootCommentInfoForm.jsp)");
					System.out.println(e.getMessage());
				} finally {
					try {
						if(rs != null) rs.close();
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					} catch(Exception e) {
						System.out.println("DB연결 해제 실패(rootCommentInfoForm.jsp)");
						System.out.println(e.getMessage());
					}
				}
			%>
		</table>
	</div>
</body>
</html>