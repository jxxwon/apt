package com.care.apt.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.apt.common.PageService;
import com.care.apt.member.MemberDTO;

@Service
public class AdminService {

	@Autowired AdminMapper mapper;
	
	public void userList(String cp, Model model) {
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(cp);
		}catch(Exception e) {
			currentPage = 1;
		}
		
		int pageBlock = 10;

		int end = pageBlock * currentPage;
		int begin = end - pageBlock + 1;
		
		int totalPage = mapper.totalCount();
		
		String url = "userManage?currentPage=";
		String result = PageService.printPage(url, currentPage, totalPage, pageBlock);
		
		ArrayList<MemberDTO>users = mapper.selectUserAll(begin, end);
		
		model.addAttribute("users", users);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);
	}

}
