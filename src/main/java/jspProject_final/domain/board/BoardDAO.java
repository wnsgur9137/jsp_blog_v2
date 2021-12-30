package jspProject_final.domain.board;

import jspProject_final.database.DBConn;
import java.sql.*;
import java.util.ArrayList;

public class BoardDAO {
	
	public BoardDAO() {}
	
	public int save(Board data) {
		
		String sql = "INSERT INTO Boards VALUES (boards_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
		// board_seq.NEXTVAL = 지정된 시퀀스 board_seq의 다음 숫자를 입력한다.
		// board_seq는 CREATE SEQUENCE boards_seq START WITH 1 INCREMENT BY 1 MAXVALUE 200 CYCLE NOCACHE;
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		try {
			Board board = (Board) data;
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, board.getUserId());
			pstmt.setString(2, board.getUserName());
			pstmt.setString(3, board.getBoardTitle());
			pstmt.setString(4, board.getBoardContent());
			pstmt.setInt(5, board.getHits());
			pstmt.setString(6, board.getBoardCreated());
			pstmt.setString(7, board.getListType());
			
			rs = pstmt.executeQuery();
			result = 1;
		} catch(Exception e) {
			System.out.println("BoardDAO save() 에러");
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				return result;
			} catch(Exception e) {
				System.out.println("DB 연결 종료 에러(BoardDAO-save()");
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	public int update(String Key, String boardTitle, String boardContent) {
		String sql = "UPDATE boards SET boardTitle = ?, boardContent = ? WHERE boardKey = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int boardKey = Integer.parseInt(Key);
		System.out.println(boardKey);
		
		int result = -1;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardTitle);
			pstmt.setString(2, boardContent);
			pstmt.setInt(3, boardKey);
			rs = pstmt.executeQuery();
			result = 1;
		} catch(Exception e) {
			System.out.println("update 오류");
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch(Exception e) {
				System.out.println("DB 연결 해제 오류 (BoardDAO-update())");
				System.out.println(e.getMessage());
			}
		}
		System.out.println(result);
		return result;
	}
	
	public int delete(String Key) {
		String sql = "DELETE FROM Boards WHERE boardKey = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int boardKey = Integer.parseInt(Key);
		
		int result = -1;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardKey);
			rs = pstmt.executeQuery();
			result = 1;
		} catch(Exception e) {
			System.out.println("계정 삭제 실패 (BoardDAO - delete())");
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				System.out.println("DB 연결 종료 에러(BoardDAO-delete())");
				System.out.println(e.getMessage());
			}
		}
		
		return result;
	}
	
	public ArrayList<Board> getList(int pageNumber, String listType) {
//		String sql = "SELECT * FROM boards ORDER BY boardKey LIMIT ?, 5";
		String sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM, A.* FROM boards A WHERE ROWNUM <= ? ) WHERE RNUM > ? AND listType = ? ORDER BY boardKey ASC";
		ArrayList<Board> list = new ArrayList<Board>();
		
		if (listType.equals("all")) {
			System.out.println("111");
			sql = "SELECT * FROM ( SELECT ROWNUM AS RNUM, A.* FROM boards A WHERE ROWNUM <= ? ) WHERE RNUM > ? ORDER BY boardKey ASC";
		}
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			int page = 5;
			pstmt.setInt(1, 0 + pageNumber * page + page);
			pstmt.setInt(2, 0 + pageNumber * page);
			if (!listType.equals("all")) pstmt.setString(3, listType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("list 추가 시작");
				Board board = new Board();
				board.setBoardKey(rs.getInt("boardKey"));
				board.setUserId(rs.getString("userId"));
				board.setUserName(rs.getString("userName"));
				board.setBoardTitle(rs.getString("boardTitle"));
				board.setBoardContent(rs.getString("boardContent"));
				board.setBoardCreated(rs.getString("boardCreated"));
				board.setHits(rs.getInt("hits"));
				board.setBoardCreated(rs.getString("boardCreated"));
				board.setListType(rs.getString("listType"));
				list.add(board);
				System.out.println("list 추가 완료");
			}
			
		} catch(Exception e) {
			System.out.println("리스트 불러오기 실패(BoardDAO - getList())");
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				System.out.println("DB 연결 종료 에러(BoardDAO-getList())");
				System.out.println(e.getMessage());
			}
		}
		return list;
	}
	
	public BoardDTO content(int boardKey) {
		BoardDTO boardDTO = new BoardDTO();
		String sql = "SELECT * FROM Boards WHERE boardKey = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardKey);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boardDTO.setBoardKey(rs.getInt("boardKey"));
				boardDTO.setUserId(rs.getString("userId"));
				boardDTO.setUserName(rs.getString("userName"));
				boardDTO.setBoardTitle(rs.getString("boardTitle"));
				boardDTO.setBoardContent(rs.getString("boardContent"));
				boardDTO.setHits(rs.getInt("hits"));
				boardDTO.setBoardCreated(rs.getString("boardCreated"));
				System.out.println("boardDTO 입력 성공");
			}
		} catch(Exception e) {
			System.out.println("상세보기 에러 (BoardDAO - content())");
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				return boardDTO;
			} catch (Exception e) {
				System.out.println("DB 연결 해제 오류");
				System.out.println(e.getMessage());
			}
		} 
		return null;
	}
	
	public ArrayList<Board> getSearchList(String searchType, String searchName) {
		String sql = "";
		if(searchType.equals("title")) {
			sql = "SELECT * FROM boards WHERE boardTitle LIKE ? ORDER BY boardKey ASC";
		} else if(searchType.equals("userName")) {
			sql = "SELECT * FROM boards WHERE userName LIKE ? ORDER BY boardKey ASC";
		} else if(searchType.equals("userId")) {
			sql = "SELECT * FROM boards WHERE userId LIKE ? ORDER BY boardKey ASC";
		} else if(searchType.equals("content")) {
			sql = "SELECT * FROM boards WHERE boardContent LIKE ? ORDER BY boardKey ASC";
		}
		String searchText = "%"+searchName+"%";
		System.out.println(sql);
		System.out.println(searchText);
		
		ArrayList<Board> list = new ArrayList<Board>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchText);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("list 추가 시작");
				Board board = new Board();
				board.setBoardKey(rs.getInt("boardKey"));
				board.setUserId(rs.getString("userId"));
				board.setUserName(rs.getString("userName"));
				board.setBoardTitle(rs.getString("boardTitle"));
				board.setBoardContent(rs.getString("boardContent"));
				board.setBoardCreated(rs.getString("boardCreated"));
				board.setHits(rs.getInt("hits"));
				board.setBoardCreated(rs.getString("boardCreated"));
				board.setListType(rs.getString("listType"));
				list.add(board);
				System.out.println("list 추가 완료");
			}
		} catch(Exception e) {
			System.out.println("DB 에러(BoardDAO-getSearchList())");
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				System.out.println("DB 연결 종료 에러(BoardDAO-getSearchList())");
				System.out.println(e.getMessage());
			}
		}
		return list;
	}
}
