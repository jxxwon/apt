package com.care.apt.user;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.care.apt.member.MemberDTO;

@Mapper
public interface UserMapper {

	MemberDTO confirm(String id);

	void updateInfo(String id, String phone, String email);

	void updateInfoPw(String id, String cryptPassword, String phone, String email);

	ArrayList<InquiryDTO> myInquiryList(String id);

	int countInquiry();

	void inquiryWrite(int no, String title, String content, String replyContent, String reply, String writer,
			String writeTime);

}
