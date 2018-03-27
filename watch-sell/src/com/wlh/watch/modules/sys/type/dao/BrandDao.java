package com.wlh.watch.modules.sys.type.dao;

import java.util.List;

import com.wlh.watch.modules.sys.type.entity.Brand;

public interface BrandDao {
	/**
	 * 获取品牌数量
	 * @param brand
	 * @return
	 */
	long getCount(Brand brand);

	List<Brand> findList(Brand brand);

	void save(Brand brand);

	void edit(Brand brand);

	Brand getById(String id);

	void delete(String id);

	List<Brand> findAllList();

}
