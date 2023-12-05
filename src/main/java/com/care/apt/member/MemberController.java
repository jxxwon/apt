package com.care.apt.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@RequestMapping("main")
	public String main() {
		return "default/main";
	}
}
