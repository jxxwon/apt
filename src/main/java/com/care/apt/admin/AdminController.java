package com.care.apt.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String userManage(@RequestParam(required = false, value = "currentPage")String cp, Model model) {
		
		String id = (String)session.getAttribute("id");
		if(id == null || id == "") {
			return "redirect:/member/login";
		}
		
		String status = (String)session.getAttribute("status");
		if(status != "0") {
			return "redirect:/main";
		}
		
		service.userList(cp, model);
		return "admin/userManage";
	}
	

}
