package com.wlh.watch.modules.sys.menu.web;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wlh.watch.modules.sys.menu.entity.SysMenu;
import com.wlh.watch.modules.sys.menu.service.SysMenuService;

@Controller
@RequestMapping("/a/menu")
public class SysMenuController {
	
	@Resource
	private SysMenuService sysMenuService;
	
	@RequestMapping("list")
	public String menuList(Model model,HttpSession session){
		session.setAttribute("urm", "menu");
		List<SysMenu> list = sysMenuService.findAll();
		model.addAttribute("menuList", list);
		return "modules/back/urm/menuManager";
	}
	//进入 添加 菜单页面
	@RequestMapping("toadd")
	public String toAdd(Model model,HttpSession session){
		
		return "modules/back/urm/addMenu";
	}
	//添加菜单
	@RequestMapping("add")
	public String add(SysMenu menu,Model model,HttpSession session){
		menu.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		sysMenuService.addMenu(menu);
		return "redirect:/a/menu/list";
	}
	
	//进入 修改菜单页面
	@RequestMapping("toedit")
	public String toEdit(String id,Model model){
		SysMenu editMenu = sysMenuService.getByMenuId(id);
		model.addAttribute("editMenu", editMenu);
		return "modules/back/urm/editMenu";
	}
	//修改 菜单
	@RequestMapping("edit")
	public String edit(SysMenu menu,Model model){
		sysMenuService.editMenu(menu);
		
		return "redirect:/a/menu/list";
	}
	
	//删除菜单 -- 逻辑删除 del_flag = '1'
	@RequestMapping("delete")
	public String delete(String id,Model model){
		sysMenuService.deleteMenu(id);
		return "redirect:/a/menu/list";
	}
	

}
