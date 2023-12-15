package com.care.apt.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired HttpSession session;
	@Autowired UserService service;
	
	public String loginChk() {
		String id = (String)session.getAttribute("id");
		if(id.isEmpty() || id == null) {
			return "redirect:/main";
		}
		return "로그인";
	}
	
	@RequestMapping("user/subMenuUser")
	public String subMenuUser() {
		return "user/subMenuUser";
	}
	
	@RequestMapping("user/myPage")
	public String myPage() {
		String result = this.loginChk();
		if(!result.equals("로그인")){
			return "redirect:/member/login";
		}
		return "user/myPage";
	}
	
	@PostMapping("user/confirmProc")
	public String confirmProc(String confirmPw) {
		String result = this.loginChk();
		if(!result.equals("로그인")){
			return "redirect:/member/login";
		}
		
		String id = (String)session.getAttribute("id");
		String confirmResult = service.confirm(id, confirmPw);
		if(!confirmResult.equals(("비밀번호 확인 완료"))){
			return "redirect:/main";
		}
		return "redirect:/user/myInfo";
	}
	
	@RequestMapping("user/myInfo")
	public String myInfo(Model model) {
		String result = this.loginChk();
		if(!result.equals("로그인")){
			return "redirect:/member/login";
		}
		
		String id = (String)session.getAttribute("id");
		service.myInfo(id, model);
		return "user/myInfo";
	}
	
	@ResponseBody
	@PostMapping(value="user/sendEmail", produces = "text/plain; charset=UTF-8")
	public String sendEmail(@RequestBody(required=false) String email) {
		String result = service.sendEmail(email);
		return result;
	}

	@ResponseBody
	@PostMapping(value="user/authEmail", produces = "text/plain; charset=UTF-8")
	public String authEmail(@RequestBody(required=false) String authNum) {
		String result = service.authEmail(authNum);
		return result;
	}
	
	@PostMapping(value="user/updateInfo", produces="text/plain; charset=UTF-8")
	public String updateInfo(String newPw, String phone, String email) {
		String result = this.loginChk();
		if(!result.equals("로그인")){
			return "redirect:/member/login";
		}
		
		String id = (String)session.getAttribute("id");
		service.updateInfo(id, newPw, phone, email);
		return "redirect:/user/myInfo";
	}
}
