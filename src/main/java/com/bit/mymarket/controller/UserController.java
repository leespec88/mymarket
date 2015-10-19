package com.bit.mymarket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.mymarket.service.EmailService;
import com.bit.mymarket.service.UserService;
import com.bit.mymarket.vo.NotifyVo;
import com.bit.mymarket.vo.UserVo;

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
	public String join(@ModelAttribute UserVo vo, @RequestParam String pwCheck, String year, String month, String day) {
		vo.setBirth(year+"-"+month+"-"+day);
		boolean result = userService.getByEmail(vo.getEmail());
		if(result){
			return "redirect:/user/joinform";
		}
		
		if(pwCheck.equals(vo.getPassword())){
			userService.join(vo);
			emailService.sendEmail(vo.getEmail());
			return "redirect:/";
		}
		
		return "redirect:/user/joinform";
		
	}

	@RequestMapping("/loginform")
	public String loginform() {
		return "/user/loginform";
	}
	
	@RequestMapping("/loginCheck")
	@ResponseBody
	public Boolean loginCheck(@ModelAttribute UserVo vo){
		System.out.println("!!! Vo "+vo);
		UserVo userVo =  userService.getLoginInfo(vo);
		System.out.println("!!! userVo "+userVo);
		if(userVo==null){
			return false;
		}else{
			return true;
		}
	}
	@RequestMapping("/login")
	public String login(HttpSession session, 
						@ModelAttribute UserVo vo) {
		UserVo userVo =  userService.getLoginInfo(vo);
		
		if(userVo==null){
			return "redirect:/";
		}
		if("관리자".equals(userVo.getMemberType())){
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
	public String modifyform(HttpSession session, Model model){
		UserVo userVo = (UserVo)session.getAttribute("authUser");
		String year = null;
		String month = null;
		String day = null;
		
		if(userVo.getBirth()!=null){
			String birth[] = userVo.getBirth().split("-");
			year = birth[0];
			month= birth[1];
			day = birth[2];
		}else{
			year="1931";
			month="1";
			day="1";
		}
		
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("day",day);
		session.setAttribute("authUser", userVo);
			
		
		return "/user/modifyform";
	}
	
	@RequestMapping("/modify")
	public String modify(@ModelAttribute UserVo vo, HttpSession session, String year, String month, String day){
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		vo.setNo(authUser.getNo());
		vo.setBirth(year+"-"+month+"-"+day);
		userService.modify(vo);
		authUser.setEmail(vo.getEmail());
		authUser.setPhone(vo.getPhone());
		authUser.setGender(vo.getGender());
		authUser.setBirth(vo.getBirth());
		authUser.setPassword(vo.getPassword());
		session.setAttribute("authUser", authUser);
		return "redirect:/";
	}
	
	@RequestMapping("/notify")
	public void notify(@RequestParam Long itemNo,@RequestParam String msg, @RequestParam String name, @RequestParam String date){
		Long userNo = userService.getNoByitemNo(itemNo);
		String message = name+" : "+msg+"    - "+date;
		NotifyVo notifyVo = new NotifyVo();
		notifyVo.setUserNo(userNo);
		notifyVo.setMessage(message);
		notifyVo.setItemNo(itemNo);
		
		userService.messageInsert(notifyVo);
	}
	
	@RequestMapping("/getMessage")
	@ResponseBody
	public Map<String, Object> getMessage(@RequestParam Long userNo){
		List<NotifyVo> msgList = userService.getMessage(userNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msgList", msgList);
		return map;
	}
	
	@RequestMapping("/getMessageList")
	public String getMessageList(@RequestParam Long itemNo, Model model){
		System.out.println("이런샹샹바");
		List<NotifyVo> msgList = userService.getMessageByitemNo(itemNo);
		model.addAttribute("msgList", msgList);
		return "/user/msgList";
	}
	
	@RequestMapping("/msgDelete")
	public void msgDelete(@RequestParam Long msgNo){
		System.out.println("삭제할 넘버"+msgNo);
		userService.msgDelete(msgNo);
	}
	
	
}
