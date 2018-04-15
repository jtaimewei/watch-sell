package com.wlh.watch.modules.sys.message.entity;

/**
 * 聊天记录信息类
 * @author admin
 *
 */
public class Message {
	private String id;
    private String fromWho;
    private String toWho;
    private String messageText;
    private String messageDate;
    
    private int friendMessage;//0：表示普通消息 1：表示好友请求消息

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFromWho() {
		return fromWho;
	}

	public void setFromWho(String fromWho) {
		this.fromWho = fromWho;
	}

	public String getToWho() {
		return toWho;
	}

	public void setToWho(String toWho) {
		this.toWho = toWho;
	}

	public String getMessageText() {
		return messageText;
	}

	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}

	public String getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}

	public int getFriendMessage() {
		return friendMessage;
	}

	public void setFriendMessage(int friendMessage) {
		this.friendMessage = friendMessage;
	}
    
}
