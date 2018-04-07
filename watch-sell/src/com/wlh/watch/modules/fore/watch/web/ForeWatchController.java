package com.wlh.watch.modules.fore.watch.web;

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
@RequestMapping("/b")
public class ForeWatchController {
	@Resource
	private WatchService watchService;
	@Resource
	private BrandService brandService;
	@Resource
	private CrowdService crowdService;
	@Resource
	private MovementService movementService;
	/**
	 * 进入前台首页
	 * @return
	 */
	@RequestMapping("index")
	public String toIndex(){
		return "modules/fore/index";
	}
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/watch/brand")
	public String toWatch(String name,Watch watch,Model model,HttpServletRequest request,
			HttpServletResponse response){
		List<Brand> brands = brandService.findAllList();
		List<Crowd> crowds = crowdService.findList();
		List<Movement> movements = movementService.findAllList();
		model.addAttribute("brands", brands);
		model.addAttribute("crowds", crowds);
		model.addAttribute("movements", movements);
		watch.setBrandName(name);
		Page<Watch> page = watchService.findForePage(
				new Page<Watch>(request, response), watch);
		model.addAttribute("page", page);
		return "modules/fore/watch/foreWatch";
	}
	
	
}
