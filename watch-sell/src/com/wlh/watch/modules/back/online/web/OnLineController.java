package com.wlh.watch.modules.back.online.web;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wlh.watch.modules.back.online.entity.OnlineSession;
import com.wlh.watch.modules.sys.socket.MyWebSocketHandler;
import com.wlh.watch.modules.user.service.UserService;

@Controller
@RequestMapping("/a")
public class OnLineController {
	@Resource
	private UserService userService;
	
	@RequestMapping("back")
	public String goBack(Model model,HttpSession session){
		List<OnlineSession> onList = new ArrayList<OnlineSession>();
		Map<String, OnlineSession> onlineList = MyWebSocketHandler.getSessions();
		
		Iterator<Map.Entry<String, OnlineSession>> entries = onlineList.entrySet().iterator(); 
		while (entries.hasNext()) { 
			Map.Entry<String,OnlineSession> entry = entries.next();
			onList.add(entry.getValue());
		}
		
		model.addAttribute("onlineList", onList);
		session.setAttribute("head", "/a/back");
		return "modules/back/online/online";
	}

}
