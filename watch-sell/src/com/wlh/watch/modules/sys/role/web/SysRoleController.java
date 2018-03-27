package com.wlh.watch.modules.sys.role.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.modules.sys.menu.entity.SysMenu;
import com.wlh.watch.modules.sys.menu.service.SysMenuService;
import com.wlh.watch.modules.sys.role.entity.SysRole;
import com.wlh.watch.modules.sys.role.service.SysRoleService;
import com.wlh.watch.modules.user.entity.User;
import com.wlh.watch.modules.user.service.UserService;

@Controller
@RequestMapping("/a/role")
public class SysRoleController {
	
	@Resource
	private SysRoleService sysRoleService;
	@Resource
	private SysMenuService sysMenuService;
	@Resource
	private UserService userService;
	
	@RequestMapping("list")
	public String roleList(Model model,HttpSession session){
		session.setAttribute("urm", "role");
		List<SysRole> list = sysRoleService.findList();
		model.addAttribute("roleList", list);
		return "modules/back/urm/roleManager";
	}
	//进入  添加角色页面
	@RequestMapping("toadd")
	public String toAdd(Model model,HttpSession session){
		List<SysMenu> menuList = sysMenuService.findAll();
		model.addAttribute("menuList", menuList);
		return "modules/back/urm/addRole";
	}
	//添加角色 -  -- 添加 角色-菜单
	@RequestMapping("add")
	public String add(SysRole role,Model model,HttpSession session){
		String id = UUID.randomUUID().toString().replaceAll("-", "");
		role.setId(id);
		sysRoleService.addRole(role);
		
		List<SysMenu> menus = role.getMenus();
		for (SysMenu sysMenu : menus) {
			if (sysMenu.getId() != null){
				Map<String, String> map = new HashMap<String, String>();
				map.put("roleId", id);
				map.put("menuId", sysMenu.getId());
				sysRoleService.addRoleMenu(map);
			}
		}
		return "redirect:/a/role/list";
	}
	//删除角色 逻辑删除 del_flag = 1
	@RequestMapping("delete")
	public String delete(String id,Model model,HttpSession session){
		sysRoleService.deleteById(id);
		return "redirect:/a/role/list";
	}
	
	// 进入 角色 修改页面
	@RequestMapping("toedit")
	public String toEdit(String id,Model model,HttpSession session){
		SysRole roleEdit = sysRoleService.getById(id);//要修改的角色
		model.addAttribute("roleEdit", roleEdit);
		List<SysMenu> menuList = sysMenuService.findAll();//所有菜单
		model.addAttribute("menuList", menuList);
		List<SysMenu> myMenus = sysMenuService.getByRoleId(id);//角色拥有的菜单
		List<String> myMenuList = new ArrayList<String>();//角色拥有的菜单id
		for (SysMenu sysMenu : myMenus) {
			myMenuList.add(sysMenu.getId());
		}
		model.addAttribute("myMenuList", myMenuList);
		
		return "modules/back/urm/editRole";
	}
	
	//角色 修改  
	@RequestMapping("edit")
	public String edit(SysRole role,Model model,HttpSession session){
		
		sysRoleService.editById(role);
		
		List<SysMenu> myMenus = sysMenuService.getByRoleId(role.getId());//角色拥有的菜单
		List<String> myMenuList = new ArrayList<String>();//角色拥有的菜单id
		for (SysMenu sysMenu : myMenus) {
			myMenuList.add(sysMenu.getId());
		}
		
		List<SysMenu> getMenus = role.getMenus();//页面获取的菜单
		List<String> getMenuList = new ArrayList<String>();//页面获取的菜单id
		for (SysMenu sysMenu : getMenus) {
			if (sysMenu.getId() != null) {
				getMenuList.add(sysMenu.getId());
			}
		}
		
		// 角色-菜单  删除
		for (String myMenu : myMenuList) {
			if (!getMenuList.contains(myMenu)) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("roleId", role.getId());
				map.put("menuId", myMenu);
				sysRoleService.deleteRoleMenu(map);
			}
		}
		
		// 角色-菜单   添加
		for (String getMenu : getMenuList) {
			if (!myMenuList.contains(getMenu)) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("roleId", role.getId());
				map.put("menuId", getMenu);
				sysRoleService.addRoleMenu(map);
			}
		}
		return "redirect:/a/role/list";
	}
	// 查看 角色 下的 用户
	@RequestMapping("distri")
	public String distri(String id,Model model,HttpSession session,HttpServletRequest request,
			HttpServletResponse response){
		User user= new User();
		user.setRoleId(id);//角色id
		Page<User> page = userService.findRoleUserPage(
				new Page<User>(request, response), user);
		model.addAttribute("roleId", id);
		model.addAttribute("page", page);
		return "modules/back/urm/distriRole";
	}
	
	//移除角色下的用户
	@RequestMapping("remove")
	public String remove(String userId,String roleId,Model model,HttpSession session){
		Map<String, String> map = new HashMap<String, String>();
		map.put("roleId", roleId);
		map.put("userId", userId);
		sysRoleService.removeRoleUser(map);
		model.addAttribute("id", roleId);
		return "redirect:/a/role/distri";
	}
	
	
}
