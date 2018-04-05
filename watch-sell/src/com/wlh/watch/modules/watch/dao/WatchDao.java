package com.wlh.watch.modules.watch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wlh.watch.modules.watch.entity.Watch;
import com.wlh.watch.modules.watch.entity.WatchPicture;

public interface WatchDao {

	long getCount(Watch watch);

	List<Watch> findList(Watch watch);

	void addWatch(Watch watch);

	void addWatchPicture(@Param("wps")List<WatchPicture> wps);

	Watch getById(String id);

	void deletePictureById(String id);

	void editWatch(Watch watch);

	void deletePictureByPicture(WatchPicture wap);

}
