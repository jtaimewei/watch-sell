package com.wlh.watch.modules.sys.type.web;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wlh.watch.common.persistence.Page;
import com.wlh.watch.modules.sys.type.entity.Brand;
import com.wlh.watch.modules.sys.type.service.BrandService;

@Controller
@RequestMapping("/a/type/brand")
public class BrandController {
	
	@Resource
	private BrandService brandService;
	
	@RequestMapping("list")
	public String toBrandList(HttpServletRequest request,
			HttpServletResponse response,Brand brand,Model model,HttpSession session){
		Page<Brand> page = brandService.findPage(
				new Page<Brand>(request, response), brand);
		model.addAttribute("page", page);
		session.setAttribute("type", "brand");
		session.setAttribute("head", "/a/type/brand/list");
		return "modules/back/type/brand/brandManager";
	}
	
	@RequestMapping("save")
	public String save(Brand brand){
		if (brand.getBrandName() != null) {
			brand.setId(UUID.randomUUID().toString().replaceAll("-", ""));
			brandService.save(brand);
			return "redirect:/a/type/brand/list";
		}
		
		return "modules/back/type/brand/addBrand";
	}
	
	@RequestMapping("edit")
	public String edit(Brand brand,Model model){
		
		if (brand.getBrandName()!=null) {
			brandService.edit(brand);
			return "redirect:/a/type/brand/list";
		}
		Brand brand1 = brandService.getById(brand.getId());
		model.addAttribute("brand", brand1);
		return "modules/back/type/brand/editBrand";
	}
	
	@RequestMapping("delete")
	public String delete(String id){
		brandService.delete(id);
		return "redirect:/a/type/brand/list";
	}

}
