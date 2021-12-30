package jspProject_final.domain.comment;

public class Comment {
	private Integer commentKey;
	private Integer commentBoardKey;
	private String commentUserId;
	private String commentUserName;
	private String commentContent;
	private String CommentCreated;
	
	public Comment() {}
	
	public Comment(Integer commentKey, Integer commentBoardKey, String commentUserId, String commentUserName, String commentContent, String commentCreated) {
		this.commentKey = commentKey;
		this.commentBoardKey = commentBoardKey;
		this.commentUserId = commentUserId;
		this.commentUserName = commentUserName;
		this.commentContent = commentContent;
		this.CommentCreated = commentCreated;
	}
	
	public Integer getCommentKey() { return commentKey; }
	public void setCommentKey(Integer commentKey) { this.commentKey = commentKey; 
	}
	public Integer getCommentBoardKey() { return commentBoardKey; }
	public void setCommentBoardKey(Integer commentBoardKey) { this.commentBoardKey = commentBoardKey; }
	
	public String getCommentUserId() { return commentUserId; }
	public void setCommentUserId(String commentUserId) { this.commentUserId = commentUserId; }

	public String getCommentUserName() { return commentUserName; }
	public void setCommentUserName(String commentUserName) { this.commentUserName = commentUserName; }
	
	public String getCommentContent() { return commentContent; }
	public void setCommentContent(String commentContent) { this.commentContent = commentContent; }
	
	public String getCommentCreated() { return CommentCreated; }
	public void setCommentCreated(String commentCreated) { CommentCreated = commentCreated; }
}
