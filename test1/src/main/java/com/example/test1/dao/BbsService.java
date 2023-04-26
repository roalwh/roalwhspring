package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Bbs;

public interface BbsService {
	// 게시글 조회
	HashMap<String, Object> searchBbsList(HashMap<String, Object> map);
	
	// 게시글 등록
	void addBbs(HashMap<String, Object> map);
	
	// 게시글 삭제
	void removeBbs(HashMap<String, Object> map);
	
	// 게시글 상세보기
	HashMap<String, Object> searchBbs(HashMap<String, Object> map);
	
	// 게시글 수정
	void editBbs(HashMap<String, Object> map);
	
	// 댓글 등록
	void addBbsComment(HashMap<String, Object> map);
	
	// 댓글 삭제
	void removeComment(HashMap<String, Object> map);
	
	// 댓글 수정
	void editComment(HashMap<String, Object> map);

	
}
