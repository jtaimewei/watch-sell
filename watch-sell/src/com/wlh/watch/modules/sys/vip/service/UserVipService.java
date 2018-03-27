package com.wlh.watch.modules.sys.vip.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wlh.watch.modules.sys.vip.dao.UserVipDao;
import com.wlh.watch.modules.sys.vip.entity.UserVip;

@Service
public class UserVipService {
	@Resource
	private UserVipDao userVipDao;
	
	public UserVip getByLevel(String level){
		return userVipDao.getByLevel(level);
	}

}
