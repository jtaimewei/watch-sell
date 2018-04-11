package com.wlh.watch.modules.watch.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.modules.order.entity.OrderDetail;
import com.wlh.watch.modules.sys.type.entity.Brand;
import com.wlh.watch.modules.sys.type.entity.Crowd;
import com.wlh.watch.modules.sys.type.entity.Movement;
import com.wlh.watch.modules.sys.type.service.BrandService;
import com.wlh.watch.modules.sys.type.service.CrowdService;
import com.wlh.watch.modules.sys.type.service.MovementService;
import com.wlh.watch.modules.watch.entity.Watch;
import com.wlh.watch.modules.watch.entity.WatchPicture;
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
	/**
	 * 进入手表 添加页面
	 * @param watch
	 * @param model
	 * @return
	 */
	@RequestMapping("save")
	public String tosave(Watch watch,Model model) {
		List<Brand> brands = brandService.findAllList();
		List<Crowd> crowds = crowdService.findList();
		List<Movement> movements = movementService.findAllList();
		model.addAttribute("brands", brands);
		model.addAttribute("crowds", crowds);
		model.addAttribute("movements", movements);
		return "modules/back/watch/addWatch";
	}
	/**
	 * 添加名表
	 * @param watch
	 * @param model
	 * @return
	 */
	@RequestMapping("add")
	public String save(@ModelAttribute("watch")Watch watch,Model model) {
		//1.先存手表信息
		String id = UUID.randomUUID().toString().replaceAll("-", "");
		watch.setId(id);
		//2.再存图片信息
		List<WatchPicture> wps = new ArrayList<WatchPicture>();
		List<WatchPicture> pics = watch.getWatchPicture();
		for (WatchPicture watchPicture : pics) {
				MultipartFile mf = watchPicture.getUploadFile();
			if (mf != null) {
				WatchPicture wp = new WatchPicture();
				String src =  mf.getOriginalFilename();
				String srch = src.substring(src.lastIndexOf(".") + 1);
				String pathName = UUID.randomUUID().toString().replaceAll("-", "") + "."+ srch;
				wp.setPictureSrc(pathName);
				wp.setId(UUID.randomUUID().toString().replaceAll("-", ""));
				wp.setWatchId(id);
				wp.setPictureSort(watchPicture.getPictureSort());
				wp.setPictureType(watchPicture.getPictureType());
				wps.add(wp);
				try {
					mf.transferTo(new File("D:/file/" + pathName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		watchService.addWatch(watch);
		watchService.addWatchPicture(wps);
		List<Brand> brands = brandService.findAllList();
		List<Crowd> crowds = crowdService.findList();
		List<Movement> movements = movementService.findAllList();
		model.addAttribute("brands", brands);
		model.addAttribute("crowds", crowds);
		model.addAttribute("movements", movements);
		return "modules/back/watch/addWatch";
	}
	
	@RequestMapping("toedit")
	public String toEdit(String id,Model model) {
		Watch watch = watchService.getById(id);
		List<Brand> brands = brandService.findAllList();
		List<Crowd> crowds = crowdService.findList();
		List<Movement> movements = movementService.findAllList();
		model.addAttribute("brands", brands);
		model.addAttribute("crowds", crowds);
		model.addAttribute("movements", movements);
		model.addAttribute("watch", watch);
		return "modules/back/watch/editWatch";
	}
	/**
	 * ajax-删除图片
	 */
	@RequestMapping("picture/delete")
	public @ResponseBody String getChart(String id) {
		watchService.deletePictureById(id);
		return "1";
	}
	/**
	 * 添加名表
	 * @param watch
	 * @param model
	 * @return
	 */
	@RequestMapping("edit")
	public String edit(@ModelAttribute("watch")Watch watch,Model model) {
		
		watchService.editWatch(watch);
		//2.再存图片信息
		List<MultipartFile> files = new ArrayList<MultipartFile>();
		List<WatchPicture> wps = new ArrayList<WatchPicture>();
		files = watch.getUploadFiles();
		if (files.get(0) != null){
			
		}
		for (int i = 0; i<files.size();i++ ){
		/*for (MultipartFile mf : files) {*/
			MultipartFile mf = files.get(i);
			if (mf!=null) {
				try {
					if (i < 3 && !mf.getOriginalFilename().equals("")) {
						WatchPicture wap = new WatchPicture();
						wap.setPictureSort(String.valueOf(i));
						wap.setWatchId(watch.getId());
						watchService.deletePictureByPicture(wap);
					} else if (i < 3 && mf.getOriginalFilename().equals("")) {
						continue;
					}
					WatchPicture wp = new WatchPicture();
					String src =  mf.getOriginalFilename();
					String srch = src.substring(src.lastIndexOf(".") + 1);
					String pathName = UUID.randomUUID().toString().replaceAll("-", "") + "."+ srch;
					wp.setPictureSrc(pathName);
					wp.setId(UUID.randomUUID().toString().replaceAll("-", ""));
					wp.setWatchId(watch.getId());
					wp.setPictureSort(String.valueOf(i));
					wps.add(wp);
					mf.transferTo(new File("D:/software_file/eclipse_workspase/watch-sell/watch-sell/WebContent/static/resources/watch/" + pathName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}
		watchService.addWatchPicture(wps);
		List<Brand> brands = brandService.findAllList();
		List<Crowd> crowds = crowdService.findList();
		List<Movement> movements = movementService.findAllList();
		model.addAttribute("brands", brands);
		model.addAttribute("crowds", crowds);
		model.addAttribute("movements", movements);
		return "redirect:/a/watch/list";
	}
}
