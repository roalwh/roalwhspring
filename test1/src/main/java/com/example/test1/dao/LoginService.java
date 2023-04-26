package com.example.test1.dao;

import java.util.HashMap;

import com.example.test1.model.User;

public interface LoginService {
	
	// 로그인
	HashMap<String, Object> searchUserInfo(HashMap<String, Object> map);
	
	// 회원가입
	void addUser(HashMap<String, Object> map);
	
	// 회원 중복체크
	int searchUserCnt(HashMap<String, Object> map);
}
