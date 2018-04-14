package com.wlh.watch.modules.sys.message.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/a")
public class MessageController {
	
	@RequestMapping("/socket")
	public String toSocket() {
		
		return "modules/socket/kefu";
	}

}
