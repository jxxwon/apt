package com.care.apt.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	MemberDTO login(String id, String pw);

	MemberDTO idChk(String id);

	void register(MemberDTO member);

}
