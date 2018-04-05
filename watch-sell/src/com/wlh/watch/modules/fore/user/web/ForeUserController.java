package com.wlh.watch.modules.fore.user.web;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wlh.watch.common.email.UserMail;
import com.wlh.watch.common.utils.Digests;
import com.wlh.watch.common.utils.Encodes;
import com.wlh.watch.modules.sys.menu.service.SysMenuService;
import com.wlh.watch.modules.sys.vip.service.UserVipService;
import com.wlh.watch.modules.user.entity.User;
import com.wlh.watch.modules.user.service.UserService;

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

	/**
	 * 进入登录界面
	 * @return
	 */
	@RequestMapping("login")
	public String toLogin(){
		return "modules/fore/user/login2";
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
		userMail.sendMail(email, code);
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
}
