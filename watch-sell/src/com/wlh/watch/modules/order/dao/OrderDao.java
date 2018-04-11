package com.wlh.watch.modules.order.dao;

import java.util.List;

import com.wlh.watch.modules.order.entity.Order;

public interface OrderDao {

	long getCount(Order order);

	List<Order> findList(Order order);

	Order getById(String id);

	void saveOrder(Order order);

	void editOrder(Order order);

	long getMyOrderCount(Order order);

	List<Order> findMyOrderList(Order order);

	void backOrder(Order order);

	void deleteOrder(Order order);

}
