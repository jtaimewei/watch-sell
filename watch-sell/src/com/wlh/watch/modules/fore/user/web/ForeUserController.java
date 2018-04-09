package com.wlh.watch.modules.fore.user.web;

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
import com.wlh.watch.common.utils.DateUtils;
import com.wlh.watch.common.utils.Digests;
import com.wlh.watch.common.utils.Encodes;
import com.wlh.watch.modules.order.entity.OrderDetail;
import com.wlh.watch.modules.sys.cart.entity.WatchCart;
import com.wlh.watch.modules.sys.cart.service.WatchCartService;
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
	public String toMy() {
		
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
	public String editPassword(User user) {
		
		return "modules/fore/user/forePassword";
	}
	// 进入vip 页面
	@RequestMapping("/user/vip")
	public String vip(User user) {
		
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
	//ajax-添加订单
	@RequestMapping(value="/user/order",produces="text/html;charset=UTF-8;")
	public @ResponseBody String order(String list,Model model,HttpSession session,HttpServletRequest request,
			HttpServletResponse response) {
		User user = (User) session.getAttribute("gUser");
		if (user == null) {
			return "0";//您还未登录,请先登录！
		}
		String[] li = list.split(",");
		for (String idNum : li) {
			String[] idN = idNum.split("@");
			String id = idN[0];
			int number = Integer.parseInt(idN[1]);
			Watch watch = watchService.getById(id);
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setWatchId(watch.getId());
			orderDetail.setOrderWatchSerialNumber(watch.getWatchSerialNumber());
			orderDetail.setOrderDetailOldPrice(watch.getWatchPrePrice());
			orderDetail.setOrderWatchNumber(number);
			orderDetail.setOrderDetailPicture(watch.getWatchPicture().get(0).getPictureSrc());;
			orderDetail.setOrderDetailState("0");
			orderDetail.setOrderDetailTime(DateUtils.getDateTime());
			
			
		}
		return "提交成功";//提交成功
	}
}
/**
 * JSONArray 加入jar ：
 * commons-beanutils-1.7.0.jar
 * json-lib-2.4-jdk15.jar
 * ezmorph-1.0.3.jar
 * commons-collections-3.1.jar
 */