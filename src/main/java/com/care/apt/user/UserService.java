package com.care.apt.user;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.apt.common.MailService;
import com.care.apt.member.MemberDTO;

@Service
public class UserService {
	
	@Autowired UserMapper mapper;
	
	public String confirm(String id, String confirmPw) {
		MemberDTO result = mapper.confirm(id);
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		if(!bpe.matches(confirmPw, result.getPw())) {
			return "비밀번호를 확인하세요.";
		}
		return "비밀번호 확인 완료";
	}

	public void myInfo(String id, Model model) {
		MemberDTO user = mapper.confirm(id);
		model.addAttribute("user", user);
	}
	
	@Autowired MailService mailService;
	private String content;
	public String sendEmail(String email) {
		if(email == null || email.isEmpty())
			return "이메일을 확인 후 다시 입력하세요.";
		Random r = new Random();
		
		String authNum = String.format("%06d", r.nextInt(1000000));
		content = "하단의 인증번호를 화면에 입력해주세요.\n 인증번호 : " + authNum;		
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

	public void updateInfo(String id, String newPw, String phone, String email) {
		if(newPw.isEmpty() || newPw == "") {
			mapper.updateInfo(id, phone, email);
		} else {
			BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
			String cryptPassword = bpe.encode(newPw);
			mapper.updateInfoPw(id, cryptPassword, phone, email);
		}
	}

	public void myInquiryList(String id, Model model) {
		ArrayList<InquiryDTO> inquiryList = mapper.myInquiryList(id);
		model.addAttribute("myInquiry", inquiryList);
	}

	public void inquiryWriteProc(String id, String title, String content) { 
		int no = mapper.countInquiry();
		if(no == 0) {
			no = 1;
		} else {
			no++;
		}
		
		String writer = id;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String writeTime = sdf.format(date);
		
		String replyContent = "";
		String reply = "N";
		
		mapper.inquiryWrite(no, title, content, replyContent, reply, writer, writeTime);
	}

	public void myInquiryContent(String id, String rn, Model model) {
		InquiryDTO myInquiry = mapper.myInquiryContent(id, rn);

		model.addAttribute("rn", rn);
		model.addAttribute("title", myInquiry.getTitle());
		model.addAttribute("writeTime", myInquiry.getWriteTime());
		model.addAttribute("reply", myInquiry.getReply());
		model.addAttribute("content", myInquiry.getContent());
	}

	public void updateInquiry(String id, String rn, String title, String content) {
		int no = mapper.findInquiryNo(id, rn);
		mapper.updateInquiry(no, title, content);
	}

	public void myInquiryDel(String id, String rn) {
		int no = mapper.findInquiryNo(id, rn);
		mapper.myInquiryDel(no);
	}
}
