package com.wlh.watch.modules.order.entity;

import java.util.List;

import com.wlh.watch.common.persistence.Page;

public class Order {
	
	private String id;
	private String userId;
	private String userName;
	private String orderNumber;//订单编号
	private String orderTradeNumber;//交易号
	private String orderCreateTime;//订单创建时间
	private String orderPayTime;//订单支付时间
	private String orderSendTime;//发货时间
	private String orderCloseTime;//订单完成时间
	private int orderAllPrice;//订单总价
	private int orderDiscount;//订单优惠金额
	private int orderSendPrice;//邮费
	private String orderGetName;//收货人
	private String orderGetAddress;//收货地址
	private String orderGetPhone;//收货人电话
	
	List<OrderDetail> orderDetail;
	
	private Page<Order> page;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getOrderTradeNumber() {
		return orderTradeNumber;
	}

	public void setOrderTradeNumber(String orderTradeNumber) {
		this.orderTradeNumber = orderTradeNumber;
	}

	public String getOrderCreateTime() {
		return orderCreateTime;
	}

	public void setOrderCreateTime(String orderCreateTime) {
		this.orderCreateTime = orderCreateTime;
	}

	public String getOrderPayTime() {
		return orderPayTime;
	}

	public void setOrderPayTime(String orderPayTime) {
		this.orderPayTime = orderPayTime;
	}

	public String getOrderSendTime() {
		return orderSendTime;
	}

	public void setOrderSendTime(String orderSendTime) {
		this.orderSendTime = orderSendTime;
	}

	public String getOrderCloseTime() {
		return orderCloseTime;
	}

	public void setOrderCloseTime(String orderCloseTime) {
		this.orderCloseTime = orderCloseTime;
	}

	public int getOrderAllPrice() {
		return orderAllPrice;
	}

	public void setOrderAllPrice(int orderAllPrice) {
		this.orderAllPrice = orderAllPrice;
	}

	public int getOrderDiscount() {
		return orderDiscount;
	}

	public void setOrderDiscount(int orderDiscount) {
		this.orderDiscount = orderDiscount;
	}

	public int getOrderSendPrice() {
		return orderSendPrice;
	}

	public void setOrderSendPrice(int orderSendPrice) {
		this.orderSendPrice = orderSendPrice;
	}

	public String getOrderGetName() {
		return orderGetName;
	}

	public void setOrderGetName(String orderGetName) {
		this.orderGetName = orderGetName;
	}

	public String getOrderGetAddress() {
		return orderGetAddress;
	}

	public void setOrderGetAddress(String orderGetAddress) {
		this.orderGetAddress = orderGetAddress;
	}

	public String getOrderGetPhone() {
		return orderGetPhone;
	}

	public void setOrderGetPhone(String orderGetPhone) {
		this.orderGetPhone = orderGetPhone;
	}

	public Page<Order> getPage() {
		return page;
	}

	public void setPage(Page<Order> page) {
		this.page = page;
	}

	public List<OrderDetail> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(List<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}

}
