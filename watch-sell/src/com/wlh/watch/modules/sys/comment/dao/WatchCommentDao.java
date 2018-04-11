package com.wlh.watch.modules.sys.comment.dao;

import java.util.List;

import com.wlh.watch.modules.sys.comment.entity.WatchComment;

public interface WatchCommentDao {

	long getForeCount(WatchComment watchComment);

	List<WatchComment> findForeList(WatchComment watchComment);

	void saveComment(WatchComment comment);

}
