package com.bit.mymarket.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.mymarket.service.EmailService;
import com.bit.mymarket.service.UserService;
import com.bit.mymarket.vo.UserVo;
import com.sun.org.glassfish.gmbal.ParameterNames;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private EmailService emailService;
	
	@RequestMapping("/joinform")
	public String joinform() {
		return "/user/joinform";
	}
	@RequestMapping("/join")
	public String join(@ModelAttribute UserVo vo, @RequestParam String pwCheck) {
		boolean result = userService.getByEmail(vo.getEmail());
		if(result){
			return "redirect:/user/joinform";
		}
		
		if(pwCheck.equals(vo.getPassword())){
			userService.join(vo);
			emailService.sendEmail(vo.getEmail());
			return "/";
		}
		
		return "redirect:/user/joinform";
		
	}
	@RequestMapping("/joinsuccess")
	public String joinsuccess(@ModelAttribute UserVo userVo) {
		return "/user/joinsuccess";
	}

	@RequestMapping("/loginform")
	public String loginform() {
		return "/user/loginform";
	}
	
	@RequestMapping("/login")
	public String login(HttpSession session, 
						@ModelAttribute UserVo vo) {
		UserVo userVo =  userService.getLoginInfo(vo);
		
		if(userVo==null){
			return "redirect:/user/loginform";
		}
		if("°ü¸®ÀÚ".equals(userVo.getMemberType())){
			session.setAttribute("authUser", userVo);
			return "redirect:/admin/memberList";
		}else{
			session.setAttribute("authUser", userVo);
			return "redirect:/";
		}
	}
	@RequestMapping("/loginBySns")
	public String loginBySns(HttpSession session, 
							 @ModelAttribute UserVo vo){
		UserVo userVo = userService.getByIdNo(vo.getIdNo());
		if(userVo==null){
			userService.join(vo);
			userVo = userService.getByIdNo(vo.getIdNo());
			session.setAttribute("authUser", userVo);
			return "redirect:/";
		}
		session.setAttribute("authUser", userVo);
		return "redirect:/";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("authUser");
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/checkEmail")
	@ResponseBody
	public boolean checkEmail(String email) {
		if("".equals(email)){
			return true;
		}
		boolean result = userService.getByEmail(email);
		System.out.println("result : " + result);
		return result;
	}
	
	@RequestMapping("/modifyform")
	public String modifyform(){
		return "/user/modifyform";
	}
	
	@RequestMapping("/modify")
	public String modify(@ModelAttribute UserVo vo, HttpSession session){
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		vo.setNo(authUser.getNo());
		userService.modify(vo);
		authUser.setEmail(vo.getEmail());
		authUser.setPhone(vo.getPhone());
		authUser.setGender(vo.getGender());
		authUser.setBirth(vo.getBirth());
		session.setAttribute("authUser", authUser);
		return "redirect:/";
	}
	
	@RequestMapping("/pwModify")
	public String pwModify(@RequestParam String password, HttpSession session){
		userService.pwModify(password);
		UserVo authUser=(UserVo)session.getAttribute("authUser");
		authUser.setPassword(password);
		session.setAttribute("authUser", authUser);
		return "redirect:/";
	}
}
