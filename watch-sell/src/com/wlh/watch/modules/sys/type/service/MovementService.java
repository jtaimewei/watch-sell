package com.wlh.watch.modules.sys.type.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.modules.sys.type.dao.MovementDao;
import com.wlh.watch.modules.sys.type.entity.Movement;

@Service
public class MovementService {
	
	@Resource
	private MovementDao movementDao;

	public Page<Movement> findPage(Page<Movement> page, Movement Movement) {
		page.setNumber((page.getPageNo()-1)*page.getPageSize());
		Movement.setPage(page);
		page.setCount(movementDao.getCount(Movement));
		page.setList(movementDao.findList(Movement));
		return page;
	}

	public void save(Movement movement) {
		movementDao.save(movement);
	}

	public void edit(Movement movement) {
		movementDao.edit(movement);
	}

	public Movement getById(String id) {
		return movementDao.getById(id);
	}

	public void delete(String id) {
		movementDao.delete(id);
	}

	public List<Movement> findAllList() {
		return movementDao.findAllList();
	}
	

}
