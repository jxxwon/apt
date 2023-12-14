package com.care.apt.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.care.apt.member.MemberDTO;

@Mapper
public interface AdminMapper {

	ArrayList<MemberDTO> selectUserAll(int begin, int end);

	int totalCount();

	ArrayList<MemberDTO> selectUserStatus(String status, int begin, int end);

	int statusCount(String status);

	MemberDTO selectUser(String id);

	int userAuth(String id, String status);

	int userDelete(String id, String withdrawId, String status);
}
