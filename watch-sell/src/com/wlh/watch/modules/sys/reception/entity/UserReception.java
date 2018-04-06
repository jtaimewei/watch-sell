package com.wlh.watch.modules.sys.reception.entity;

public class UserReception {
	private String id;
	private String recName;//收货人名字
	private String recPhone;//收货人电话号码
	private String recAddress;//收货人地址
	private String userId;//用户id
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRecName() {
		return recName;
	}
	public void setRecName(String recName) {
		this.recName = recName;
	}
	public String getRecPhone() {
		return recPhone;
	}
	public void setRecPhone(String recPhone) {
		this.recPhone = recPhone;
	}
	public String getRecAddress() {
		return recAddress;
	}
	public void setRecAddress(String recAddress) {
		this.recAddress = recAddress;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	

}
