package com.wlh.watch.modules.sys.type.entity;

import com.wlh.watch.common.persistence.Page;

/**
 * 品牌-实体类
 * @author admin
 *
 */
public class Brand {
	private String id;
	private String brandName;//品牌名
	
	private Page<Brand> page;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public Page<Brand> getPage() {
		return page;
	}

	public void setPage(Page<Brand> page) {
		this.page = page;
	}
	
	
	
	

}
