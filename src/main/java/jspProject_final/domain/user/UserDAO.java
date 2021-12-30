package jspProject_final.domain.user;

import jspProject_final.database.DBConn;
import java.sql.*;

public class UserDAO {
	
	public UserDAO() {}
	
	public User login(String userId, String userPassword) {
		User user = new User();
		String sql = "SELECT userName, userId, userPassword, userEmail, userCreated FROM Users WHERE userId = ? AND userPassword = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPassword);
			System.out.println("userId : " + userId);
			System.out.println("userPassword : " + userPassword);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("getString('userid')" + rs.getString("userId"));
				System.out.println("getString('userPassword')" + rs.getString("userPassword"));
				System.out.println("getString('userName')" + rs.getString("userName"));
				if(userId.equals(rs.getString("userId")) == true && userPassword.equals(rs.getString("userPassword")) == true) {
					System.out.println("로그인 성공");
					user.setUserName(rs.getString("userName"));
					user.setUserId(rs.getString("userId"));
					user.setUserPassword(rs.getString("userPassword"));
					user.setUserEmail(rs.getString("userEmail"));
					user.setUserCreated(rs.getString("userCreated"));
					System.out.println("user 추가 완료" + user);
				}
			} else {
				System.out.println("정보가 정확하지 않습니다.");
				user = null;
			}
			
		} catch (Exception e) {
			System.out.println("UserDAO login() 에러");
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				return user;
			} catch(Exception e) {
				System.out.println("DB 연결 종료 에러 (UserDAO-login())");
			}
		}
		return user;
	}
	
	public int passwordCheck(String userId, String userPassword) {
		String sql = "SELECT userId, userPassword FROM Users WHERE userId = ? AND userPassword = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = -1;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPassword);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if (userId.equals(rs.getString(1)) == true && userPassword.equals(rs.getString(2)) == true) {
					System.out.println("비밀번호 체크 성공");
					result = 1;
				} else {
					System.out.println("비밀번호 불일치");
				}
			}
		} catch (Exception e) {
			System.out.println("비밀번호 체크 실패");
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				return result;
			} catch(Exception e) {
				System.out.println("DB연결 헤제 실패 (UserDAO - passwordCheck())");
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	public int passwordUpdate(String userId, String updatePassword) {
		String sql = "UPDATE Users SET userPassword = ? WHERE userId = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = -1;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, updatePassword);
			pstmt.setString(2, userId);
			
			rs = pstmt.executeQuery();
			result = 1;
		} catch (Exception e) {
			System.out.println("비밀번호 업데이트 실패(UserDAO - passwordUpdate()");
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) pstmt.close();
				return result;
			} catch (Exception e) {
				System.out.println("DB 연결 해제 실패 (UserDAO - passwordUpdate())");
				System.out.println(e.getMessage());
			}
		}
		
		
		return result;
	}
	
	public int delete(String userId) {
		String sql = "DELETE FROM Users WHERE userId = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = -1;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			result = 1;
		} catch (Exception e) {
			System.out.println("계정 삭제 실패 (UserDAO - delete())");
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				System.out.println("DB 연결 해제 실패 (UserDAO - delete())");
				System.out.println(e.getMessage());
			}
		}
		
		return result;
	}
	
	public int idCheck(String userId) {
		
		String sql = "SELECT * FROM Users WHERE userId = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			System.out.println("======================");
			System.out.println("sql : " + sql);
			System.out.println("======================");
			
			if(rs.next()) {
				System.out.println(rs.getString(1));
				if(userId.equals(rs.getString(1)) == true) {
					System.out.println("====아이디 중복=====");
					result = -1;
				} else {
					result = 1;
				}
			} else {
				result = 1;
			}
			
		} catch (Exception e) {
			System.out.println("UserDAO check() 에러");
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				return result;
			} catch(Exception e) {
				System.out.println("DB 연결 종료 에러(UserDAO-join())");
			}
		}
		
		return -1;
	}
	
	public int join(User data) {
		
//		DBConn conn = new DBConn();
//		String sql = "INSERT INTO Users VALUES ("; 
//		sql += "'" + user.getUserName() + "', ";
//		sql += "'" + user.getUserId() + "', ";
//		sql += "'" + user.getUserPassword() + "', ";
//		sql += "'" + user.getUserEmail() + "', ";
//		sql += "'" + user.getUserCreated() + "')";
		
		String sql = "INSERT INTO Users VALUES (?, ?, ?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = -1;
		
		try {
			User user = (User) data;
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getUserId());
			pstmt.setString(3, user.getUserPassword());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserCreated());
			
			rs = pstmt.executeQuery();
			result = 1;
		} catch (Exception e) {
			System.out.println("UserDAO join()에러");
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				return result;
			} catch(Exception e) {
				System.out.println("DB 연결 종료 에러(UserDAO-join())");
			}
		}
		return result;
	}
	
	
}
