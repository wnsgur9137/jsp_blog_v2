<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="jspProject_final.database.DBConn" %>
<%@ page import="jspProject_final.domain.user.User" %>
<%@ page import="jspProject_final.domain.user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>blog-root-boardInfo</title>
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
		<h3>게시글 목록</h3><br><hr>
		<table class="table table-condensed" border="1" style="text-align:center; width:100%">
			<tr>
				<td>BOARDKEY</td><td>BOARDTITLE</td><!-- <td>BOARDCONTENT</td> --><td>USERID</td><td>USERNAME</td><td>HITS</td><td>BOARDCREATED</td><td>DELETE</td>
			</tr>
			<%
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "SELECT * FROM Boards";
				try {
					conn = DBConn.getConnection();
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						out.println("<tr><td>");
						String boardKey = String.valueOf(rs.getInt("boardKey"));
						String boardTitle = rs.getString("boardTitle");
						/* String boardContent = rs.getString("boardContent"); */
						String userId = rs.getString("userId");
						String userName = rs.getString("userName");
						String hits = String.valueOf(rs.getString("hits"));
						String boardCreated = rs.getString("boardCreated");
						
						out.println(boardKey + "</td><td>");
						out.println(boardTitle + "</td><td>");
						/* out.println(boardContent + "</td><td>"); */
						out.println(userId + "</td><td>");
						out.println(userName + "</td><td>");
						out.println(hits + "</td><td>");
						out.println(boardCreated + "</td><td>");
						
						out.println("<form action='rootUpdate.jsp' method='post'>");
						out.println("<input type='hidden' name='select' value='boardDelete'/>");
						out.println("<input type='hidden' name='boardKey' value='" + boardKey + "'/>");
						out.println("<input type='submit' value='게시글 삭제'/>");
						out.println("</form> </td></tr>");
						
					}
					
				} catch(Exception e) {
					System.out.println("DB 연결 실패 (rootBoardInfo.jsp)");
					System.out.println(e.getMessage());
				} finally {
					try {
						if(rs != null) rs.close();
						if(pstmt != null) rs.close();
						if(conn != null) rs.close();
					} catch(Exception e) {
						System.out.println("DB연결 해제 실패 (rootBoardInfo.jsp)");
						System.out.println(e.getMessage());
					}
				}
			
			%>
		</table>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>