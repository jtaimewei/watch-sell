package com.wlh.watch.modules.watch.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.modules.watch.dao.WatchDao;
import com.wlh.watch.modules.watch.entity.Watch;
import com.wlh.watch.modules.watch.entity.WatchPicture;

@Service
public class WatchService {
	
	@Resource
	private WatchDao watchDao;

	public Page<Watch> findPage(Page<Watch> page, Watch watch) {
		page.setNumber((page.getPageNo()-1)*page.getPageSize());
		watch.setPage(page);
		page.setCount(watchDao.getCount(watch));
		page.setList(watchDao.findList(watch));
		return page;
	}

	public void addWatch(Watch watch) {
		watchDao.addWatch(watch);
	}

	public void addWatchPicture(List<WatchPicture> wps) {
		watchDao.addWatchPicture(wps);
	}

	public Watch getById(String id) {
		return watchDao.getById(id);
	}

	public void deletePictureById(String id) {
		watchDao.deletePictureById(id);
	}

	public void editWatch(Watch watch) {
		watchDao.editWatch(watch);
	}

	public void deletePictureByPicture(WatchPicture wap) {
		watchDao.deletePictureByPicture(wap);
	}

	public Page<Watch> findForePage(Page<Watch> page, Watch watch) {
		page.setNumber((page.getPageNo()-1)*page.getPageSize());
		watch.setPage(page);
		page.setCount(watchDao.getForeCount(watch));
		page.setList(watchDao.findForeList(watch));
		return page;
	}

	public Watch getForeById(String id) {
		return watchDao.getForeById(id);
	}

}
