package com.wlh.watch.modules.sys.type.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.modules.sys.type.dao.BrandDao;
import com.wlh.watch.modules.sys.type.entity.Brand;

@Service
public class BrandService {
	
	@Resource
	private BrandDao brandDao;

	public Page<Brand> findPage(Page<Brand> page, Brand brand) {
		brand.setPage(page);
		page.setCount(brandDao.getCount(brand));
		page.setList(brandDao.findList(brand));
		return page;
	}

	public void save(Brand brand) {
		brandDao.save(brand);
	}

	public void edit(Brand brand) {
		brandDao.edit(brand);
	}

	public Brand getById(String id) {
		return brandDao.getById(id);
	}

	public void delete(String id) {
		brandDao.delete(id);
	}

	public List<Brand> findAllList() {
		return brandDao.findAllList();
	}
	

}
