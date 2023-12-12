package com.care.apt.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.care.apt.member.MemberDTO;

@Mapper
public interface AdminMapper {

	ArrayList<MemberDTO> selectUserAll(int begin, int end);

	int totalCount();
}
