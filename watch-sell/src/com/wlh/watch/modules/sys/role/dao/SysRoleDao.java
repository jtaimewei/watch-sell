package com.wlh.watch.modules.sys.role.dao;

import java.util.List;
import java.util.Map;

import com.wlh.watch.modules.sys.role.entity.SysRole;

public interface SysRoleDao {

	List<SysRole> findList();

	List<SysRole> getByUserId(String id);

	void addRole(SysRole role);

	void addRoleMenu(Map<String, String> map);

	void deleteById(String id);

	SysRole getById(String id);

	void deleteRoleMenu(Map<String, String> map);

	void editById(SysRole role);

	void removeRoleUser(Map<String, String> map);

}
