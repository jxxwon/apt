package com.care.apt.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	@Autowired private MemberService service;
	@Autowired HttpSession session;
	
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
		if(!result.equals("로그인 성공")) {
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
	
	@ResponseBody
	@PostMapping(value="member/idChk", produces = "text/plain; charset=UTF-8")
	public String idChk(@RequestBody(required = false) String id) {
		String result = service.idChk(id);
		return result;
	}
	
	@ResponseBody
	@PostMapping(value="member/sendEmail", produces = "text/plain; charset=UTF-8")
	public String sendEmail(@RequestBody(required=false) String email) {
		String result = service.sendEmail(email);
		return result;
	}

	@ResponseBody
	@PostMapping(value="member/authEmail", produces = "text/plain; charset=UTF-8")
	public String authEmail(@RequestBody(required=false) String authNum) {
		String result = service.authEmail(authNum);
		return result;
	}
	
	@PostMapping("member/regProc")
	public String regProc(MemberDTO member, String confirmPw, String complex, String unit) {
		String id = complex + "-" + unit;
		member.setId(id);
		service.register(member, confirmPw);
		return "redirect:/member/login";
	}
}
