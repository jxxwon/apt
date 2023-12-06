package com.care.apt.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class MemberService {

	@Autowired MemberMapper mapper;
	@Autowired HttpSession session;
	
	public String loginProc(String id, String pw) {
		MemberDTO member = mapper.login(id, pw);
		if(member == null) {
			return "등록되지 않은 아이디입니다.";
		}
		
		String dbPw = member.getPw();
		if(!pw.equals(dbPw)) {
			return "비밀번호를 확인하세요.";
		}
		session.setAttribute("id", id);
		session.setAttribute("status", member.getStatus());
		return "로그인 성공";
	}

	public void logout() {
		session.invalidate();
	}
}
