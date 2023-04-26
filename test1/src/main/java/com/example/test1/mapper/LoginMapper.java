package com.example.test1.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.User;

@Mapper
public interface LoginMapper {
	// 로그인
	User selectUserInfo(HashMap<String, Object> map);
	
	// 중복체크
	int selectUserCnt(HashMap<String, Object> map);
	
	// 회원가입
	void insertUser(HashMap<String, Object> map);
}
