package com.care.apt.user;

import org.apache.ibatis.annotations.Mapper;

import com.care.apt.member.MemberDTO;

@Mapper
public interface UserMapper {

	MemberDTO confirm(String id);

	void updateInfo(String id, String phone, String email);

	void updateInfoPw(String id, String cryptPassword, String phone, String email);

}
