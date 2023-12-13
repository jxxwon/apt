package com.care.apt.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired HttpSession session;
	@Autowired AdminService service;
	
	@RequestMapping("admin/subMenuAdmin")
	public String subMenuAdmin() {
		return "admin/subMenuAdmin";
	}

	@RequestMapping("admin/userManage")
	public String userManage(@RequestParam(required = false, value = "currentPage")String cp, 
			@RequestParam(required=false, value = "select")String select,
			@RequestParam(required=false, value = "status")String status,
			@RequestParam(required=false, value = "search")String search,
			Model model) {
		
		String id = (String)session.getAttribute("id");
		if(id == null || id == "") {
			return "redirect:/member/login";
		}
		
		String currentStatus = (String)session.getAttribute("status");
		if(!currentStatus.equals("0")) {
			return "redirect:/main";
		}
		service.userList(cp, select, status, search, model);
		
		return "admin/userManage";
	}
	
	@RequestMapping("admin/userManageContent")
	public String userManageContent(@RequestParam(required=false, value="id")String id, Model model) {
		service.selectUser(id, model);
		return "admin/userManageContent";
	}
	
	@PostMapping("admin/userAuth")
	public String userAuth(String id, String action) {
		int result = service.userAuth(id, action);
		if(result == 1) {
			return "redirect:/admin/userManage";
		} else {
			return "admin/userManageContent";
		}
	}
}
