package com.wlh.watch.modules.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.modules.user.dao.UserDao;
import com.wlh.watch.modules.user.entity.User;

@Service
public class UserService {
	@Resource
	private UserDao userDao;

	public User getByEmail(User user) {
		return userDao.getByEmail(user);
	}

	public void editBack(User user) {
		userDao.editBack(user);
	}

	public Page<User> findPage(Page<User> page, User user) {
		page.setNumber((page.getPageNo()-1)*page.getPageSize());
		user.setPage(page);
		page.setCount(userDao.getCount(user));
		page.setList(userDao.findList(user));
		return page;
	}

	public void addUser(User user) {
		userDao.addUser(user);
	}

	public User getById(String id) {
		return userDao.getById(id);
	}
	//添加 用户-角色  
	public void addUserRole(User user3) {
		userDao.addUserRole(user3);
	}
	//删除 用户-角色
	public void deleteUserRole(User user3) {
		userDao.deleteUserRole(user3);
	}

	public void deleteUser(String id) {
		userDao.deleteUser(id);
	}

	public void deleteUserRoles(String id) {
		userDao.deleteUserRoles(id);
	}

	public List<User> findUserByRoleId(String id) {
		return userDao.findUserByRoleId(id);
	}

	public Page<User> findRoleUserPage(Page<User> page, User user) {
		user.setPage(page);
		page.setCount(userDao.getRoleUserCount(user));
		page.setList(userDao.findRoleUserList(user));
		return page;
	}

	public void editPassword(User user) {
		userDao.editPassword(user);
	}

}
