package com.wlh.watch.modules.watch.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.modules.watch.dao.WatchDao;
import com.wlh.watch.modules.watch.entity.Watch;

@Service
public class WatchService {
	
	@Resource
	private WatchDao watchDao;

	public Page<Watch> findPage(Page<Watch> page, Watch watch) {
		watch.setPage(page);
		page.setCount(watchDao.getCount(watch));
		page.setList(watchDao.findList(watch));
		return page;
	}

}
