package com.wlh.watch.modules.fore.user.web;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;














import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wlh.watch.common.email.UserMail;
import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.common.utils.DateUtils;
import com.wlh.watch.common.utils.Digests;
import com.wlh.watch.common.utils.Encodes;
import com.wlh.watch.modules.order.entity.Order;
import com.wlh.watch.modules.order.entity.OrderDetail;
import com.wlh.watch.modules.order.service.OrderDetailService;
import com.wlh.watch.modules.order.service.OrderService;
import com.wlh.watch.modules.sys.cart.entity.WatchCart;
import com.wlh.watch.modules.sys.cart.service.WatchCartService;
import com.wlh.watch.modules.sys.comment.entity.WatchComment;
import com.wlh.watch.modules.sys.comment.service.WatchCommentService;
import com.wlh.watch.modules.sys.menu.service.SysMenuService;
import com.wlh.watch.modules.sys.reception.entity.UserReception;
import com.wlh.watch.modules.sys.reception.service.UserReceptionService;
import com.wlh.watch.modules.sys.vip.service.UserVipService;
import com.wlh.watch.modules.user.entity.User;
import com.wlh.watch.modules.user.service.UserService;
import com.wlh.watch.modules.watch.entity.Watch;
import com.wlh.watch.modules.watch.service.WatchService;

@Controller
@RequestMapping("/b")
public class ForeUserController {
	
	@Resource
	private UserService userService;
	@Resource
	private UserVipService userVipService;
	@Resource
	private SysMenuService sysMenuService;
	@Resource
	private UserMail userMail;
	@Resource
	private UserReceptionService userReceptionService;
	@Resource
	private WatchCartService watchCartService;
	@Resource
	private WatchService watchService;
	@Resource
	private OrderDetailService orderDetailService;
	@Resource
	private OrderService orderService;
	@Resource
	private WatchCommentService watchCommentService;
	
	/**
	 * 进入登录界面
	 * @return
	 */
	@RequestMapping("login")
	public String toLogin(){
		return "modules/fore/user/login2";
	}
	/**
	 * 注销
	 * @param request
	 * @return
	 */
	@RequestMapping("logout")
	public String logout(HttpServletRequest request){
		Enumeration<String> em = request.getSession().getAttributeNames();
		while (em.hasMoreElements()) {
			request.getSession().removeAttribute(em.nextElement().toString());
		}
		return "modules/fore/index";
	}
	/**
	 * 登录
	 * @return
	 */
	@RequestMapping("signin")
	public String login(User user,HttpSession session,Model model){
		String checkCode = (String) session.getAttribute("checkCode");
		if (!checkCode.equals(user.getCheckCode().toUpperCase())) {
			model.addAttribute("message", "图形验证码错误");
			return "modules/fore/user/login2";
		}
		User user1 = userService.getByEmail(user);
		if (user1 == null) {
			model.addAttribute("message", "用户名或者密码错误");
			return "modules/fore/user/login2";
		}
		//0-顾客;1-客服;2-管理员
		if (user1.getUserType() == 1 || user1.getUserType() == 2) {
			model.addAttribute("message", "用户名或者密码错误");
			return "modules/fore/user/login2";
		}
		String plain = Encodes.unescapeHtml(user.getPassword());//明文密码
		byte[] salt = Encodes.decodeHex(user1.getPassword().substring(0,16));//密文密码
		byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
		if(!user1.getPassword().equals(Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword))){
			model.addAttribute("message", "用户名或者密码错误");
			return "modules/fore/user/login2";
		}
		/*String plain = Encodes.unescapeHtml(plainPassword);
		byte[] salt = "314cd370f3d2a9e88";
		byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, HASH_INTERATIONS);
		String pwd2=Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword);*/
		
		session.setAttribute("gUser", user1);
		int cartNumber = watchCartService.getCount(user1.getId());
		if (cartNumber != 0) {
			session.setAttribute("cartNumber", cartNumber);
		}
		return "modules/fore/index";
	}
	
	/**
	 * 进入注册界面 web-inf
	 * @return
	 */
	@RequestMapping("register")
	public String toRegister(){
		return "modules/fore/user/register";
	}
	/**
	 * ajax-邮箱获取验证码
	 */
	@RequestMapping(value="email",produces="text/html;charset=UTF-8;")
	public @ResponseBody String getChart(String email,HttpSession session,HttpServletResponse response) {
		User user = new User();
		user.setEmail(email);
		User user1 = userService.getByEmail(user);
		if (user1 != null) {
			return "该邮箱已被注册了";
		}
		String cd = UUID.randomUUID().toString().replaceAll("-", "");
		String code = cd.substring(0, 5);
		//userMail.sendMail(email, code);
		System.out.println("-------------------"+code);
		Cookie cookie = new Cookie("emailCode",code);
		cookie.setMaxAge(60);
		response.addCookie(cookie);
		return "邮件已发送,请查阅邮箱,5分钟内有效";
	}
	
	/**
	 * 无登录注册用户
	 * @param user
	 * @param model
	 * @return
	 */	
	@RequestMapping("/user/add")
	public String addUser(User user,HttpServletRequest request,Model model,HttpSession session){
		Cookie[] cookies = request.getCookies();
		String emailCode = "";
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("emailCode")) {
				emailCode = cookie.getValue();
			}
		}
		if (!user.getEmailCode().equals(emailCode)) {
			model.addAttribute("message", "邮箱验证码错误");
			return "modules/fore/user/register";
		}
		String checkCode = (String) session.getAttribute("checkCode");
		if (!checkCode.equals(user.getCheckCode().toUpperCase())) {
			model.addAttribute("message", "图形验证码错误");
			return "modules/fore/user/register";
		}
		String plain = Encodes.unescapeHtml(user.getPassword());
		byte[] salt = Digests.generateSalt(8);
		byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
		String password = Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword);
		
		user.setPassword(password);
		user.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		user.setUserType(0);
		userService.addUser(user);
		return "modules/fore/user/login2";
	}
	//查看个人信息
	@RequestMapping("/user/own")
	public String toMy(HttpSession session) {
		session.setAttribute("left", "own");
		return "modules/fore/user/foreUser";
	}
	//修改个人信息
	@RequestMapping("/user/edit")
	public String edit(User user,HttpSession session) {
		userService.editBack(user);
		User user2 = userService.getById(user.getId());
		session.setAttribute("gUser", user2);
		return "modules/fore/user/foreUser";
	}
	//进入修改密码
	@RequestMapping("/user/editPassword")
	public String editPassword(User user,HttpSession session) {
		session.setAttribute("left", "password");
		return "modules/fore/user/forePassword";
	}
	// 进入vip 页面
	@RequestMapping("/user/vip")
	public String vip(User user,HttpSession session) {
		session.setAttribute("left", "vip");
		return "modules/fore/user/foreVip";
	}
	/**
	 * 修改密码
	 * @return
	 */
	@RequestMapping("/user/password/edit")
	public String password(User user,HttpSession session,Model model){
		User user1 = (User) session.getAttribute("gUser");
		String id = user1.getId();
		//原来密码解密
		String password = user1.getPassword();
		password = "123";
		if (!user.getPassword().equals(password)) {
			model.addAttribute("message", "密码错误");
			return "modules/fore/user/forePassword";
		}
		//新密码-加盐加密
		String plain = Encodes.unescapeHtml(user.getNewPassword());
		byte[] salt = Digests.generateSalt(8);
		byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
		String password1 = Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword);
		
		user.setPassword(password1);
		user.setId(id);
		
		userService.editPassword(user);
		
		model.addAttribute("message", "修改密码成功！");
		return "modules/fore/user/forePassword";
	}
	//添加地址
	@RequestMapping("/user/reception/add")
	public String addReception(UserReception reception,HttpSession session) {
		User user = (User) session.getAttribute("gUser");
		String id = user.getId();
		
		reception.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		reception.setUserId(id);
		
		userReceptionService.saveReception(reception);
		return "redirect:/b/user/reception";
	}
	//查看收货地址
	@RequestMapping("/user/reception")
	public String reception(Model model,HttpSession session) {
		User user = (User) session.getAttribute("gUser");
		String id = user.getId();
		
		List<UserReception> recs = userReceptionService.findReception(id);
		session.setAttribute("left", "reception");
		model.addAttribute("recs", recs);
		return "modules/fore/user/foreReception";
	}
	//ajax-删除地址
	@RequestMapping(value="/user/reception/delete",produces="text/html;charset=UTF-8;")
	public @ResponseBody String deleteRec(String id,HttpSession session,HttpServletResponse response) {
		User user = (User) session.getAttribute("gUser");
		String userId = user.getId();
		
		UserReception reception = new UserReception();
		reception.setId(id);
		reception.setUserId(userId);
		userReceptionService.deleteReception(reception);
		
		return "ok";
	}
	//ajax-修改地址
	@RequestMapping(value="/user/reception/edit")
	public @ResponseBody String editRec(@RequestBody UserReception reception,HttpSession session,HttpServletResponse response) {
		
		userReceptionService.editReception(reception);
		
		return "ok";
	}
	//进入购物车
	@RequestMapping("/user/cart")
	public String toMyCart(Model model,HttpSession session) {
		User user = (User) session.getAttribute("gUser");
		if (user == null) {
			return "modules/fore/user/login2";
		}
		String id = user.getId();
		
		List<WatchCart> carts = watchCartService.findCart(id);
		
		model.addAttribute("carts", carts);
		
		return "modules/fore/user/foreCart";
	}
	//清除购物车 -
	@RequestMapping("/watch/cart/clear")
	public String clearCart(HttpServletRequest request,HttpSession session,Model model) {
		User user = (User) session.getAttribute("gUser");
		if (user == null) {
			return "modules/fore/user/login2";
		}
		String[] ids = request.getParameterValues("id");
		watchCartService.clearCarts(ids);
		int cartNumber = watchCartService.getCount(user.getId());
		if (cartNumber != 0) {
			session.setAttribute("cartNumber", cartNumber);
		} else if (cartNumber == 0) {
			session.removeAttribute("cartNumber");
		}
		return "redirect:/b/user/cart";
	}
	//ajax-添加订单
	@RequestMapping(value="/user/order",produces="text/html;charset=UTF-8;")
	public @ResponseBody String order(String list,Model model,HttpSession session,HttpServletRequest request,
			HttpServletResponse response) {
		User user = (User) session.getAttribute("gUser");
		if (user == null) {
			return "0";//您还未登录,请先登录！
		}
		String[] li = list.split(",");
		List<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
		int total = 0;
		for (String idNum : li) {
			String[] idN = idNum.split("@");
			String id = idN[0];
			int number = Integer.parseInt(idN[1]);
			Watch watch = watchService.getById(id);
			total = total + Integer.parseInt(watch.getWatchPrePrice())*number;
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setWatchId(watch.getId());
			orderDetail.setOrderWatchTitle(watch.getWatchTitle());
			orderDetail.setOrderWatchSerialNumber(watch.getWatchSerialNumber());
			orderDetail.setOrderDetailOldPrice(watch.getWatchPrePrice());
			orderDetail.setOrderWatchNumber(number);
			orderDetail.setOrderDetailPicture(watch.getWatchPicture().get(0).getPictureSrc());;
			orderDetail.setOrderDetailState("0");
			orderDetail.setOrderDetailTime(DateUtils.getDateTime());
			orderDetailList.add(orderDetail);
		}
		session.setAttribute("total", total);
		session.setAttribute("orderDetailList", orderDetailList);
		return "1";//提交成功
	}
	//添加地址
	@RequestMapping("/user/addOrder/reception/add")
	public String addOrderReception(UserReception reception,HttpSession session) {
		User user = (User) session.getAttribute("gUser");
		String id = user.getId();
		
		reception.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		reception.setUserId(id);
		
		userReceptionService.saveReception(reception);
		return "redirect:/b/user/toOrder";
	}
		// 进入下订单界面
		@RequestMapping("/user/toOrder")
		public String toOrder(HttpSession session,Model model) {
			User user = (User) session.getAttribute("gUser");
			String id = user.getId();
			
			List<UserReception> recs = userReceptionService.findReception(id);
			
			model.addAttribute("recs", recs);
			return "modules/fore/user/foreOrder";
		}
		
		//增加订单
		@RequestMapping("/user/addOrder")
		public String addOrder(UserReception userReception,HttpSession session,Model model) {
			User user = (User) session.getAttribute("gUser");
			String id = user.getId();
			String orderId = UUID.randomUUID().toString().replaceAll("-", "");
			@SuppressWarnings("unchecked")
			List<OrderDetail> orderDetailList = (List<OrderDetail>) session.getAttribute("orderDetailList");
			int total = (int) session.getAttribute("total");
			for (OrderDetail orderDetail : orderDetailList) {
				orderDetail.setId(UUID.randomUUID().toString().replaceAll("-", ""));
				orderDetail.setOrderId(orderId);
				//添加订单详情
				orderDetailService.saveOrderDetail(orderDetail);
				//商品库存数量减去购买数量
				watchService.editWatchNumber(orderDetail);
			}
			System.out.println(System.currentTimeMillis());
			UserReception UserReception = userReceptionService.getById(userReception.getId());
			Order order = new Order();		
			order.setId(orderId);
			order.setUserId(id);
			order.setOrderNumber("O"+ String.valueOf(System.currentTimeMillis()));
			//order.setOrderTradeNumber(String.valueOf(System.currentTimeMillis()));
			order.setOrderCreateTime(DateUtils.getDateTime());
			order.setOrderAllPrice(total);
			order.setOrderDiscount(0);
			order.setOrderSendPrice(0);
			order.setOrderGetName(UserReception.getRecName());
			order.setOrderGetPhone(UserReception.getRecPhone());
			order.setOrderGetAddress(UserReception.getRecAddress());
			order.setOrderState("0");//0-订单创建成功
			//创建新订单
			orderService.saveOrder(order);
			//订单创建成功后，清空购物车
			watchCartService.cleanCart(id);
			session.removeAttribute("cartNumber");
			model.addAttribute("orderPay", order);
			model.addAttribute("allPrice", total);
			return "modules/fore/user/forePay";
		}
		
		// 支付成功-进入我的订单页面
		@RequestMapping("/user/order/pay")
		public String pay(Order order,HttpSession session,Model model) {
			User user = (User) session.getAttribute("gUser");
			String id = user.getId();
			order.setOrderTradeNumber(String.valueOf(System.currentTimeMillis()));
			order.setOrderPayTime(DateUtils.getDateTime());
			order.setOrderSendTime(DateUtils.getDateTime());
			order.setOrderState("2");//2-已发货 
			orderService.editOrder(order);
			model.addAttribute("userId", id);
			return "redirect:/b/user/order/myOrder";
		}
		// 进入我的订单界面
		@RequestMapping("/user/order/myOrder")
		public String ToMyOrder(HttpServletRequest request,
				HttpServletResponse response,Order order,Model model,HttpSession session) {
			if (order.getUserId() == null) {
				User user = (User) session.getAttribute("gUser");
				if(user == null) {
					return "modules/fore/user/login2";
				}
				order.setUserId( user.getId());
			}
			Page<Order> page = orderService.findMyOrderPage(
					new Page<Order>(request, response), order);
			model.addAttribute("page", page);
			return "modules/fore/user/foreMyOrder";
		}
		//从我的订单页面进入-支付界面
		@RequestMapping("/user/order/toPay")
		public String myOrderToPay(Order order,HttpSession session,Model model) {
			
			model.addAttribute("orderPay", order);
			return "modules/fore/user/forePay";
		}
		//退货 -
		@RequestMapping("/user/order/back")
		public String backOrder(OrderDetail orderDetail,HttpServletRequest request,HttpSession session,Model model) {
			Order order = new Order();
			order.setId(orderDetail.getOrderId());
			order.setOrderState("4");//退货状态
			orderService.backOrder(order);
			//model.addAttribute("orderPay", order);
			String[] ids = request.getParameterValues("id");
			for (String id : ids) {
				OrderDetail orderDetail1 = new OrderDetail();
				orderDetail1.setId(id);
				orderDetail1.setOrderDetailState("1");//退货状态
				orderDetailService.backOrderDetail(orderDetail1);
			}
			
			return "redirect:/b/user/order/myOrder/?repage";
		}
		//确认收货
		@RequestMapping("/user/order/okOrder")
		public String okOrder(Order order,HttpSession session,Model model) {
			order.setOrderState("6");//订单完成状态
			order.setOrderCloseTime(DateUtils.getDateTime());
			orderService.backOrder(order);
			return "redirect:/b/user/order/myOrder/?repage";
		}
		//删除订单
		@RequestMapping("/user/order/deleteOrder")
		public String deleteOrder(Order order,HttpSession session,Model model) {
			orderService.deleteOrder(order);
			return "redirect:/b/user/order/myOrder/?repage";
		}
		//进入 评价界面
		@RequestMapping("/user/order/toComment")
		public String toComment(Order order,HttpSession session,Model model) {
			Order order1 = orderService.getById(order.getId());
			model.addAttribute("order", order1);
			return "modules/fore/user/foreComment";
		}
		//进入 详情页面
		@RequestMapping("/user/order/detail")
		public String detail(Order order,HttpSession session,Model model) {
			Order order1 = orderService.getById(order.getId());
			model.addAttribute("order", order1);
			return "modules/fore/user/foreOrderDetail";
		}
		//添加评论
		@RequestMapping("/user/order/comment")
		public String comment(Order order,HttpSession session,Model model) {
			User user = (User) session.getAttribute("gUser");
			if(user == null) {
				return "modules/fore/user/login2";
			}
			
			List<OrderDetail> ods = order.getOrderDetail();
			for (OrderDetail orderDetail : ods) {
				WatchComment comment = new WatchComment();
				comment.setId(UUID.randomUUID().toString().replaceAll("-", ""));
				comment.setUserId(user.getId());
				comment.setUserName(user.getUserName());
				comment.setWatchId(orderDetail.getWatchId());
				comment.setCommentContent(orderDetail.getRemarks());
				comment.setCommentContentTime(DateUtils.getDateTime());
				orderDetailService.saveRemarks(orderDetail);
				watchCommentService.saveComment(comment);
			}
			order.setOrderState("7");//订单完成状态
			orderService.backOrder(order);
			return "redirect:/b/user/order/myOrder/?repage";
		}
		
		
}
/**
 * JSONArray 加入jar ：
 * commons-beanutils-1.7.0.jar
 * json-lib-2.4-jdk15.jar
 * ezmorph-1.0.3.jar
 * commons-collections-3.1.jar
 */