package com.wlh.watch.modules.order.entity;

import java.util.Date;

public class OrderDetail {
	private String id;
	private String orderId;
	private String watchId;
	private String orderWatchSerialNumber;//手表序列号
	private String orderDetailOldPrice;//商品原价
	private String orderDetailDiscountPrice;//优惠价格
	private int orderWatchNumber;//产品数量
	private String orderDetailPicture;//产品主图
	private String orderDetailState;//订单产品详情状态：0-交易成功，1-退货
	private String orderDetailTime;//时间
	
	private String orderWatchTitle;//商品信息title 
	
	private String remarks;//评价
	
	private String watchSerialNumber;
	private int total;
	private Date orderTime;
	private Date startTime;
	private Date endTime;
	public String getWatchSerialNumber() {
		return watchSerialNumber;
	}
	public void setWatchSerialNumber(String watchSerialNumber) {
		this.watchSerialNumber = watchSerialNumber;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getWatchId() {
		return watchId;
	}
	public void setWatchId(String watchId) {
		this.watchId = watchId;
	}
	public String getOrderWatchSerialNumber() {
		return orderWatchSerialNumber;
	}
	public void setOrderWatchSerialNumber(String orderWatchSerialNumber) {
		this.orderWatchSerialNumber = orderWatchSerialNumber;
	}
	public String getOrderDetailOldPrice() {
		return orderDetailOldPrice;
	}
	public void setOrderDetailOldPrice(String orderDetailOldPrice) {
		this.orderDetailOldPrice = orderDetailOldPrice;
	}
	public String getOrderDetailDiscountPrice() {
		return orderDetailDiscountPrice;
	}
	public void setOrderDetailDiscountPrice(String orderDetailDiscountPrice) {
		this.orderDetailDiscountPrice = orderDetailDiscountPrice;
	}
	public int getOrderWatchNumber() {
		return orderWatchNumber;
	}
	public void setOrderWatchNumber(int orderWatchNumber) {
		this.orderWatchNumber = orderWatchNumber;
	}
	public String getOrderDetailPicture() {
		return orderDetailPicture;
	}
	public void setOrderDetailPicture(String orderDetailPicture) {
		this.orderDetailPicture = orderDetailPicture;
	}
	public String getOrderDetailState() {
		return orderDetailState;
	}
	public void setOrderDetailState(String orderDetailState) {
		this.orderDetailState = orderDetailState;
	}
	public String getOrderDetailTime() {
		return orderDetailTime;
	}
	public void setOrderDetailTime(String orderDetailTime) {
		this.orderDetailTime = orderDetailTime;
	}
	public String getOrderWatchTitle() {
		return orderWatchTitle;
	}
	public void setOrderWatchTitle(String orderWatchTitle) {
		this.orderWatchTitle = orderWatchTitle;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
}
