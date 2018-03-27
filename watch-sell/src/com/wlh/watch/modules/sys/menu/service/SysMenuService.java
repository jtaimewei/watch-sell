package com.wlh.watch.modules.sys.menu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wlh.watch.modules.sys.menu.dao.SysMenuDao;
import com.wlh.watch.modules.sys.menu.entity.SysMenu;

@Service
public class SysMenuService {
	@Resource
	private SysMenuDao sysMenuDao;
	
	public List<SysMenu> getByUserId(String id){
		return sysMenuDao.getByUserId(id);
	}

	public List<SysMenu> findAll() {
		return sysMenuDao.findAllList();
	}

	public void addMenu(SysMenu menu) {
		sysMenuDao.addMenu(menu);
	}

	public SysMenu getByMenuId(String id) {
		return sysMenuDao.getByMenuId(id);
	}

	public void editMenu(SysMenu menu) {
		sysMenuDao.editMenu(menu);
	}

	public void deleteMenu(String id) {
		sysMenuDao.deleteMenu(id);
	}

	public List<SysMenu> getByRoleId(String id) {
		// TODO Auto-generated method stub
		return sysMenuDao.getByRoleId(id);
	}

}
