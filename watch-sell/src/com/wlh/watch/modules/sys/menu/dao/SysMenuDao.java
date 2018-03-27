package com.wlh.watch.modules.sys.menu.dao;

import java.util.List;

import com.wlh.watch.modules.sys.menu.entity.SysMenu;

public interface SysMenuDao {

	public List<SysMenu> getByUserId(String id);

	public List<SysMenu> findAllList();

	public void addMenu(SysMenu menu);

	public SysMenu getByMenuId(String id);

	public void editMenu(SysMenu menu);

	public void deleteMenu(String id);

	public List<SysMenu> getByRoleId(String id);

}
