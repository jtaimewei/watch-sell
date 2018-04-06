package com.wlh.watch.modules.sys.reception.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wlh.watch.modules.sys.reception.dao.UserReceptionDao;
import com.wlh.watch.modules.sys.reception.entity.UserReception;

@Service
public class UserReceptionService {
	@Resource
	private UserReceptionDao userReceptionDao;

	public List<UserReception> findReception(String id) {
		return userReceptionDao.findReception(id);
	}

	public void saveReception(UserReception reception) {
		userReceptionDao.saveReception(reception);
	}

	public void deleteReception(UserReception reception) {
		userReceptionDao.deleteReception(reception);
	}

	public void editReception(UserReception reception) {
		userReceptionDao.editReception(reception);
	}

}
