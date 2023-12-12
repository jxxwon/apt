package com.care.apt.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSendException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.internet.MimeMessage;

@Service
public class MailService {
	@Autowired	private JavaMailSender mailSender;

	public String sendMail(String to, String subject, String content) {
		MimeMessage message = mailSender.createMimeMessage();

		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setSubject(subject); // 이메일의 제목
			messageHelper.setText(content);// 이메일의 본문
			messageHelper.setTo(to); // 수신자

			mailSender.send(message);
		} catch (MailSendException e) {
			e.printStackTrace();
			return "입력하신 이메일을 확인해주세요.";
		} catch (Exception e) {
			e.printStackTrace();
			return "이메일 전송에 문제가 발생했습니다. 잠시 후에 다시 시도 하세요.";
		}
		return "인증번호가 전송되었습니다.";
	}
}