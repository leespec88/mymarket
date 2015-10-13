package com.bit.mymarket.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.mymarket.CommandMap;
import com.bit.mymarket.service.ItemsService;
import com.bit.mymarket.vo.ItemsVo;
import com.bit.mymarket.vo.ReplyVo;
import com.bit.mymarket.vo.UserVo;

@RequestMapping( "/items" )
@Controller
public class ItemsController {
	
	@Autowired
	private ItemsService itemsService;
	
	/*10.05 AOP login check 처리 - 이준기*/
	@RequestMapping( "/itemsinsert" )
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/items/itemsinsert");
		return mv;
	}
	
	@RequestMapping( "itemsleft" )
	public String mapleft() {
		return "/items/itemsleft";
	}
	@RequestMapping( "itemsright" )
	public String mapright() {
		return "/items/itemsright";
	}
	
	@RequestMapping( "/itemsinsert/{lat}/{lng}/{no}" )
	@ResponseBody
	public HashMap<String, String> itemsinsert(@PathVariable String lat, @PathVariable String lng) {
		System.out.println("itemsinsert : " + lat + "lng : " + lng);
		System.out.println("itemsinsert : " + lng + "lat : " + lat);
		HashMap<String, String> items = new HashMap<String, String>();

		items.put("lat", lat );
		items.put("lng", lng);
		System.out.println(items);
		return items;
	}
	
	@RequestMapping( "/itemsinsertview" )
	public String itemsinsertview(@RequestParam("lat") String lat, @RequestParam("lng") String lng, @RequestParam("address") String address, Model model) {
		if(lng == "" || lat == ""){
			return "/items/itemsinsert";
		}
		System.out.println(lat + lng);
		String latlng = lat + "," + lng;
		model.addAttribute("latlng", latlng);
		model.addAttribute("address", address);
		
		return "items/itemsinsertview";
	}
	
	@RequestMapping("/itemsinsertok")
	public String itemsinsertok(){
		return "redirect:/itemsinsertok";
	}

	@RequestMapping( "/form" )
	public String form() {
		return "items/form";
	}
	
	@RequestMapping( "/upload" )
	public String upload(@ModelAttribute ItemsVo itemsVo, CommandMap commandMap, HttpServletRequest request ) throws Exception {
		System.out.println(itemsVo);
		System.out.println(commandMap.getMap());
		itemsService.insert(itemsVo, commandMap.getMap(), request);
		
        return "redirect:/items/detailView/"+commandMap.get("itemNo");
	}
	
	/*아이템 상제정보 보기 컨드톨러 -by 이준기 0922*/
	@RequestMapping("/detailView/{no}")
	public String itemDetailInfo(@PathVariable Long no, Model model){
		Map<String, Object> map  = itemsService.getItemInfoByNo(no);
		itemsService.updateViewCnt(no);
		model.addAttribute("regItemCnt", map.get("regItemCnt"));
		model.addAttribute("replyCnt", map.get("replyCnt"));
		model.addAttribute("userVo", map.get("userVo"));
		model.addAttribute("itemVo", map.get("itemVo"));
		model.addAttribute("fileList", map.get("fileList"));
		model.addAttribute("replyList", map.get("replyList"));
		return "/items/itemsView";
		
	}
	/*아이템 상제정보 리플 메소드  -by 이준기 0923*/
	@RequestMapping("/deletereply/{no}")
	public String deleteReply(@PathVariable Long no, @RequestParam Long itemNo) {
//		System.out.println("zdeleteReply = "+no + " , "+itemNo);
		itemsService.delreply(no);
		return "redirect:/items/detailView/" + itemNo;
	}
	/*아이템 상제정보 리플 메소드  -by 이준기 0923*/
	@RequestMapping("/addreply/{no}")
	public String addReply(@PathVariable Long no,
			@RequestParam(required = false) String content, HttpSession session) {

		if (session.getAttribute("authUser") == null) 
			return "redirect:/user/loginform";
		
		UserVo userVo = (UserVo) session.getAttribute("authUser");
		ReplyVo vo = new ReplyVo();
		vo.setUserName(userVo.getName());
		vo.setContent(content);
		vo.setBoardNo(no);
		vo.setUserNo(userVo.getNo());

		itemsService.addreply(vo);

		return "redirect:/items/detailView/" + no;
	}
	/*아이템 상제정보 리플 메소드  -by 이준기 0923*/
	@RequestMapping("/subreply")
	public String subreply(@RequestParam Long replyNo, @RequestParam String replyContent, @RequestParam Long parentGroupNo, Model model, HttpSession session) {
//		System.out.println(replyContent + ", subreply 시작" + replyNo );
		
		if (session == null)
			return "redirect:/user/loginform";
		ReplyVo tatgetReplyVo = (ReplyVo) itemsService.getReply(replyNo);

		UserVo userVo = (UserVo) session.getAttribute("authUser");
		System.out.println("session에서 가져온 유저정보 : " + userVo);

		ReplyVo rereplyVo = new ReplyVo();
		rereplyVo.setUserName(userVo.getName());
		rereplyVo.setBoardNo(tatgetReplyVo.getBoardNo());
		rereplyVo.setContent(replyContent);
		rereplyVo.setGroupNo(tatgetReplyVo.getGroupNo());
		rereplyVo.setOrderNo(tatgetReplyVo.getOrderNo() +1);
		rereplyVo.setDepth(tatgetReplyVo.getDepth() + 1);
		rereplyVo.setUserNo(userVo.getNo());

		System.out.println("rereplyVo : " + rereplyVo);
		itemsService.addReReply(rereplyVo);

		model.addAttribute("rereplyVo", rereplyVo);
		itemsService.addReplyCnt(tatgetReplyVo.getBoardNo());// 리플카운트 올라감..*/	
		return "redirect:/items/detailView/" + rereplyVo.getBoardNo();
	}
	
	/*판매자의 아이템의 전체리스트   -by 이준기 0924*/
	@RequestMapping("/userItemList/{userNo}")
	public String userItemList(@PathVariable Long userNo, Model model){
		model.addAllAttributes(itemsService.userItemList(userNo));
		return "/items/myItemList";
	}
	/*판매자의 아이템의 sellState 변경   -by 이준기 0924*/
	@RequestMapping("/updateSellState/{itemNo}")
	public String updateSellState(CommandMap commandMap){
		itemsService.updateSellState(commandMap.getMap());
		return "redirect:/items/detailView/" + commandMap.get("itemNo");
	}
	/*판매자의 아이템의 삭제   -by 이준기 0925*/
	@RequestMapping("/itemDelete/{itemno}")
	public String itemDelete(@PathVariable Long itemno){
		itemsService.deleteItem(itemno);
		return "redirect:/main";
	}
	
	@RequestMapping("/updateItem/{itemNo}")
	public String updateItem(@PathVariable Long itemNo, Model model){
		Map<String, Object> map = itemsService.getItemInfoByNo(itemNo);
	/*	model.addAttribute("userVo", map.get("userVo"));
		model.addAttribute("itemVo", map.get("itemVo"));
		model.addAttribute("fileList", map.get("fileList"));*/
		model.addAllAttributes(map);
		
		return "/items/itemsModify";
	}
	
	@RequestMapping("/updateItems")
	public ModelAndView updateItem(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/items/detailView/" + commandMap.get("itemNo"));
		itemsService.updateItem(commandMap.getMap(), request);
		mv.addObject("no", commandMap.get("no"));
		return mv;
	}
	@RequestMapping("/deleteFile")
	public ModelAndView deleteFile(CommandMap commandMap){
		ModelAndView mv = new ModelAndView("redirect:/items/updateItem/" + commandMap.get("no"));
		Integer fileNo = Integer.parseInt((String)commandMap.get("fileNo"));
		itemsService.deleteFile(fileNo);
		return mv;
	}
	
	@RequestMapping("/updateRegDate/{itemNo}")
	public ModelAndView deleteFile(@PathVariable Long itemNo){
	ModelAndView mv= new ModelAndView("redirect:/items/detailView/"+itemNo);
	itemsService.updateRegDate(itemNo);
	return mv;
	}
}
