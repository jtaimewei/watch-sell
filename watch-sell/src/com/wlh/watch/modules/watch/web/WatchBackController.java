package com.wlh.watch.modules.watch.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wlh.watch.common.persistence.Page;
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
	//private static final String PATHTO = "D:/software_file/eclipse_workspase/watch-sell/watch-sell/WebContent/static/resources/watch/";
	private static final String PATHTO = "D:/file/";
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
					mf.transferTo(new File(PATHTO + pathName));
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
		String id = watch.getId();
		
		//2.再存图片信息
		//2.再存图片信息
		List<WatchPicture> wps = new ArrayList<WatchPicture>();
		List<WatchPicture> pics = watch.getWatchPicture();
		for (WatchPicture watchPicture : pics) {
				MultipartFile mf = watchPicture.getUploadFile();//新增加的
				MultipartFile mfed = watchPicture.getUploadEditFile();//修改原来的
			//新加的	
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
					mf.transferTo(new File(PATHTO + pathName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			//修改原来的
			if (mfed != null) {
				if (watchPicture.getEditType().equals("1")) {
					System.err.println("删除这个图片信息" + watchPicture.getId());
					//删除图片信息
					watchService.deletePictureById(watchPicture.getId());
				} else if (watchPicture.getEditType().equals("0")) {
					WatchPicture wp1 = new WatchPicture();
					wp1.setId(watchPicture.getId());
					wp1.setPictureSort(watchPicture.getPictureSort());
					wp1.setPictureType(watchPicture.getPictureType());
					String src1 =  mfed.getOriginalFilename();
					if (src1 != null && !src1.equals("")) {
						String srch1 = src1.substring(src1.lastIndexOf(".") + 1);
						String pathName1 = UUID.randomUUID().toString().replaceAll("-", "") + "."+ srch1;
						wp1.setPictureSrc(pathName1);
						try {
							/*mfed.transferTo(new File("D:/software_file/eclipse_workspase/watch-sell/watch-sell/WebContent/static/resources/watch/" + pathName1));*/
							mfed.transferTo(new File(PATHTO + pathName1));
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					//修改图片信息
					watchService.editWatchPicture(wp1);
				}
			}
		}
		//新加的图片信息
		watchService.addWatchPicture(wps);
		watchService.editWatch(watch);
		/*List<Brand> brands = brandService.findAllList();
		List<Crowd> crowds = crowdService.findList();
		List<Movement> movements = movementService.findAllList();
		model.addAttribute("brands", brands);
		model.addAttribute("crowds", crowds);
		model.addAttribute("movements", movements);*/
		return "redirect:/a/watch/list?repage";
	}
}
