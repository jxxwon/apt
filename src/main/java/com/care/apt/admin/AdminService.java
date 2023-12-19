package com.care.apt.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.apt.common.PageService;
import com.care.apt.member.MemberDTO;

@Service
public class AdminService {

	@Autowired AdminMapper mapper;
	
	public void userList(String cp, String select, String status, String search, Model model) {
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

		ArrayList<MemberDTO>users = new ArrayList<MemberDTO>();
		
		if(select == null || (status == null && search == "") || status.equals("all")){
			users = mapper.selectUserAll(begin, end);
		}else {
			if(!status.equals("all")) {
				totalPage = mapper.statusCount(status);
				users = mapper.selectUserStatus(status, begin, end);
				url = "userManage?select=status&status="+status+"&currentPage=";
			}
		}
		
		String result = PageService.printPage(url, currentPage, totalPage, pageBlock);
		
		model.addAttribute("users", users);
		model.addAttribute("result", result);
		model.addAttribute("currentPage", currentPage);		
	}

	public void selectUser(String id, Model model) {
		MemberDTO user = mapper.selectUser(id);
		model.addAttribute("user", user);
	}

	public int userAuth(String id, String action) {
		String status = "A";
		if(action.equals("userDelete")) {
			status = "0";
			Random r = new Random();
			String withdrawId = String.format("%06d", r.nextInt(1000000));
			return mapper.userDelete(id, withdrawId, status);
		}
		if(action.equals("userReject")) {
			status = "R";
		}
		return mapper.userAuth(id, status);
	}

	public void condition(Model model) {
		Date date = new Date();
		SimpleDateFormat yearFormat = new SimpleDateFormat("yyyy");
		String year = yearFormat.format(date);
		model.addAttribute("year", year);
		
		SimpleDateFormat monthFormat = new SimpleDateFormat("MM");
		String month = monthFormat.format(date);
		model.addAttribute("month", month);
	}

	public void costRegSearch(String year, String month, String complex, String unit, Model model) {
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("complex", complex);
		model.addAttribute("unit", unit);
		System.out.println(unit);
	}

}
