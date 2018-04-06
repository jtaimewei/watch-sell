package com.wlh.watch.modules.sys.log.web;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wlh.watch.common.data.DateUtils;
import com.wlh.watch.common.security.SystemAuthorizingRealm.Principal;
import com.wlh.watch.common.utils.UserUtils;
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
public class LoginController {
	private Logger logger = Logger.getLogger(getClass());
	@Resource
	private UserService userService;
	@Resource
	private UserVipService userVipService;
	@Resource
	private SysMenuService sysMenuService;
	@Resource
	private SysRoleService sysRoleService;
	
	//地址栏访问
	@RequestMapping(value={"login"},method=RequestMethod.GET)
	public String toLogin(HttpServletRequest request,HttpServletResponse response) throws IOException{
		logger.debug("进入登录界面");
 		return "modules/user/login";
	}
	
	@RequestMapping(value={"login"},method=RequestMethod.POST)
	public String loginFail(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		logger.debug("登录失败返回登录页面");
 		return "modules/user/login";
	}
	//登录成功后进入
	@RequestMapping(value={""})
	public String loginSuccess(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException{
		Principal pr = UserUtils.getPrincipal();
		
		Enumeration<String> enumeration =session.getAttributeNames();//获取session中所有的键值对
		while(enumeration.hasMoreElements()){
            String AddFileName=enumeration.nextElement().toString();//获取session中的键值
            
            Object value=session.getAttribute(AddFileName);//根据键值取出session中的值
            System.out.println(AddFileName + ":"+value);
        }
		User user = new User();
		user.setEmail(pr.getLoginName());
		List<SysMenu> menus = null;
		User user2 = userService.getByEmail(user);
		session.setAttribute("userOwn", user2);
		menus = sysMenuService.getByUserId(user2.getId());
		session.setAttribute("menus", menus);
		List<SysRole> roleList = sysRoleService.findList();
		session.setAttribute("roles", roleList);
		OnlineSession onlineSession=new OnlineSession(request.getRemoteAddr(), user2.getEmail(), DateUtils.getDATE());
		//监听session名字为_login 的session，并将value值(对象)存储到SessionListener对象的集合中。
		UserUtils.getSession().setAttribute(SessionListener.LISTENER_NAME,onlineSession);
		//session.setAttribute(SessionListener.LISTENER_NAME,onlineSession);
		logger.info(menus);
		logger.debug("登录成功");
		return "redirect:"+menus.get(0).getHref();
		
	}

}
