package com.care.apt.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
	@Autowired AdminService service;
	
	@RequestMapping("admin/subMenuAdmin")
	public String subMenuAdmin() {
		return "admin/subMenuAdmin";
	}

	@RequestMapping("admin/userManage")
	public String userManage(@RequestParam(required = false, value = "currentPage")String cp, Model model) {
		service.userList(cp, model);
		return "admin/userManage";
	}
	

}
