package com.wlh.watch.modules.order.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.modules.order.entity.Order;
import com.wlh.watch.modules.order.service.OrderService;

@Controller
@RequestMapping("/a/order")
public class OrderController {
	
	@Resource
	private OrderService orderService;
	
	@RequestMapping("list")
	public String toList(HttpServletRequest request,
			HttpServletResponse response,Order order,Model model,HttpSession session) {
		Page<Order> page = orderService.findPage(
				new Page<Order>(request, response), order);
		model.addAttribute("page", page);
		session.setAttribute("head", "/a/order/list");
		return "modules/back/order/orderManager";
	}
	
	@RequestMapping("details")
	public String detail(String id,Model model) {
		Order order = orderService.getById(id);
		model.addAttribute("order", order);
		return "modules/back/order/orderDetails";
	}

}
