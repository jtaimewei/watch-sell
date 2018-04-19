package com.wlh.watch.modules.user.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.common.utils.DateUtils;
import com.wlh.watch.common.utils.Digests;
import com.wlh.watch.common.utils.Encodes;
import com.wlh.watch.modules.back.online.entity.OnlineSession;
import com.wlh.watch.modules.back.online.session.SessionListener;
import com.wlh.watch.modules.sys.menu.entity.SysMenu;
import com.wlh.watch.modules.sys.menu.service.SysMenuService;
import com.wlh.watch.modules.sys.role.entity.SysRole;
import com.wlh.watch.modules.sys.role.service.SysRoleService;
import com.wlh.watch.modules.sys.utils.judge.JudgeUtils;
import com.wlh.watch.modules.sys.vip.entity.UserVip;
import com.wlh.watch.modules.sys.vip.service.UserVipService;
import com.wlh.watch.modules.user.entity.User;
import com.wlh.watch.modules.user.service.UserService;

@Controller
@RequestMapping("/a")
public class UserController {

	private Logger log = Logger.getLogger(getClass());
	@Resource
	private UserService userService;
	@Resource
	private UserVipService userVipService;
	@Resource
	private SysMenuService sysMenuService;
	@Resource
	private SysRoleService sysRoleService;
	//查看个人信息
	@RequestMapping("headerUser")
	public String toHeaderLogin(HttpServletRequest request,
			HttpServletResponse response,HttpSession session) throws IOException {
		session.setAttribute("head", "headerUser");
		return "modules/back/user/headerUser";
	}
	//修改个人信息
	@RequestMapping("/user/editUser")
	public String edit(User user,HttpSession session) {
		user.setUserName("后台用户");
		userService.editBack(user);
		User user2 = userService.getById(user.getId());
		session.setAttribute("userOwn", user2);
		return "modules/back/user/headerUser";
	}
	//进入修改密码
	@RequestMapping("/user/editPassword")
	public String editPassword(User user,HttpSession session) {
		return "modules/back/user/headerUserPassword";
	}
	/**
	 * 修改密码
	 * @return
	 */
	@RequestMapping("/user/password/edit")
	public String password(User user,HttpSession session,Model model){
		User user1 = (User) session.getAttribute("userOwn");
		String id = user1.getId();
		String plain = Encodes.unescapeHtml(user.getPassword());//明文密码
		byte[] salt = Encodes.decodeHex(user1.getPassword().substring(0,16));//密文密码
		byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
		if(!user1.getPassword().equals(Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword))){
			model.addAttribute("message", "密码错误");
			return "modules/back/user/headerUserPassword";
		}
		
		//新密码-加盐加密
		String plain1 = Encodes.unescapeHtml(user.getNewPassword());
		byte[] salt1 = Digests.generateSalt(8);
		byte[] hashPassword1 = Digests.sha1(plain1.getBytes(), salt1, 1024);
		String password1 = Encodes.encodeHex(salt1)+Encodes.encodeHex(hashPassword1);
		
		user.setPassword(password1);
		user.setId(id);
		
		userService.editPassword(user);
		
		user1.setPassword(password1);
		session.setAttribute("userOwn", user1);
		model.addAttribute("message", "修改密码成功！");
		return "modules/back/user/headerUserPassword";
	}
	@RequestMapping(value = { "loin" }, produces = "text/html;charset=UTF-8;", method = RequestMethod.POST)
	public String sigin(User user, HttpSession session,
			HttpServletRequest request, Model model) {
		String checkCode = (String) session.getAttribute("checkCode");
		if (!checkCode.equals(user.getCheckCode().toUpperCase())) {
			model.addAttribute("message", "验证码错误");
			return "modules/user/login";
		}
		User user2 = userService.getByEmail(user);
		if (user2 == null || !user2.getPassword().equals(user.getPassword())) {
			model.addAttribute("message", "账号或者密码不正确");
			return "modules/user/login";
		}
		List<SysMenu> menus = null;
		if (user2.getUserType() == JudgeUtils.USER_TYPE_GUKE) {// 顾客
			// 获取用户的vip折扣信息
			UserVip userVip = userVipService.getByLevel(user2.getVip());
			session.setAttribute("vip", userVip);
			user2.setPassword("");
			session.setAttribute("user", user2);
		} else if (user2.getUserType() == JudgeUtils.USER_TYPE_KEFU) {// 客服
			menus = sysMenuService.getByUserId(user2.getId());
			session.setAttribute("menus", menus);
		} else if (user2.getUserType() == JudgeUtils.USER_TYPE_GUANLI) {// 管理员
			menus = sysMenuService.getByUserId(user2.getId());
			session.setAttribute("menus", menus);
		}
		user2.setPassword("");
		session.setAttribute("user", user2);
		OnlineSession onlineSession = new OnlineSession(request.getRemoteAddr(), user2.getEmail(), DateUtils.getDateTime());
		// 监听session名字为_login 的session，并将value值(对象)存储到SessionListener对象的集合中。
		session.setAttribute(SessionListener.LISTENER_NAME, onlineSession);
		log.info(menus);
		return "redirect:" + menus.get(0).getHref();
	}

	/**
	 * 后台进入修改用户界面
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/get")
	public String goUserEdit(String id, Model model) {
		User user = userService.getById(id);
		model.addAttribute("user", user);
		List<SysRole> userRoles = sysRoleService.getByUserId(id);
		List<String> roleids = new ArrayList<String>();
		for (SysRole role : userRoles) {
			roleids.add(role.getId());
		}
		model.addAttribute("roleids", roleids);
		return "modules/back/urm/editUser";
	}

	/**
	 * 后台用户修改
	 * 
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/edit")
	public String backUserEdit(User user, Model model,
			HttpServletRequest request) {
		
		userService.editBack(user);
		
		List<SysRole> myRoles = sysRoleService.getByUserId(user.getId());// 数据库存的角色
		List<String> myList = new ArrayList<String>();// 数据库存的角色id
		for (SysRole sysRole : myRoles) {
			myList.add(sysRole.getId());
		}
		List<SysRole> getRoles = user.getRoles();// 页面选的角色
		List<String> getlist = new ArrayList<String>();// 页面选的角色id
		for (SysRole getRole : getRoles) {
			if (getRole.getId() != null) {
				getlist.add(getRole.getId());
			}
		}
		// 1 2 3
		// 2 3
		// 角色添加
		for (String myRole : getlist) {
			if (!myList.contains(myRole)) {
				User user3 = new User();
				user3.setId(user.getId());
				user3.setRoleId(myRole);
				userService.addUserRole(user3);
			}
		}
		//角色删除
		for (String myRole : myList) {
			if (!getlist.contains(myRole)) {
				User user3 = new User();
				user3.setId(user.getId());
				user3.setRoleId(myRole);
				userService.deleteUserRole(user3);
			}
		}

		return "redirect:/a/user/list";
	}

	/**
	 * 后台查看所有用户
	 * 
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/list")
	public String backAllUser(User user, HttpServletRequest request,
			HttpServletResponse response, Model model,HttpSession session) {
		session.setAttribute("head", "/a/user/list");
		session.setAttribute("urm", "user");
		Page<User> page = userService.findPage(
				new Page<User>(request, response), user);
		model.addAttribute("page", page);
		return "modules/back/urm/userManager";
	}
	//后台删除用户
	@RequestMapping("/user/delete")
	public String deleteUser(String id) {
		userService.deleteUser(id);
		userService.deleteUserRoles(id);
		return "redirect:/a/user/list";
	}
	
	// 进入增加用户界面
	@RequestMapping("/user/toadd")
	public String goAdd() {
		
		return "modules/back/urm/addUser";
	}
	
	//后台添加后台用户
	@RequestMapping("/user/add")
	public String addUser(User user) {
		String plain = Encodes.unescapeHtml(user.getPassword());
		byte[] salt = Digests.generateSalt(8);
		byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
		String password = Encodes.encodeHex(salt)
				+ Encodes.encodeHex(hashPassword);
		user.setPassword(password);
		String id = UUID.randomUUID().toString().replaceAll("-", "");
		user.setId(id);
		userService.addUser(user);
		
		List<SysRole> getRoles = user.getRoles();// 页面选的角色
		for (SysRole getRole : getRoles) {
			if (getRole.getId() != null) {
				User user4 = new User();
				user4.setId(id);
				user4.setRoleId(getRole.getId());
				userService.addUserRole(user4);
			}
		}
		
		return "redirect:/a/user/list";
	}
	
	
	

}
