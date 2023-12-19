package com.care.apt.info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {
	@RequestMapping("info/subMenuInfo")
	public String subMenuInfo() {
		return "info/subMenuInfo";
	}
	@RequestMapping("info/notice")
	public String notice() {
		return "info/notice";
	}
}
