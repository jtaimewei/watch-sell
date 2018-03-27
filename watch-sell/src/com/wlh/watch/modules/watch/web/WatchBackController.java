package com.wlh.watch.modules.watch.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.modules.sys.type.entity.Brand;
import com.wlh.watch.modules.sys.type.entity.Crowd;
import com.wlh.watch.modules.sys.type.entity.Movement;
import com.wlh.watch.modules.sys.type.service.BrandService;
import com.wlh.watch.modules.sys.type.service.CrowdService;
import com.wlh.watch.modules.sys.type.service.MovementService;
import com.wlh.watch.modules.watch.entity.Watch;
import com.wlh.watch.modules.watch.service.WatchService;

@Controller
@RequestMapping("/a/watch")
public class WatchBackController {
	
	@Resource
	private WatchService watchService;
	@Resource
	private BrandService brandService;
	@Resource
	private CrowdService crowdService;
	@Resource
	private MovementService movementService;
	
	@RequestMapping("list")
	public String toWatch(Model model,HttpServletRequest request,
			HttpServletResponse response,Watch watch,HttpSession session) {
		Page<Watch> page = watchService.findPage(
				new Page<Watch>(request, response), watch);
		model.addAttribute("page", page);
		session.setAttribute("head", "/a/watch/list");
		return "modules/back/watch/watchManager";
	}
	
	@RequestMapping("save")
	public String save(Watch watch,Model model) {
		List<Brand> brands = brandService.findAllList();
		List<Crowd> crowds = crowdService.findList();
		List<Movement> movements = movementService.findAllList();
		model.addAttribute("brands", brands);
		model.addAttribute("crowds", crowds);
		model.addAttribute("movements", movements);
		return "modules/back/watch/addWatch";
	}
}
