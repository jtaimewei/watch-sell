package com.wlh.watch.modules.sys.cart.dao;

import java.util.List;

import com.wlh.watch.modules.sys.cart.entity.WatchCart;

public interface WatchCartDao {

	void addCart(WatchCart watchCart);

	List<WatchCart> findCart(String id);

}
