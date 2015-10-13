package com.bit.mymarket.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.mymarket.service.InterestService;
import com.bit.mymarket.vo.InterestLocationVo;
import com.bit.mymarket.vo.UserVo;

@Controller
@RequestMapping("/interest")
public class InterestController {
	
	@Autowired
	InterestService interestService;
	
	@RequestMapping("/form")
	public String InterestLocationForm(HttpSession session, Model model){
		
		UserVo userVo = (UserVo) session.getAttribute("authUser");
		System.out.println("유저번호는 : " + userVo.getNo());
		List<InterestLocationVo> list = interestService.getIntLocation(userVo.getNo());
		
		model.addAttribute("list", list);
		model.addAttribute("userNo", userVo.getNo());
		
		return "/user/interestLocation";
		
	}
	
	@RequestMapping("/location")
	public String InterestLocation(@ModelAttribute InterestLocationVo vo){
		
		interestService.insertInterestLocation(vo);
		
		return "redirect:/interest/form";
		
	}
	
	@RequestMapping("/deleteLocation/{no}")
	public String deleteLocation(@PathVariable Long no){
		
		System.out.println("#####################"+no);
		interestService.deleteLocation(no);
		
		return "redirect:/interest/form";
		
	}
	
}
