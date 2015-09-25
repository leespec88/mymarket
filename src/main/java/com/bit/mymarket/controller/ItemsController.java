package com.bit.mymarket.controller;

import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit.mymarket.CommandMap;
import com.bit.mymarket.service.ItemsService;
import com.bit.mymarket.service.UserService;
import com.bit.mymarket.vo.ItemPicVo;
import com.bit.mymarket.vo.ItemsVo;
import com.bit.mymarket.vo.ReplyVo;
import com.bit.mymarket.vo.UserVo;

@RequestMapping( "/items" )
@Controller
public class ItemsController {
	
	@Autowired
	private ItemsService itemsService;
	
	@RequestMapping( "itemsinsert" )
	public String index() {
		System.out.println("aa");
		return "/items/itemsinsert";
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

	
		//파일 업로드
		// Logger 객체 얻어온다.
	private static final Log LOG = LogFactory.getLog( ItemsController.class );
	
	// 파일 저장 경로
	private static final String SAVE_PATH = "//192.168.1.6//temp//";
	  
	@RequestMapping( "/form" )
	public String form() {
		return "items/form";
	}
	
	@RequestMapping( "/upload" )
	public String upload(CommandMap commandMap, HttpServletRequest request) throws Exception {
			
			
		System.err.println("uploadupload!!!!!");
		
		itemsService.insertItem(commandMap.getMap(),request);
		
		
        return "/items/itemsinsertok";
	}
	
	private void writeFile( MultipartFile file, String path, String fileName ) {
		System.out.println(path);
		System.out.println(fileName);
		System.out.println(path + "\\" + fileName);
		FileOutputStream fos = null;
		try {
			byte fileData[] = file.getBytes();
			fos = new FileOutputStream( path + "\\" + fileName );
			fos.write(fileData);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (Exception e) {
				}
			}
		}
	}
	
	private String genSaveFileName( String extName ) {
		
        Calendar calendar = Calendar.getInstance();
		String fileName = "";
        
        fileName += calendar.get( Calendar.YEAR );
        fileName += calendar.get( Calendar.MONTH );
        fileName += calendar.get( Calendar.DATE );
        fileName += calendar.get( Calendar.HOUR );
        fileName += calendar.get( Calendar.MINUTE );
        fileName += calendar.get( Calendar.SECOND );
        fileName += calendar.get( Calendar.MILLISECOND );
        fileName += ( "." + extName );
        
        return fileName;
	}
	//파일업로드 close
	
	/*아이템 상제정보 보기 컨드톨러 -by 이준기 0922*/
	@RequestMapping("/detailView/{no}")
	public String itemDetailInfo(@PathVariable Long no, Model model){
		Map<String, Object> map  = itemsService.getItemInfoByNo(no);

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
		System.out.println(replyContent + ", subreply 시작" + replyNo );
		
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
	public String userItemList(@PathVariable Long userNo){
		return "/user/profile/"+userNo;
	}
	/*판매자의 아이템의 sellState 변경   -by 이준기 0924*/
	@RequestMapping("/updateSellState/{itemno}")
	public String updateSellState(@PathVariable Long itemno, String sellState){
		System.err.println(sellState);
		return "redirect:/items/detailView/" + itemno;
	}
	/*판매자의 아이템의 삭제   -by 이준기 0925*/
	@RequestMapping("/itemDelete/{itemno}")
	public String itemDelete(@PathVariable Long itemno){
		itemsService.deleteItem(itemno);
		return "redirect:/";
	}
}
