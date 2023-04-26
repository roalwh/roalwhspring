package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Student;
import com.example.test1.model.Subject;

public interface StudentService {
	// 학생 리스트
	List<Student> searchStudentList(HashMap<String, Object> map) throws Exception;
	
	// 학생 상세정보(1명)
	Student searchStudentInfo(HashMap<String, Object> map);
	
	// 과목 리스트
	List<Subject> searchSubList(HashMap<String, Object> map);

}
