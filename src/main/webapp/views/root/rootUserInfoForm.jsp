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
<title>blog-root-userInfo</title>
<style>
	
	td {
		border : solid 1px;
	}
	
	table {
		border : solid 1px;
	}
</style>
</head>
<body>
	<% // 관리자 계정이 아닐 시
		String sessionUserId = (String)session.getAttribute("userId");
		System.out.println(sessionUserId);
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
	<h3>유저 목록</h3><br><hr>
	<table  class="table table-condensed" border="1" style="text-align:center; width:100%;">
		<tr>
			<td>NAME</td><td>ID</td><td>PASSWORD</td><td>EMAIL</td><td>CREATED</td><td>UPDATE</td><td>DELETE</td>
		</tr>
		<%
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM Users";
			try {
				conn = DBConn.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					out.println("<tr><td>");
					String userName = rs.getString("userName");
					String userId = rs.getString("userId");
					if (userId.equals("root")) continue; // root 계정은 표시 X
					String userPassword = rs.getString("userPassword");
					String userEmail = rs.getString("userEmail");
					String userCreated = rs.getString("userCreated");
					
					out.println(userName + "</td><td>");
					out.println(userId + "</td><td>");
					out.println(userPassword + "</td><td>");
					out.println(userEmail + "</td><td>");
					out.println(userCreated + "</td><td>");
					
					
					out.println("<form action='inputPassword.jsp' method='post'>");
					out.println("<input type='hidden' name='select' value='updatePassword'/>");
					out.println("<input type='hidden' name='userId' value='" + userId + "'/>");
					out.println("<input type='submit' value='비밀번호 변경'/>");
					out.println("</form> </td><td>");
					
					out.println("<form action='rootUpdate.jsp' method='post'>");
					out.println("<input type='hidden' name='select' value='delete'/>");
					out.println("<input type='hidden' name='userId' value='" + userId + "'/>");
					out.println("<input type='submit' value='회원 탈퇴'/>");
					out.println("</form> </td></tr>");
					
				}
				
			} catch(Exception e) {
				System.out.println("DB 연결 실패 (rootUserInfo.jsp)");
				System.out.println(e.getMessage());
			} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) rs.close();
					if(conn != null) rs.close();
				} catch(Exception e) {
					System.out.println("DB연결 해제 실패 (rootUserInfo.jsp)");
					System.out.println(e.getMessage());
				}
			}
		
		%>
	</table>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>