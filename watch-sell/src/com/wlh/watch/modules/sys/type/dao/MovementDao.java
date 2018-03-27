package com.wlh.watch.modules.sys.type.dao;

import java.util.List;

import com.wlh.watch.modules.sys.type.entity.Movement;

public interface MovementDao {
	/**
	 * 获取品牌数量
	 * @param Movement
	 * @return
	 */
	long getCount(Movement movement);

	List<Movement> findList(Movement movement);

	void save(Movement movement);

	void edit(Movement movement);

	Movement getById(String id);

	void delete(String id);

	List<Movement> findAllList();

}
