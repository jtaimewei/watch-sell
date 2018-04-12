package com.wlh.watch.modules.watch.entity;

import org.springframework.web.multipart.MultipartFile;

public class WatchPicture {
	
	private String id;//id-64UUID
	private String watchId;//手表id
	private String pictureSrc;//图片地址
	private String pictureType;//图片类型，主图：0，附图：1
	private String pictureSort;//图片显示的 排序
	
	private MultipartFile uploadFile;//图片
	
	private MultipartFile uploadEditFile;//修改的图片
	
	private String editType;//修改图片时候的标识:删除标识
	
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
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getEditType() {
		return editType;
	}
	public void setEditType(String editType) {
		this.editType = editType;
	}
	public MultipartFile getUploadEditFile() {
		return uploadEditFile;
	}
	public void setUploadEditFile(MultipartFile uploadEditFile) {
		this.uploadEditFile = uploadEditFile;
	}
	
}
