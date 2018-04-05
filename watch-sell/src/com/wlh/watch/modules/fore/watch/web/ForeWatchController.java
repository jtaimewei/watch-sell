package com.wlh.watch.modules.fore.watch.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/b")
public class ForeWatchController {


	/**
	 * 进入前台首页
	 * @return
	 */
	@RequestMapping("index")
	public String toIndex(){
		return "modules/fore/index";
	}
	
	
}
