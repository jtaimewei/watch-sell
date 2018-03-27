package com.wlh.watch.modules.sys.type.dao;

import java.util.List;

import com.wlh.watch.modules.sys.type.entity.Crowd;

public interface CrowdDao {

	void save(Crowd crowd);

	void edit(Crowd crowd);

	Crowd getById(String id);

	List<Crowd> findList();

	void delete(String id);

}
