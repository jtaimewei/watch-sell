package com.wlh.watch.modules.sys.comment.entity;

import com.wlh.watch.common.persistence.Page;

public class WatchComment {
	
	private String id;
	private String commentContent;//评论内容
	private String commentContentTime;//评论时间
	private String commentAnswer;//回复内容
	private String commentAnswerTime;//回复时间
	private String userName;//评论的用户名
	private String userId;//
	private String watchId;//
	
	private Page<WatchComment> page;

	public Page<WatchComment> getPage() {
		return page;
	}
	public void setPage(Page<WatchComment> page) {
		this.page = page;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentContentTime() {
		return commentContentTime;
	}
	public void setCommentContentTime(String commentContentTime) {
		this.commentContentTime = commentContentTime;
	}
	public String getCommentAnswer() {
		return commentAnswer;
	}
	public void setCommentAnswer(String commentAnswer) {
		this.commentAnswer = commentAnswer;
	}
	public String getCommentAnswerTime() {
		return commentAnswerTime;
	}
	public void setCommentAnswerTime(String commentAnswerTime) {
		this.commentAnswerTime = commentAnswerTime;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getWatchId() {
		return watchId;
	}
	public void setWatchId(String watchId) {
		this.watchId = watchId;
	}
	
}
