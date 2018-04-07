package com.wlh.watch.modules.user.dao;

import java.util.List;

import com.wlh.watch.modules.user.entity.User;

public interface UserDao {
	
	public User getByEmail(User user);

	public void editBack(User user);

	public List<User> findList(User user);

	public long getCount(User user);

	public User getById(String id);

	public void addUser(User user);

	public void addUserRole(User user3);

	public void deleteUserRole(User user3);

	public void deleteUser(String id);

	public void deleteUserRoles(String id);

	public List<User> findUserByRoleId(String id);

	public long getRoleUserCount(User user);

	public List<User> findRoleUserList(User user);

	public void editPassword(User user);

}
