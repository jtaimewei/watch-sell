package com.wlh.watch.modules.sys.type.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wlh.watch.modules.sys.type.dao.CrowdDao;
import com.wlh.watch.modules.sys.type.entity.Crowd;

@Service
public class CrowdService {
	
	@Resource
	private CrowdDao crowdDao;

	public List<Crowd> findList() {
		
		return crowdDao.findList();
	}

	public void save(Crowd crowd) {
		crowdDao.save(crowd);
	}

	public void edit(Crowd crowd) {
		crowdDao.edit(crowd);
	}

	public Crowd getById(String id) {
		return crowdDao.getById(id);
	}

	public void delete(String id) {
		crowdDao.delete(id);
	}
	

}
