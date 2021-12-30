package jspProject_final.domain.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jspProject_final.database.DBConn;

public class CommentDAO {
	public CommentDAO() {}
	
	public int save(Comment data) {
		String sql = "INSERT INTO comments VALUES(comment_seq.NEXTVAL, ?, ?, ?, ?, ?)";
		// CREATE SEQUENCE comment_seq START WITH 1 INCREMENT BY 1 MAXVALUE 500 NOCYCLE NOCACHE;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = -1;
		try {
			Comment comment = (Comment) data;
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, comment.getCommentBoardKey());
			pstmt.setString(2, comment.getCommentUserId());
			pstmt.setString(3, comment.getCommentUserName());
			pstmt.setString(4, comment.getCommentContent());
			pstmt.setString(5, comment.getCommentCreated());
			
			rs = pstmt.executeQuery();
			result = 1;
			System.out.println("댓글 작성 성공");
		} catch(Exception e) {
			System.out.println("comment Save 실패(ConentDAO - save())");
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				System.out.println("DB 연결 해제 오류(CommentDAO - save())");
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	public ArrayList<Comment> getCommentList(int boardKey) {
		ArrayList<Comment> commentList = new ArrayList<Comment>();
		String sql = "SELECT * FROM comments WHERE commentboardKey = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardKey);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("commentList 추가 시작");
				Comment comment = new Comment();
				comment.setCommentKey(rs.getInt("commentKey"));
				comment.setCommentBoardKey(rs.getInt("commentBoardKey"));
				comment.setCommentUserId(rs.getString("commentUserId"));
				comment.setCommentUserName(rs.getString("commentUserName"));
				comment.setCommentContent(rs.getString("commentContent"));
				comment.setCommentCreated(rs.getString("commentCreated"));
				commentList.add(comment);
				System.out.println("contentList 추가 완료");
			}
		} catch(Exception e) {
			System.out.println("댓글리스트 불러오기 실패(CommentDAO - getCommentList())");
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch(Exception e) {
				System.out.println("DB 연결 해제 오류(CommentDAO - getCommentList())");
				System.out.println(e.getMessage());
			}
		}
		return commentList;
	}
	
	public int commentUpdate(String boardKey) {
		
		int result = -1;
		return result;
	}
	
	
	public int commentDelete(int commentKey) {
		System.out.println("commentKey : " + commentKey);
		String sql = "DELETE FROM comments WHERE commentKey = ? ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = -1;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentKey);
			rs = pstmt.executeQuery();
			result = 1;
		} catch(Exception e) {
			System.out.println("commentDelete 실패 (CommentDAO - commentDelete())");
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch(Exception e) {
				System.out.println("DB 연결 해제 오류(CommentDAO - commentDelete()");
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
}
