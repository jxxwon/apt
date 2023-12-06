package com.care.apt.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {
	@Autowired private MemberService service;
	
	@RequestMapping("member/login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("member/loginProc")
	public String loginProc(String id, String pw, RedirectAttributes ra, Model model) {
		if(id.isEmpty() || id == null) {
			return "member/login";
		}
		if(pw.isEmpty() || pw == null) {
			return "member/login";
		}
		String result = service.loginProc(id, pw);
		if(result.equals("로그인 성공") == false) {
			ra.addFlashAttribute("msg", result);
			return "redirect:/member/login";
		}
		return "redirect:/main";
	}
	
	@RequestMapping("logout")
	public String logout() {
		service.logout();
		return "redirect:/main";
	}
	
	@RequestMapping("member/register")
	public String register() {
		return "member/register";
	}
}
