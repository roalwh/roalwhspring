package com.example.test1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.LoginService;
import com.example.test1.model.User;
import com.google.gson.Gson;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping("/login.do") 
    public String main(Model model) throws Exception{
		String id = (String) session.getAttribute("sessionId");
		String name = (String) session.getAttribute("sessionName");
		String status = (String) session.getAttribute("sessionStatus");
		
		session.removeAttribute(id);
		session.removeAttribute(name);
		session.removeAttribute(status);
		
		session.invalidate();
		
        return "/login";
    }
	
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String get(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap = loginService.searchUserInfo(map);
		String result = (String) resultMap.get("result");
		if(result.equals("success")) {
			User user = (User) resultMap.get("user");
			session.setAttribute("sessionId", user.getId());
			session.setAttribute("sessionName", user.getName());
			session.setAttribute("sessionStatus", user.getStatus());
		}
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/join.do") 
    public String join(Model model) throws Exception{

        return "/join";
    }
	
	@RequestMapping(value = "/user/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		loginService.addUser(map);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/user/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = loginService.searchUserCnt(map);
		resultMap.put("cnt", cnt);
		resultMap.put("result", "success");
		return new Gson().toJson(resultMap);
	}
}


