package com.bit.mymarket.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.mymarket.service.JjimService;
import com.bit.mymarket.vo.ItemListVo;
import com.bit.mymarket.vo.JjimVo;
import com.bit.mymarket.vo.UserVo;


@RequestMapping("/jjim")
@Controller
public class JjimController {

	@Autowired
	private JjimService jjimService;
		
	@RequestMapping("/jjimlist/{userNo}")
	public String index(Model model, @PathVariable Long userNo){
		System.out.println("!!!!!!!!!");
		
		List<JjimVo> jlist=jjimService.getList(userNo);
		//List<HashTagVo> hashList = itemsService.getTagList();
		System.out.println("testtest"+jlist);
		model.addAttribute("jlist", jlist);
		/*for(JjimVo vo : jlist){
			System.out.println(vo);
		}*/
		System.out.println(jlist);
		return "/jjim/jjimView";
	}
	
	
	@RequestMapping("/insert/{itemNo}/{userNo}")
	public String insert(@PathVariable Long itemNo, @PathVariable Long userNo){
		System.out.println("x9insert" + itemNo + ", " + userNo);
		
		JjimVo jjimVo = new JjimVo();
		jjimVo.setItemNo(itemNo);
		jjimVo.setUserNo(userNo);
		
		System.out.println(jjimVo);
		
		jjimService.insert(jjimVo);
		
		//return "redirect:/items/detailView/"+itemNo;
		return "redirect:/main";
	}
	
	
	
	@RequestMapping("/delete/{itemNo}")
	public String delete(@PathVariable Long itemNo, HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute("authUser");
		if (itemNo == null && session == null)
			 return "redirect:/jjim/jjimlist/"+userVo.getNo();
			//return "/items/jjim";
		System.out.println("글의 no: " + itemNo + ", " + session);
		jjimService.delete(itemNo);
		//return "/items/jjim";
		return "redirect:/jjim/jjimlist/"+userVo.getNo();

	}
	
	
}
