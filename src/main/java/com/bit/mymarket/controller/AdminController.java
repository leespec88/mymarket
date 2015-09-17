package com.bit.mymarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.mymarket.service.AdminService;
import com.bit.mymarket.vo.BoardVo;
import com.bit.mymarket.vo.ItemsVo;
import com.bit.mymarket.vo.UserVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/memberList")
	public String memberList(Model model, @RequestParam(required=false, defaultValue="1") Integer currentPageNo,
							 @RequestParam(required=false, defaultValue="") String kwd){
		List<UserVo> list;
		int totCnt;
		if("".equals(kwd)){
			list = adminService.getMemberList(currentPageNo);
			totCnt=adminService.getTotCnt();
		}
		else{
			list = adminService.getSearchMember(kwd, currentPageNo);
			totCnt=adminService.getSearchTotCnt(kwd);
		}
		
		int totPageNo=totCnt/10+(totCnt%10==0?0:1);
		int groupSize=3;
		int totGroupNo=totPageNo/groupSize+(totPageNo%groupSize==0?0:1);
		int currentGroupNo=currentPageNo/groupSize+(currentPageNo%groupSize==0?0:1);
		int currentGroupStartPageNo=(currentGroupNo-1)*groupSize+1;
		int currentGroupLastPageNo=(currentGroupNo*groupSize);
		
		model.addAttribute("totCnt",totCnt);
		model.addAttribute("totPageNo",totPageNo);
		model.addAttribute("groupSize",groupSize);
		model.addAttribute("totGroupNo",totGroupNo);
		model.addAttribute("currentGroupStartPageNo",currentGroupStartPageNo);
		model.addAttribute("currentGroupLastPageNo",currentGroupLastPageNo);
		model.addAttribute("currentPageNo", currentPageNo);
		model.addAttribute("memberList", list);
		
		return "/admin/memberList";
	}
	
	@RequestMapping("/modifyform")
	public String modifyform(@RequestParam Long no, Model model){
		UserVo userVo = adminService.getModifyMember(no);
		model.addAttribute("member", userVo);
		return "/admin/modifyform";
	}
	
	@RequestMapping("/modify")
	public String modify(@ModelAttribute UserVo vo){
		System.out.println("!!"+vo);
		adminService.modify(vo);
		return "redirect:/admin/memberList";
	}
	
	@RequestMapping("/boardList")
	public String boardList(Model model, @RequestParam(required=false, defaultValue="1") Integer currentPageNo,
							@RequestParam(required=false, defaultValue="") String kwd){
		List<BoardVo> list;
		int totCnt;
		if("".equals(kwd)){
			list = adminService.getBoardList(currentPageNo);
			totCnt=adminService.getTotCntByBoard();
		}
		else{
			list = adminService.getSearchBoard(kwd, currentPageNo);
			totCnt=adminService.getTotCntBySearchBoard(kwd);
		}
		int totPageNo=totCnt/10+(totCnt%10==0?0:1);
		int groupSize=3;
		int totGroupNo=totPageNo/groupSize+(totPageNo%groupSize==0?0:1);
		int currentGroupNo=currentPageNo/groupSize+(currentPageNo%groupSize==0?0:1);
		int currentGroupStartPageNo=(currentGroupNo-1)*groupSize+1;
		int currentGroupLastPageNo=(currentGroupNo*groupSize);
		
		model.addAttribute("totCnt",totCnt);
		model.addAttribute("totPageNo",totPageNo);
		model.addAttribute("groupSize",groupSize);
		model.addAttribute("totGroupNo",totGroupNo);
		model.addAttribute("currentGroupStartPageNo",currentGroupStartPageNo);
		model.addAttribute("currentGroupLastPageNo",currentGroupLastPageNo);
		model.addAttribute("currentPageNo", currentPageNo);
		model.addAttribute("boardList", list);
		
		return "/admin/boardList";
	}
	
	//게시물 상세보기
	@RequestMapping("/viewContext")
	public String viewContext(@RequestParam Long no, Model model){
		BoardVo boardVo = adminService.getViewContext(no);
		model.addAttribute("board", boardVo);
		return "/admin/viewContext";
	}
	
	
	//판매상품 상세보기
	@RequestMapping("/viewItem")
	public String viewItem(@RequestParam Long no, Model model){
		ItemsVo itemsVo = adminService.getItemByNo(no);
		System.out.println(itemsVo);
		UserVo userVo = adminService.getNameByUserNo(itemsVo.getUserNo());
		model.addAttribute("item", itemsVo);
		model.addAttribute("user", userVo);
		return "/admin/viewItem";
	}
	@RequestMapping("/deleteContext")
	public String deleteContext(@RequestParam Long no){
		adminService.deleteContext(no);
		return "redirect:/admin/boardList";
	}
	
	//개인 게시물, 상품 보기
	@RequestMapping("/memberInfo")
	public String memberInfo(@RequestParam Long no,@RequestParam String name, Model model){
		List<BoardVo> list = adminService.getBoardByNo(no);
		List<ItemsVo> itemList = adminService.getItemsByUserNo(no);
		model.addAttribute("boardList", list);
		model.addAttribute("items", itemList);
		model.addAttribute("name", name);
		return "/admin/memberInfo";
	}
	
	@RequestMapping("/items")
	public String items(Model model, @RequestParam(required=false, defaultValue="1") Integer currentPageNo,
						@RequestParam(required=false, defaultValue="") String kwd){
		List<ItemsVo> list;
		int totCnt;
		if("".equals(kwd)){
			list = adminService.getItems(currentPageNo);
			totCnt=adminService.getTotCntByItems();
		}else{
			list = adminService.getSearchItems(kwd, currentPageNo);
			totCnt=adminService.getTotCntBySearchItems(kwd);
		}
		int totPageNo=totCnt/10+(totCnt%10==0?0:1);
		int groupSize=3;
		int totGroupNo=totPageNo/groupSize+(totPageNo%groupSize==0?0:1);
		int currentGroupNo=currentPageNo/groupSize+(currentPageNo%groupSize==0?0:1);
		int currentGroupStartPageNo=(currentGroupNo-1)*groupSize+1;
		int currentGroupLastPageNo=(currentGroupNo*groupSize);
		
		model.addAttribute("totCnt",totCnt);
		model.addAttribute("totPageNo",totPageNo);
		model.addAttribute("groupSize",groupSize);
		model.addAttribute("totGroupNo",totGroupNo);
		model.addAttribute("currentGroupStartPageNo",currentGroupStartPageNo);
		model.addAttribute("currentGroupLastPageNo",currentGroupLastPageNo);
		model.addAttribute("currentPageNo", currentPageNo);
		model.addAttribute("items", list);
		
		return "/admin/items";
	}
	
	@RequestMapping("/deleteItems")
	public String deleteItems(@RequestParam Long no){
		adminService.deleteItems(no);
		return "redirect:/admin/items";
	}
}
