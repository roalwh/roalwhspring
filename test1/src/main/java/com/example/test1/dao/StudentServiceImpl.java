package com.example.test1.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.StudentMapper;
import com.example.test1.model.Student;
import com.example.test1.model.Subject;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired //Mapper와 연결
	private StudentMapper studentMapper;
	
	@Override
	public List<Student> searchStudentList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		List<Student> list = studentMapper.selectStudentList(map);
		return list;
	}

	@Override
	public Student searchStudentInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		Student info = studentMapper.selectStudentInfo(map);
		return info;
	}

	@Override
	public List<Subject> searchSubList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<Subject> list = studentMapper.subList(map);
		return list;
	}
}
