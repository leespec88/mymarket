package com.bit.mymarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.mymarket.service.ItemsService;
import com.bit.mymarket.vo.ItemPicVo;
import com.bit.mymarket.vo.ItemsVo;

@Controller
public class MainController {
	
	@Autowired
	private ItemsService itemsService;
	@RequestMapping("/")
	
	public String index(Model model, @RequestParam(required=false,defaultValue="")String kwd){
		List<ItemsVo> list=null;
		
		if("".equals(kwd)){
			list = itemsService.getList(); // 일반 리스트
		
		}else if("#".equals(kwd.charAt(0))){
			list=itemsService.getHashList(kwd);
		}else{
			list = itemsService.getKwdList(kwd);
		}
		//List<ItemsVo> list= itemsService.getList();
		List<ItemPicVo> picList = itemsService.getPicList(); // 이미지 리스트
		model.addAttribute("list", list);
		model.addAttribute("picList", picList);
		
		return "/main/main";
	}

}
