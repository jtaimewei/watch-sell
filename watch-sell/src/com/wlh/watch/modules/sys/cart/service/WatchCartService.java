package com.wlh.watch.modules.sys.cart.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wlh.watch.modules.sys.cart.dao.WatchCartDao;
import com.wlh.watch.modules.sys.cart.entity.WatchCart;

@Service
public class WatchCartService {
	
	@Resource
	private WatchCartDao watchCartDao;

	public void addCart(WatchCart watchCart) {
		watchCartDao.addCart(watchCart);
	}

	public List<WatchCart> findCart(String id) {
		return watchCartDao.findCart(id);
	}

	public void cleanCart(String id) {
		watchCartDao.cleanCart(id);
	}

}
