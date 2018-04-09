package com.wlh.watch.modules.sys.cart.entity;

import com.wlh.watch.modules.watch.entity.Watch;

public class WatchCart {
	
	private String id;//
	private int cartProductNumber;//购买数量
	private String cartCreateTime;//购物车创建时间
	private String cartState;//购物车状态
	private String watchId;//
	private String userId;
	
	private Watch watch;
	
	public Watch getWatch() {
		return watch;
	}
	public void setWatch(Watch watch) {
		this.watch = watch;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCartProductNumber() {
		return cartProductNumber;
	}
	public void setCartProductNumber(int cartProductNumber) {
		this.cartProductNumber = cartProductNumber;
	}
	public String getCartCreateTime() {
		return cartCreateTime;
	}
	public void setCartCreateTime(String cartCreateTime) {
		this.cartCreateTime = cartCreateTime;
	}
	public String getCartState() {
		return cartState;
	}
	public void setCartState(String cartState) {
		this.cartState = cartState;
	}
	public String getWatchId() {
		return watchId;
	}
	public void setWatchId(String watchId) {
		this.watchId = watchId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

}
