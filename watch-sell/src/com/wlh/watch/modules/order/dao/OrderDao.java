package com.wlh.watch.modules.order.dao;

import java.util.List;

import com.wlh.watch.modules.order.entity.Order;

public interface OrderDao {

	long getCount(Order order);

	List<Order> findList(Order order);

	Order getById(String id);

}
