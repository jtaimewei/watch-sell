package com.wlh.watch.modules.order.dao;

import java.util.List;

import com.wlh.watch.modules.order.entity.OrderDetail;

public interface OrderDetailDao {

	List<OrderDetail> getChart(OrderDetail orderDetail);

	void saveOrderDetail(OrderDetail orderDetail);

	void backOrderDetail(OrderDetail orderDetail1);

	void saveRemarks(OrderDetail orderDetail);

}
