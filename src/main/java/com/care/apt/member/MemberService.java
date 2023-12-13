package com.care.apt.member;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
		
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		if(!bpe.matches(pw, member.getPw())) {
			return "비밀번호를 확인하세요.";
		}

		String status = member.getStatus();
		if(status.equals("A")) {
			return "승인대기중입니다.";
		}
		
		if(status.equals("R")) {
			return "가입이 반려되었습니다. 관리자에게 문의하세요.";
		}
		
		session.setAttribute("id", id);
		session.setAttribute("status", status);
		return "로그인 성공";
	}

	public void logout() {
		session.invalidate();
	}

	public String idChk(String id) {
		MemberDTO result = mapper.idChk(id);
		if(result != null) {
			if(result.getStatus().equals("D")) {
				return "승인 대기중인 세대입니다.";
			}
			return "이미 가입된 세대입니다.";
		}
		return "가입 가능한 세대입니다.";
	}

	@Autowired MailService mailService;
	private String content;
	public String sendEmail(String email) {
		if(email == null || email.isEmpty())
			return "이메일을 확인 후 다시 입력하세요.";
		Random r = new Random();
		
		String authNum = String.format("%06d", r.nextInt(1000000));
		content = "하단의 인증번호를 회원가입 화면에 입력해주세요.\n 인증번호 : " + authNum;		
		System.out.println("인증번호 : " + authNum);
		String msg = mailService.sendMail(email, "[트리더힐] 인증번호가 도착했습니다.", content);
		if(msg.equals("인증번호가 전송되었습니다.") == false) {
			content = "";
		}
		return msg;
	}

	public String authEmail(String authNum) {
		String contentNum = content.substring(content.length()-6, content.length());
		if(authNum == null || authNum.isEmpty()) {
			return "인증번호를 입력해주세요.";
		}
		if(contentNum == null || contentNum.isEmpty())
			return "인증번호를 입력해주세요.";
		
		if(authNum.equals(contentNum)) {
			return "인증되었습니다.";
		} 
			return "인증번호를 확인해주세요.";
	}

	public String register(MemberDTO member, String confirmPw) {
		if(member.getId() == null || member.getId().isEmpty()) {
			return "아이디를 입력해주세요.";
		}
		if(member.getPw() == null || member.getPw().isEmpty()) {
			return "비밀번호를 입력해주세요.";
		}
		if(!member.getPw().equals(confirmPw)) {
			return "비밀번호와 비밀번호 확인은 일치해야 합니다.";
		}
		if(member.getEmail() == null || member.getEmail().isEmpty()) {
			return "이메일을 입력해주세요.";
		}
		if(member.getPhone() == null || member.getPhone().isEmpty()) {
			return "휴대폰번호를 입력해주세요.";
		}
		
		MemberDTO result = mapper.idChk(member.getId());
		
		if(result == null) {
			BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
			String cryptPassword = bpe.encode(member.getPw());
			member.setPw(cryptPassword);
			member.setStatus("D");
			mapper.register(member);
		}
		return "회원가입이 완료되었습니다.";
	}
}
