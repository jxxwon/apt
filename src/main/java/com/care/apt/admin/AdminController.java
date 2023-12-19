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
	
	public String adminChk() {
		String loginId = (String)session.getAttribute("id");
		if(loginId == null || loginId == "") {
			return "redirect:/member/login";
		}
		
		String currentStatus = (String)session.getAttribute("status");
		if(!currentStatus.equals("1")) {
			return "redirect:/main";
		}
		return "관리자입니다.";
	}
	
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

		String result = this.adminChk();
		if(result.equals("관리자입니다.")){
			service.userList(cp, select, status, search, model);
			return "admin/userManage";
		} else {
			return result;
		}
	}
	
	@RequestMapping("admin/userManageContent")
	public String userManageContent(@RequestParam(required=false, value="id")String id, Model model) {
		String result = this.adminChk();
		if(result.equals("관리자입니다.")){
			service.selectUser(id, model);
			return "admin/userManageContent";
		} else {
			return result;
		}
	}
	
	@PostMapping("admin/userAuth")
	public String userAuth(String id, String action) {
		String result = this.adminChk();
		if(result.equals("관리자입니다.")){
			int auth = service.userAuth(id, action);
			if(auth == 1) {
				return "redirect:/admin/userManage";
			} else {
				return "admin/userManageContent";
			}
		} else {
			return result;
		}
	}
	
	@RequestMapping("admin/costManage")
	public String costManage(Model model) {
		String result = this.adminChk();
		if(result.equals("관리자입니다.")){
			service.condition(model);
			return "admin/costManage";
		} else {
			return result;
		}
	}
	
	@RequestMapping("admin/costRegister")
	public String costRegister(@RequestParam(required=false, value = "year") String year,
			@RequestParam(required=false, value = "month") String month,
			@RequestParam(required=false, value = "complex") String complex,
			@RequestParam(required=false, value = "unit") String unit, Model model) {
		String result = this.adminChk();
		if(result.equals("관리자입니다.")){
			service.condition(model);
			if(complex != null) {
				service.costRegSearch(year, month, complex, unit, model);
			}
			return "admin/costRegister";
		} else {
			return result;
		}
	}
}
