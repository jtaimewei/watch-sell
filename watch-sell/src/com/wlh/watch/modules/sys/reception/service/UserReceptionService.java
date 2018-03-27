package com.wlh.watch.modules.sys.reception.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wlh.watch.modules.sys.reception.dao.UserReceptionDao;

@Service
public class UserReceptionService {
	@Resource
	private UserReceptionDao userReceptionDao;

}
