package com.wlh.watch.modules.sys.comment.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.modules.sys.comment.dao.WatchCommentDao;
import com.wlh.watch.modules.sys.comment.entity.WatchComment;

@Service
public class WatchCommentService {
	@Resource
	private WatchCommentDao watchCommentDao;

	public Page<WatchComment> findForePage(Page<WatchComment> page,
			WatchComment watchComment) {
		page.setNumber((page.getPageNo()-1)*page.getPageSize());
		watchComment.setPage(page);
		page.setCount(watchCommentDao.getForeCount(watchComment));
		page.setList(watchCommentDao.findForeList(watchComment));
		return page;
	}

	public void saveComment(WatchComment comment) {
		watchCommentDao.saveComment(comment);
	}
	
	

}
