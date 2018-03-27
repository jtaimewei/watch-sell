package com.wlh.watch.modules.watch.dao;

import java.util.List;

import com.wlh.watch.modules.watch.entity.Watch;

public interface WatchDao {

	long getCount(Watch watch);

	List<Watch> findList(Watch watch);

}
