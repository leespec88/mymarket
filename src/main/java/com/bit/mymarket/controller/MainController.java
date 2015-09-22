package com.bit.mymarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.mymarket.service.ItemsService;
import com.bit.mymarket.vo.HashTagVo;
import com.bit.mymarket.vo.ItemOnePicVo;
import com.bit.mymarket.vo.ItemPicVo;
import com.bit.mymarket.vo.ItemsVo;

@Controller
public class MainController {
	
	@Autowired
	private ItemsService itemsService;
	
	@RequestMapping("/")
	public String index(Model model, @RequestParam(required=false,defaultValue="")String kwd){
		List<ItemsVo> list=null;
		char ch='#';
		if("".equals(kwd)){
			list = itemsService.getList(); // 일반 리스트
		
		}else if(ch==kwd.charAt(0)){
			list=itemsService.getHashList(kwd);
		}else{
			list = itemsService.getKwdList(kwd);
		}
		List<ItemPicVo> picList = itemsService.getPicList(); // 이미지 리스트
		List<ItemOnePicVo> onePicList = itemsService.getOnePicList(); // 이미지한장에 없으면 null 리스트
		List<HashTagVo> hashList = itemsService.getTagList();
		model.addAttribute("list", list);
		model.addAttribute("picList", picList);
		model.addAttribute("onePicList", onePicList);
		model.addAttribute("tagName",hashList);
		System.out.println(model);
		return "/main/main";
	}
	
	@RequestMapping("/tagList")
	public String tagList(Model model, String kwd){
		System.out.println("tagListtagList!!");
		List<ItemsVo> list = itemsService.getHashList(kwd);
		if(list.isEmpty()){
			System.err.println("getHashList!!!empty");
		}
		List<HashTagVo> hashList = itemsService.getTagList();
		List<ItemPicVo> picList = itemsService.getPicList();
		
		model.addAttribute("list", list);
		model.addAttribute("picList", picList);
		model.addAttribute("tagName",hashList);
		
		return "/main/main";
	}

}
