package com.wlh.watch.modules.sys.vip.dao;

import com.wlh.watch.modules.sys.vip.entity.UserVip;

public interface UserVipDao {

	UserVip getByLevel(String level);
}
