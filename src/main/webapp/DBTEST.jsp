<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jspProject_final.database.DBConn" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM Users";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			System.out.printf("userName\tuserId\tuserPassword\tuserEmail\tuserCreated\n");
			System.out.printf("=====================================================================\n");
			
			while(rs.next()) {
				String userName = rs.getString(1);
				String userId = rs.getString(2);
				String userPassword = rs.getString(3);
				String userEmail = rs.getString(4);
				String userCreated = rs.getString(5);
				
				String result = userName+"\t"+userId+"\t"+userPassword+"\t"+userEmail+"\t"+userCreated+"\n";
				System.out.printf(result);
			}
		} catch(SQLException sqle) {
			System.out.println("연결 에러");
			sqle.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				System.out.println("finally 에러");
				System.out.println(e.getMessage());
			}
		}
 		
 	%>
</body>
</html>