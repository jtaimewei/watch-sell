package com.wlh.watch.modules.sys.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wlh.watch.modules.sys.cart.entity.WatchCart;

public interface WatchCartDao {

	void addCart(WatchCart watchCart);

	List<WatchCart> findCart(String id);

	void cleanCart(String id);

	int getCount(String id);

	void clearCarts(@Param("ids")String[] ids);

}
