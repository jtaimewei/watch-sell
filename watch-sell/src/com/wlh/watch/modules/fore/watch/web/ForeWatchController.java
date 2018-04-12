package com.wlh.watch.modules.fore.watch.web;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.common.utils.DateUtils;
import com.wlh.watch.modules.sys.cart.entity.WatchCart;
import com.wlh.watch.modules.sys.cart.service.WatchCartService;
import com.wlh.watch.modules.sys.comment.entity.WatchComment;
import com.wlh.watch.modules.sys.comment.service.WatchCommentService;
import com.wlh.watch.modules.sys.type.entity.Brand;
import com.wlh.watch.modules.sys.type.entity.Crowd;
import com.wlh.watch.modules.sys.type.entity.Movement;
import com.wlh.watch.modules.sys.type.service.BrandService;
import com.wlh.watch.modules.sys.type.service.CrowdService;
import com.wlh.watch.modules.sys.type.service.MovementService;
import com.wlh.watch.modules.user.entity.User;
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
	@Resource
	private WatchCommentService watchCommentService;
	@Resource
	private WatchCartService watchCartService;
	/**
	 * 进入前台首页
	 * @return
	 */
	@RequestMapping("index")
	public String toIndex(){
		return "modules/fore/index";
	}
	
	/**
	 * 根据价格-品牌-人群-机芯 分类联合查询
	 * @return
	 */
	@RequestMapping("/watch/search")
	public String toWatch(Watch watch,Model model,HttpServletRequest request,
			HttpServletResponse response,HttpSession session){
		List<Brand> brands = brandService.findAllList();
		List<Crowd> crowds = crowdService.findList();
		List<Movement> movements = movementService.findAllList();
		model.addAttribute("brands", brands);
		model.addAttribute("crowds", crowds);
		model.addAttribute("movements", movements);
		//watch.setBrandName(name);
		if (watch.getgPrice() != 0) {
			session.setAttribute("gPrice", watch.getgPrice());
		} else {
			session.removeAttribute("gPrice");
		}
		if (watch.getlPrice() != 0) {
			session.setAttribute("lPrice", watch.getlPrice());
		} else {
			session.removeAttribute("lPrice");
		}
		if (watch.getBrandName() != null && !watch.getBrandName().equals("")) {
			session.setAttribute("brandName", watch.getBrandName());
		} else {
			session.removeAttribute("brandName");
		}
		if (watch.getCrowdName() != null && !watch.getCrowdName().equals("")) {
			session.setAttribute("crowdName", watch.getCrowdName());
		} else {
			session.removeAttribute("crowdName");
		}
		if (watch.getMovementName() != null && !watch.getMovementName().equals("")) {
			session.setAttribute("movementName", watch.getMovementName());
		} else {
			session.removeAttribute("movementName");
		}
		Page<Watch> page = watchService.findForePage(
				new Page<Watch>(request, response), watch);
		model.addAttribute("page", page);
		return "modules/fore/watch/foreWatch";
	}
	/**
	 * 查询单个手表信息(购买页面信息)
	 * @return
	 */
	@RequestMapping("/watch/detail")
	public String toOneWatch(WatchComment watchComment,Model model,HttpServletRequest request,
			HttpServletResponse response,HttpSession session){
		Watch watch = watchService.getById(watchComment.getWatchId());
		model.addAttribute("watch", watch);
		
		Page<WatchComment> page = watchCommentService.findForePage(
				new Page<WatchComment>(request, response), watchComment);
		model.addAttribute("page", page);
		
		return "modules/fore/watch/foreWatchDetail";
		//return "modules/fore/watch/for";
	}
	
	/**
	 * ajax - 加入购物车
	 * @return
	 */
	@RequestMapping(value="/watch/cart",produces="text/html;charset=UTF-8;")
	public @ResponseBody String addCart(@RequestBody WatchCart watchCart,HttpSession session){
		User user = (User) session.getAttribute("gUser");
		if (user == null) {
			return "您还没有登录,请先登录！";
		}
		String id = user.getId();
		watchCart.setCartState("0");
		watchCart.setUserId(id);
		watchCart.setCartCreateTime(DateUtils.getDate("yyyy-MM-dd HH:mm:ss"));
		watchCart.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		watchCartService.addCart(watchCart);
		int cartNumber = watchCartService.getCount(user.getId());
		if (cartNumber != 0) {
			session.setAttribute("cartNumber", cartNumber);
		}
		return "成功加入购物车！";
	}
	
}
