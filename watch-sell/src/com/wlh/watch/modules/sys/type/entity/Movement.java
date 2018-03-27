package com.wlh.watch.modules.sys.type.entity;

import com.wlh.watch.common.persistence.Page;

/**
 * 机芯-实体类
 * @author admin
 *
 */
public class Movement {
	private String id;
	private String movementName;//机芯名
	private Page<Movement> page;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMovementName() {
		return movementName;
	}
	public void setMovementName(String movementName) {
		this.movementName = movementName;
	}
	public Page<Movement> getPage() {
		return page;
	}
	public void setPage(Page<Movement> page) {
		this.page = page;
	}

	
}
