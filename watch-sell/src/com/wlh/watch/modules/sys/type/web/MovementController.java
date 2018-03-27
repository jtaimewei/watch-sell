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
import com.wlh.watch.modules.sys.type.entity.Movement;
import com.wlh.watch.modules.sys.type.service.MovementService;

@Controller
@RequestMapping("/a/type/movement")
public class MovementController {
	
	@Resource
	private MovementService movementService;
	
	@RequestMapping("list")
	public String toMovementList(HttpServletRequest request,
			HttpServletResponse response,Movement movement,Model model,HttpSession session){
		Page<Movement> page = movementService.findPage(
				new Page<Movement>(request, response), movement);
		model.addAttribute("page", page);
		session.setAttribute("type", "movement");
		return "modules/back/type/movement/movementManager";
	}
	
	@RequestMapping("save")
	public String save(Movement movement){
		if (movement.getMovementName() != null) {
			movement.setId(UUID.randomUUID().toString().replaceAll("-", ""));
			movementService.save(movement);
			return "redirect:/a/type/movement/list";
		}
		
		return "modules/back/type/movement/addMovement";
	}
	
	@RequestMapping("edit")
	public String edit(Movement movement,Model model){
		
		if (movement.getMovementName()!=null) {
			movementService.edit(movement);
			return "redirect:/a/type/movement/list";
		}
		Movement movement1 = movementService.getById(movement.getId());
		model.addAttribute("movement", movement1);
		return "modules/back/type/movement/editMovement";
	}
	
	@RequestMapping("delete")
	public String delete(String id){
		movementService.delete(id);
		return "redirect:/a/type/movement/list";
	}

}
