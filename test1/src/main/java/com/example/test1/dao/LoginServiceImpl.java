package com.example.test1.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.LoginMapper;
import com.example.test1.model.User;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	LoginMapper loginMapper;
	
	@Override
	public HashMap<String, Object> searchUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = loginMapper.selectUserCnt(map);
		if(cnt > 0){
			User user = loginMapper.selectUserInfo(map);
			if(user != null) {
				resultMap.put("user", user);
				resultMap.put("result", "success");
				resultMap.put("message", user.getName() + "님 환영합니다.");
			} else {
				resultMap.put("result", "fail");
				resultMap.put("message", "패스워드를 다시 확인해주세요.");
			}
		} else {
			resultMap.put("result", "fail");
			resultMap.put("message", "아이디가 존재하지 않습니다.");
		}
		
		return resultMap;
	}

	@Override
	public void addUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		loginMapper.insertUser(map);
	}

	@Override
	public int searchUserCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return loginMapper.selectUserCnt(map);
	}

	@Override
	public int searchMypageUserCnt(HashMap<String, Object> map) {
		
		return loginMapper.selectMypageUserCnt(map);
	}
	
	@Override
	public HashMap<String, Object> searchUserJoinInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", loginMapper.selectUserJoinList(map));
		
		
		
		return resultMap;
	}

	@Override
	public void editUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		loginMapper.updateUser(map);
	}
}
