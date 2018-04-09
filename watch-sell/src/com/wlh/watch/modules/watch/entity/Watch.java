package com.wlh.watch.modules.watch.entity;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.modules.sys.type.entity.Brand;
import com.wlh.watch.modules.sys.type.entity.Crowd;
import com.wlh.watch.modules.sys.type.entity.Movement;

public class Watch {
	private String id;//'腕表id'
	private String brandId;//品牌id
	private String crowdId;//人群id
	private String movementId;//机芯id
	private String promotionId;//促销id
	
	private String watchTitle;//'头信息'
	private String watchIntroduce;//'介绍'
	private String watchModel;//'型号'
	private String watchSerialNumber;//'序列号'
	private String watchOrgPrice;//'原价'
	private String watchPrePrice;//'现价'
	private int watchNumber;//'数量'
	private String watchMovement;//'机芯'
	private String watchShell;//'外壳'
	private String watchDial;//'表盘'
	private String watchStrap;//'表带'
	private String watchClasp;//'表扣'
	private String watchYear;//'年份'
	private String watchWeight;//'重量'
	private String watchWaterproof;//'防水'
	
	private List<MultipartFile> uploadFiles;//文件列表
	
	private String brandName;
	private String crowdName;
	private String movementName;
	private int gPrice;//小价格
	private int lPrice;//大价格
	
	
	private Page<Watch> page;
	
	private Brand brand;
	
	private Crowd crowd;
	
	private Movement movement;
	
	private List<WatchPicture> watchPicture;
	
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public Crowd getCrowd() {
		return crowd;
	}
	public void setCrowd(Crowd crowd) {
		this.crowd = crowd;
	}
	public Movement getMovement() {
		return movement;
	}
	public void setMovement(Movement movement) {
		this.movement = movement;
	}
	public List<WatchPicture> getWatchPicture() {
		return watchPicture;
	}
	public void setWatchPicture(List<WatchPicture> watchPicture) {
		this.watchPicture = watchPicture;
	}
	public List<MultipartFile> getUploadFiles() {
		return uploadFiles;
	}
	public void setUploadFiles(List<MultipartFile> uploadFiles) {
		this.uploadFiles = uploadFiles;
	}
	public Page<Watch> getPage() {
		return page;
	}
	public void setPage(Page<Watch> page) {
		this.page = page;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWatchTitle() {
		return watchTitle;
	}
	public void setWatchTitle(String watchTitle) {
		this.watchTitle = watchTitle;
	}
	public String getWatchIntroduce() {
		return watchIntroduce;
	}
	public void setWatchIntroduce(String watchIntroduce) {
		this.watchIntroduce = watchIntroduce;
	}
	public String getWatchModel() {
		return watchModel;
	}
	public void setWatchModel(String watchModel) {
		this.watchModel = watchModel;
	}
	public String getWatchSerialNumber() {
		return watchSerialNumber;
	}
	public void setWatchSerialNumber(String watchSerialNumber) {
		this.watchSerialNumber = watchSerialNumber;
	}
	public String getWatchOrgPrice() {
		return watchOrgPrice;
	}
	public void setWatchOrgPrice(String watchOrgPrice) {
		this.watchOrgPrice = watchOrgPrice;
	}
	public String getWatchPrePrice() {
		return watchPrePrice;
	}
	public void setWatchPrePrice(String watchPrePrice) {
		this.watchPrePrice = watchPrePrice;
	}
	public int getWatchNumber() {
		return watchNumber;
	}
	public void setWatchNumber(int watchNumber) {
		this.watchNumber = watchNumber;
	}
	public String getWatchMovement() {
		return watchMovement;
	}
	public void setWatchMovement(String watchMovement) {
		this.watchMovement = watchMovement;
	}
	public String getWatchShell() {
		return watchShell;
	}
	public void setWatchShell(String watchShell) {
		this.watchShell = watchShell;
	}
	public String getWatchDial() {
		return watchDial;
	}
	public void setWatchDial(String watchDial) {
		this.watchDial = watchDial;
	}
	public String getWatchStrap() {
		return watchStrap;
	}
	public void setWatchStrap(String watchStrap) {
		this.watchStrap = watchStrap;
	}
	public String getWatchClasp() {
		return watchClasp;
	}
	public void setWatchClasp(String watchClasp) {
		this.watchClasp = watchClasp;
	}
	public String getWatchYear() {
		return watchYear;
	}
	public void setWatchYear(String watchYear) {
		this.watchYear = watchYear;
	}
	public String getWatchWeight() {
		return watchWeight;
	}
	public void setWatchWeight(String watchWeight) {
		this.watchWeight = watchWeight;
	}
	public String getWatchWaterproof() {
		return watchWaterproof;
	}
	public void setWatchWaterproof(String watchWaterproof) {
		this.watchWaterproof = watchWaterproof;
	}
	public String getBrandId() {
		return brandId;
	}
	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}
	public String getCrowdId() {
		return crowdId;
	}
	public void setCrowdId(String crowdId) {
		this.crowdId = crowdId;
	}
	public String getMovementId() {
		return movementId;
	}
	public void setMovementId(String movementId) {
		this.movementId = movementId;
	}
	public String getPromotionId() {
		return promotionId;
	}
	public void setPromotionId(String promotionId) {
		this.promotionId = promotionId;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getCrowdName() {
		return crowdName;
	}
	public void setCrowdName(String crowdName) {
		this.crowdName = crowdName;
	}
	public String getMovementName() {
		return movementName;
	}
	public void setMovementName(String movementName) {
		this.movementName = movementName;
	}
	public int getgPrice() {
		return gPrice;
	}
	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}
	public int getlPrice() {
		return lPrice;
	}
	public void setlPrice(int lPrice) {
		this.lPrice = lPrice;
	}

}
