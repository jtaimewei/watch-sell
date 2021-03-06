package com.wlh.watch.modules.order.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.modules.order.dao.OrderDao;
import com.wlh.watch.modules.order.entity.Order;

@Service
public class OrderService {
	
	@Resource
	private OrderDao orderDao;

	public Page<Order> findPage(Page<Order> page, Order order) {
		page.setNumber((page.getPageNo()-1)*page.getPageSize());
		order.setPage(page);
		page.setCount(orderDao.getCount(order));
		page.setList(orderDao.findList(order));
		return page;
	}

	public Order getById(String id) {
		return orderDao.getById(id);
	}

	public void saveOrder(Order order) {
		orderDao.saveOrder(order);
	}

	public void editOrder(Order order) {
		orderDao.editOrder(order);
	}

	public Page<Order> findMyOrderPage(Page<Order> page, Order order) {
		page.setNumber((page.getPageNo()-1)*page.getPageSize());
		order.setPage(page);
		page.setCount(orderDao.getMyOrderCount(order));
		page.setList(orderDao.findMyOrderList(order));
		return page;
	}

	public void backOrder(Order order) {
		orderDao.backOrder(order);
	}

	public void deleteOrder(Order order) {
		orderDao.deleteOrder(order);
	}
}
