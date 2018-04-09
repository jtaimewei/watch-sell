package com.wlh.watch.modules.order.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wlh.watch.common.utils.DateUtils;
import com.wlh.watch.modules.order.dao.OrderDetailDao;
import com.wlh.watch.modules.order.entity.OrderDetail;

@Service
public class OrderDetailService {
	
	@Resource
	private OrderDetailDao orderDetailDao;

	public Map<String, Object> getChart(OrderDetail orderDetail) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(orderDetail.getEndTime());
		calendar.add(Calendar.DAY_OF_MONTH,1);
		orderDetail.setEndTime(calendar.getTime());
		List<OrderDetail> list = orderDetailDao.getChart(orderDetail);
		Date startDate= orderDetail.getStartTime();
		Date endDate= orderDetail.getEndTime();
		
/*		Date startDate= DateUtils.parseDate(orderDetail.getStartTime());
		Date endDate= DateUtils.parseDate(orderDetail.getEndTime());
*/		
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> timeList = new ArrayList<String>();
		//当开始时间小于结束时间的 时候
		while (startDate.before(endDate)) {
			timeList.add(DateUtils.formatDate(startDate, "yyyy-MM-dd"));
			calendar.setTime(startDate);
			calendar.add(Calendar.DAY_OF_MONTH,1);
			startDate = calendar.getTime();
		}
		//时间轴
		map.put("timeList", timeList);
		//头部信息数组
		List<String> title = new ArrayList<String>();
		map.put("title", title);
		for (int i = 0; i < timeList.size(); i++) {
			String time= timeList.get(i);
			for (OrderDetail or : list) {
				
					List<Integer> totalList = null;
					String key = or.getWatchSerialNumber();
					if (map.containsKey(key)){
						totalList = (List<Integer>) map.get(key);
					} else {
						totalList = new ArrayList<Integer>();
						for (String t:timeList) {
							totalList.add(0);
						}
						map.put(key, totalList);
						title.add(key);
					}
					if (time.equals(DateUtils.formatDate(or.getOrderTime(), "yyyy-MM-dd"))){
						totalList.set(i, or.getTotal());
					}
				}
			}
		
		return map;
	}

	public void saveOrderDetail(OrderDetail orderDetail) {
		orderDetailDao.saveOrderDetail(orderDetail);
	}

}
