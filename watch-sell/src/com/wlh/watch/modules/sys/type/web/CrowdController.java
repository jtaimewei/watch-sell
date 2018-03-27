package com.wlh.watch.modules.sys.type.web;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wlh.watch.modules.sys.type.entity.Crowd;
import com.wlh.watch.modules.sys.type.service.CrowdService;

@Controller
@RequestMapping("/a/type/crowd")
public class CrowdController {
	
	@Resource
	private CrowdService crowdService;
	
	@RequestMapping("list")
	public String toCrowdList(HttpServletRequest request,
			HttpServletResponse response,Crowd crowd,Model model,HttpSession session){
		List<Crowd> crowdList = crowdService.findList();
		model.addAttribute("crowdList", crowdList);
		session.setAttribute("type", "crowd");
		return "modules/back/type/crowd/crowdManager";
	}
	
	@RequestMapping("save")
	public String save(Crowd crowd){
		if (crowd.getCrowdName() != null) {
			crowd.setId(UUID.randomUUID().toString().replaceAll("-", ""));
			crowdService.save(crowd);
			return "redirect:/a/type/crowd/list";
		}
		
		return "modules/back/type/crowd/addCrowd";
	}
	
	@RequestMapping("edit")
	public String edit(Crowd crowd,Model model){
		
		if (crowd.getCrowdName()!=null) {
			crowdService.edit(crowd);
			return "redirect:/a/type/crowd/list";
		}
		Crowd crowd1 = crowdService.getById(crowd.getId());
		model.addAttribute("crowd", crowd1);
		return "modules/back/type/crowd/editCrowd";
	}
	
	@RequestMapping("delete")
	public String delete(String id){
		crowdService.delete(id);
		return "redirect:/a/type/crowd/list";
	}

}
