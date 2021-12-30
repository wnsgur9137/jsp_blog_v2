package jspProject_final.domain.board;

//import java.security.Timestamp;

public class BoardDTO {
	private Integer boardKey;
	private String userId;
	private String userName;
	private String boardTitle;
	private String boardContent;
	private Integer hits;
	private String boardCreated;
	private String listType;
	
	// 기본 생성자
	public BoardDTO() {}
	
	public BoardDTO(Integer boardKey, String userId, String userName, String boardTitle, String boardContent, Integer hits, String boardCreated, String listType) {
		this.boardKey = boardKey;
		this.userId = userId;
		this.userName = userName;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.hits = hits;
		this.boardCreated = boardCreated;
		this.listType = listType;
	}
	
	// 게터 세터
	public Integer getBoardKey() { return boardKey; }
	public void setBoardKey(Integer boardKey) { this.boardKey = boardKey; }
	
	public String getBoardTitle() { return boardTitle; }
	public void setBoardTitle(String boardTitle) { this.boardTitle = boardTitle; }
	
	public String getBoardContent() { return boardContent; }
	public void setBoardContent(String boardContent) { this.boardContent = boardContent; }
	
	public String getUserId() { return userId; }
	public void setUserId(String userId) { this.userId = userId; }
	
	public String getUserName() { return userName; }
	public void setUserName(String userName) { this.userName = userName; }
	
	public Integer getHits() { return hits; }
	public void setHits(Integer hits) { this.hits = hits; }
	
	public String getBoardCreated() { return boardCreated; }
	public void setBoardCreated(String boardCreated) { this.boardCreated = boardCreated; }
	
	public String getListType() { return listType; }
	public void setListType(String listType) { this.listType = listType; }
}
