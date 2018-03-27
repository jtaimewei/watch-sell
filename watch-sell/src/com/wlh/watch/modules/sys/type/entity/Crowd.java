package com.wlh.watch.modules.sys.type.entity;

import com.wlh.watch.common.persistence.Page;

/**
 * 人群-实体类
 * @author admin
 *
 */
public class Crowd {
	private String id;
	private String crowdName;//人群名
	 
	private Page<Crowd> page;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCrowdName() {
		return crowdName;
	}

	public void setCrowdName(String crowdName) {
		this.crowdName = crowdName;
	}

	public Page<Crowd> getPage() {
		return page;
	}

	public void setPage(Page<Crowd> page) {
		this.page = page;
	}
	

	
	
}
