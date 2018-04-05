package com.wlh.watch.modules.sys.chart.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wlh.watch.common.utils.DateUtils;
import com.wlh.watch.modules.order.entity.OrderDetail;
import com.wlh.watch.modules.order.service.OrderDetailService;

@Controller
@RequestMapping("/a")
public class ChartController {
	
	@Resource
	private OrderDetailService orderDetailService;

	@RequestMapping("chart")
	public String toChart(OrderDetail orderDetail,HttpSession session) {
		session.setAttribute("head", "/a/chart");
		return "modules/back/chart/watchChart";
	}
	//返回一个 map
	/*name:data:['',''];
	 * data:['',''];
	 * data:['',''];
	 * time:['',''];
	 * 
	 * 
	 * 
	 * */
	@RequestMapping("get")
	public @ResponseBody Map<String, Object> getChart(@RequestBody OrderDetail orderDetail) {
		System.out.println("121312"+ orderDetail.getStartTime());
		//orderDetail.setStartTime(DateUtils.parseDate("2018-03-01"));
		//orderDetail.setEndTime(DateUtils.parseDate("2018-03-03"));
		Map<String, Object> map = orderDetailService.getChart(orderDetail);
		/*Map<String, Object> map = new HashMap<String, Object>();*/
		
		return map;
		
	}
}
