package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.StudentService;
import com.example.test1.model.Student;
import com.example.test1.model.Subject;
import com.google.gson.Gson;

@Controller
public class StudentController {
	@Autowired
    private StudentService studentService; 
	
    @RequestMapping("/student.do") 
    public String main(Model model) throws Exception{

        return "/test";
    }
    
    @RequestMapping(value = "/student/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Student> list = studentService.searchStudentList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
    
    @RequestMapping(value = "/student/info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
																		// {stuNo : "20153075"}
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Student info = studentService.searchStudentInfo(map);
		resultMap.put("info", info);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
    
    @RequestMapping(value = "/student/sublist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchSubList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Subject> list = studentService.searchSubList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
  
}