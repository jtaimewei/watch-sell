package com.wlh.watch.modules.sys.basic.web;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wlh.watch.common.data.DateUtils;
import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.common.utils.Digests;
import com.wlh.watch.common.utils.Encodes;
import com.wlh.watch.modules.back.online.entity.OnlineSession;
import com.wlh.watch.modules.back.online.session.SessionListener;
import com.wlh.watch.modules.sys.menu.entity.SysMenu;
import com.wlh.watch.modules.sys.menu.service.SysMenuService;
import com.wlh.watch.modules.sys.utils.judge.JudgeUtils;
import com.wlh.watch.modules.sys.vip.entity.UserVip;
import com.wlh.watch.modules.sys.vip.service.UserVipService;
import com.wlh.watch.modules.user.entity.User;
import com.wlh.watch.modules.user.service.UserService;

@Controller
@RequestMapping("/b")
public class BasicUserController {
	
	//private Logger logger = (org.apache.log4j.Logger) LoggerFactory.getLogger(getClass());
	private Logger log = Logger.getLogger(getClass());
	@Resource
	private UserService userService;
	@Resource
	private UserVipService userVipService;
	@Resource
	private SysMenuService sysMenuService;

	/**
	 * 进入注册界面 web-inf
	 * @return
	 */
	@RequestMapping("register")
	public String toRegister(){
		return "modules/user/register";
	}
	/**
	 * 无登录注册用户
	 * @param user
	 * @param model
	 * @return
	 */	
	@RequestMapping("add")
	public String addUser(User user){
		String plain = Encodes.unescapeHtml(user.getPassword());
		byte[] salt = Digests.generateSalt(8);
		byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
		String password = Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword);
		user.setPassword(password);
		user.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		user.setUserType(0);
		userService.addUser(user);
		return "modules/user/login";
	}
	
}
