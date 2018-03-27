package com.wlh.watch.modules.back.online.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wlh.watch.modules.back.online.entity.OnlineSession;
import com.wlh.watch.modules.back.online.session.SessionListener;

@Controller
@RequestMapping("/a")
public class OnLineController {
	
	@RequestMapping("back")
	public String goBack(Model model,HttpSession session){
		session.setAttribute("head", "/a/back");
		List<OnlineSession> onlineList = SessionListener.getSessions();
		model.addAttribute("onlineList", onlineList);
		return "modules/back/online/online";
	}

}
