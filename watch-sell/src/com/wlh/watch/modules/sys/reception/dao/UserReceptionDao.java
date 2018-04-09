package com.wlh.watch.modules.sys.reception.dao;

import java.util.List;

import com.wlh.watch.modules.sys.reception.entity.UserReception;

public interface UserReceptionDao {

	List<UserReception> findReception(String id);

	void saveReception(UserReception reception);

	void deleteReception(UserReception reception);

	void editReception(UserReception reception);

	UserReception getById(String id);

}
