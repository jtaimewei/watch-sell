package com.wlh.watch.modules.watch.entity;

public class WatchPicture {
	
	private String id;//id-64UUID
	private String watchId;//手表id
	private String pictureSrc;//图片地址
	private String pictureType;//图片类型，主图：0，附图：1
	private String pictureSort;//图片显示的 排序
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWatchId() {
		return watchId;
	}
	public void setWatchId(String watchId) {
		this.watchId = watchId;
	}
	public String getPictureSrc() {
		return pictureSrc;
	}
	public void setPictureSrc(String pictureSrc) {
		this.pictureSrc = pictureSrc;
	}
	public String getPictureType() {
		return pictureType;
	}
	public void setPictureType(String pictureType) {
		this.pictureType = pictureType;
	}
	public String getPictureSort() {
		return pictureSort;
	}
	public void setPictureSort(String pictureSort) {
		this.pictureSort = pictureSort;
	}
}
