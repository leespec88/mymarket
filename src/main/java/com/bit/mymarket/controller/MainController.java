package com.bit.mymarket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.mymarket.CommandMap;
import com.bit.mymarket.service.ItemsService;
import com.bit.mymarket.vo.HashTagVo;
import com.bit.mymarket.vo.ItemListVo;
import com.bit.mymarket.vo.UserVo;

@Controller
public class MainController {
	
	@Autowired
	private ItemsService itemsService;
	
	@RequestMapping("/")
	public String index(Model model, HttpServletResponse response, HttpSession session){
		model.addAllAttributes(itemsService.allSelectKeywordCntList());
		model.addAttribute("ageGrouplist", itemsService.kwdProcessing()); //selectAllStoredKeyword
		model.addAttribute("KwdCntList",itemsService.getKwdCntList()); //selectKeywordCntList
		model.addAttribute("RecentRegItemlist", itemsService.getRecentRegItemlist());
		model.addAttribute("selectListViewCnt", itemsService.selectListViewCnt());
		UserVo userVo = (UserVo) session.getAttribute("authUser");
		if(userVo !=null){
			model.addAttribute("recentViewList", itemsService.recentViewList(userVo.getNo()));
			
		}
		return "/main/newIndex";
	}
	
	@RequestMapping("/main")
	public String main(Model model, @RequestParam(required=false) String place){
		List<ItemListVo> list=itemsService.getList();
		//List<HashTagVo> hashList = itemsService.getTagList();
		if(place!=null){ 
			System.err.println("place !!! = " + place);
			model.addAttribute("place", place);
		}
		model.addAttribute("list", list);
		//model.addAttribute("tagName",hashList);
		return "/main/main";
	}
	
	@RequestMapping("/searchMain")
	public String searchMain(Model model, @RequestParam(required=false,defaultValue="")String kwd, HttpSession session){
		System.out.println("kwd:"+kwd);
		List<ItemListVo> list=null;
		char ch='#';
		if("".equals(kwd)){
			list = itemsService.getList(); // 일반 리스트
		
		}else if(ch==kwd.charAt(0)){
			list=itemsService.getHashList(kwd);
		}else{
			list = itemsService.getKwdList(kwd);
		}
		UserVo userVo = (UserVo) session.getAttribute("authUser");
		if(userVo != null && userVo.getBirth() !=null && userVo.getGender() != null) {
			CommandMap commandMap = new CommandMap();
			commandMap.put("kwd", kwd);
			commandMap.put("userNo", userVo.getNo());
			itemsService.addKwd(commandMap.getMap());
			
		}
		
		for(ItemListVo vo: list){
			System.out.println("adfafwef"+vo);
		}
		List<HashTagVo> tagList = itemsService.getTagList();
		model.addAttribute("list", list);
		model.addAttribute("tagList",tagList);
		System.out.println(model);
		
		return "/main/searchMain";
	}
	
	@RequestMapping("/tagList")
	public String tagList(Model model, String kwd){
		
		System.out.println("kwd:"+kwd);
		List<ItemListVo> list = itemsService.getHashList(kwd);
		List<HashTagVo> tagList = itemsService.getTagList();
		model.addAttribute("list", list);
		model.addAttribute("tagList",tagList);
		
		return "/main/searchMain";
	}

	//20150923 지도상 위치만 상품 올라오게 하려함. -정민
		@RequestMapping( "/OnePicList/{mapBounds}/{no}" )
		@ResponseBody
		public Map<String, Object> mapBounds(Model model, @PathVariable String mapBounds,HttpSession session) {
			
			List<ItemListVo> itemList = itemsService.getItemList(mapBounds); // 이미지한장에 없으면 null 리스트
			List<HashTagVo> tagList = itemsService.getTagList();
			
			UserVo userVo = (UserVo) session.getAttribute("authUser");
			
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("list",itemList);
			map.put("tagList", tagList); 
			
			if(userVo != null){
				map.put("userNo", userVo.getNo());
			}
			
			return map;
		}

	}
