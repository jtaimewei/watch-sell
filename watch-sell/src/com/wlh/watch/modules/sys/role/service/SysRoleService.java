package com.wlh.watch.modules.sys.role.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wlh.watch.modules.sys.role.dao.SysRoleDao;
import com.wlh.watch.modules.sys.role.entity.SysRole;
@Service
public class SysRoleService {

	@Resource
	private SysRoleDao dao;
	
	
	public List<SysRole> findList() {
		return dao.findList();
	}
	
	public List<SysRole> getByUserId(String id) {
		
		return dao.getByUserId(id);
	}

	public void addRole(SysRole role) {
		dao.addRole(role);
	}

	public void addRoleMenu(Map<String, String> map) {
		dao.addRoleMenu(map);
	}

	public void deleteById(String id) {
		dao.deleteById(id);
	}

	public SysRole getById(String id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}

	public void deleteRoleMenu(Map<String, String> map) {
		dao.deleteRoleMenu(map);
	}

	public void editById(SysRole role) {
		dao.editById(role);
	}

	public void removeRoleUser(Map<String, String> map) {
		dao.removeRoleUser(map);
	}

}
