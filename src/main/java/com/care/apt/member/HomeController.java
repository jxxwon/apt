package com.care.apt.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("main")
	public String main() {
		return "default/main";
	}
	
	@RequestMapping("header")
	public String header() {
		return "default/header";
	}
}
