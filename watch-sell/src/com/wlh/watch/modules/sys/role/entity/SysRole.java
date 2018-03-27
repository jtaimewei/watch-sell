package com.wlh.watch.modules.sys.role.entity;

import java.util.List;

import com.wlh.watch.modules.sys.menu.entity.SysMenu;

public class SysRole {
	private String id;
	private String roleName;
	private List<SysMenu> menus;
	
	private String menuId;
	
	
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public List<SysMenu> getMenus() {
		return menus;
	}
	public void setMenus(List<SysMenu> menus) {
		this.menus = menus;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	
	

}
