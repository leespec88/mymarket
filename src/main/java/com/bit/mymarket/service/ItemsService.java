package com.bit.mymarket.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mymarket.dao.ItemsDao;
import com.bit.mymarket.dao.ReplyDao;
import com.bit.mymarket.dao.UserDao;
import com.bit.mymarket.util.FileUtils;
import com.bit.mymarket.util.FileUtils2;
import com.bit.mymarket.vo.HashTagVo;
import com.bit.mymarket.vo.ItemListVo;
import com.bit.mymarket.vo.ItemPicVo;
import com.bit.mymarket.vo.ItemsVo;
import com.bit.mymarket.vo.ReplyVo;
import com.bit.mymarket.vo.UserVo;


@Service
public class ItemsService {

	@Autowired
	private ItemsDao itemsDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private ReplyDao replyDao;
	// board 뷰에서 이미지 업로드
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;
	// item 뷰에서 이미지 업로드
	@Resource(name = "fileUtils2")
	private FileUtils2 fileUtils2;
	
	// item 등록
	public void insert(ItemsVo itemsVo, Map<String, Object> map, HttpServletRequest request) throws Exception{
		System.out.println(map);
		itemsDao.insert(itemsVo);
		
		Long itemNo = itemsDao.getItemNo(itemsVo.getEmail(), itemsVo.getTitle());
		hashTagList(itemNo, itemsVo.getTitle(), itemsVo.getContent());
		
		map.put("itemNo", itemNo);
		System.out.println(map);
		List<Map<String,Object>> list = fileUtils2.parseInsertFileInfo(map, request);
		System.out.println(list);
		for(int i=0, size=list.size(); i<size; i++){
            itemsDao.insertPic(list.get(i));
        }
		
	}

	public List<ItemListVo> getList() {
		List<ItemListVo> list = itemsDao.getList(); //전체 리스트를 가져오되 필요한 부분만 가져오는부분
		
		for(ItemListVo vo : list){
			vo.setUrl(itemsDao.getUrl(vo.getNo())); // 이미지 추가하는 부분
		}
		return list;
	}
	
	public List<ItemPicVo> getPicList() {
		List<ItemPicVo> picList = itemsDao.getPicList();
		return picList;
	}
	//사진 한장에 없으면 null 가져오기
	public List<ItemListVo> getItemList() {
		List<ItemListVo> onePicList = itemsDao.getItemList();
		
		return onePicList;
	}
	
	//ajax 로 맵이동시 바로바로 해당 위치에서의 간격에 따른 상품 목록리스트 뽑아오는부분 + 가져온 부분에 이미지 url 추가하는 곳
	public List<ItemListVo> getItemList(String mapBounds) {
		mapBounds = mapBounds.replace("(", "");
		mapBounds = mapBounds.replace(")", "");
		mapBounds = mapBounds.replace(" ", "");
		String location[] = mapBounds.split(",");
		List<ItemListVo> list = itemsDao.getItemList(location[0], location[1], location[2], location[3]);
			
		for(ItemListVo vo : list){
			vo.setUrl(itemsDao.getUrl(vo.getNo())); //가져온 리스트들에다가 image url 추가하는부분
		}
		return list;
	}
	
	public List<HashTagVo> getTagList(){
		List<HashTagVo> list = itemsDao.getTagList();
		return list;
	}
	
	public List<ItemListVo> getKwdList(String kwd){
		List<ItemListVo> list = itemsDao.getKwdList(kwd);
		for(ItemListVo vo : list){
			vo.setUrl(itemsDao.getUrl(vo.getNo())); //가져온 리스트들에다가 image url 추가하는부분
		}
		return list;
	}
	
	public List<ItemListVo> getHashList(String kwd){
		List<ItemListVo> list=new ArrayList<ItemListVo>();
		kwd = sepcialCharacter_replace(kwd);
		List<HashTagVo> noList = itemsDao.getNoList(kwd);
		
		for(HashTagVo vo: noList){
			ItemListVo itemsVo = itemsDao.getItemListByNo(vo.getItemNo());
			itemsVo.setUrl(itemsDao.getUrl(itemsVo.getNo())); // 이미지 추가하는 부분
			list.add(itemsVo);
		}
		return list;
	}
	
	// 태그부분 추출해서 #를 뺀 나머지 정보를 hash_tag DB에 insert 시키는 부분
	public void hashTagList(Long no, String title, String content){
		HashTagVo tagVo = new HashTagVo();
		
		Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)");
	    Matcher m1 = p.matcher(title);
	    Matcher m2 = p.matcher(content);
	    
	    String extractHashTag1=null;
	    String extractHashTag2=null;
	   
	    while(m1.find()){
	    	extractHashTag1= sepcialCharacter_replace(m1.group());
	    	if(extractHashTag1!=null){
	    		System.out.println("최종 추출 TITLE 해시태그 :: "+ extractHashTag1);
	    		tagVo.setItemNo(no);
	    		tagVo.setTagName(extractHashTag1);
	    		HashTagVo vo = itemsDao.getTagListByItemNo(tagVo);
	    		
	    		if(vo==null){
	    			itemsDao.insertByHash(no, extractHashTag1);
	    		}
	    		
	    	}
	    }
	    while(m2.find()){
	    	extractHashTag2= sepcialCharacter_replace(m2.group());
	    	if(extractHashTag2!=null){
	    		System.out.println("최종 추출 CONTENT 해시태그 :: "+ extractHashTag2);
	    		tagVo.setItemNo(no);
	    		tagVo.setTagName(extractHashTag2);
	    		HashTagVo vo = itemsDao.getTagListByItemNo(tagVo);
	    		
	    		if(vo==null){
	    			itemsDao.insertByHash(no, extractHashTag2);
	    		}
	    		
	    	}
	    }
	}
	
	//#와 각종 밑에 기호들을 뺀 나머지 스트링을 추출하는 부분!!
	public static String sepcialCharacter_replace(String str) {
		str = StringUtils.replaceChars(str, "-_+=!@#$%^&*()[]{}|\\;:'\"<>,.?/~`） ", "");
		if (str.length() < 1) {
			return null;
		}
		return str;
	}
	
	/*아이템 상제정보 보기 서비스 -by 이준기 0922*/
	public Map<String, Object> getItemInfoByNo(Long no) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> list = (List<Map<String, Object>>) itemsDao.selectFileList(no);
		ItemsVo itemVo = itemsDao.getItemByNo(no);
		
		UserVo userVo = userDao.getUserInfobyNo(itemVo.getUserNo());
//		System.err.println("getItemInfoByNo= " +userVo.getNo());
		Long regItemCnt=itemsDao.getRegItem(userVo.getNo()); 	/*아이템 레그수-by 이준기 0923*/
		List<ReplyVo> replyList = replyDao.getReplyList(no);
		int replyCnt = replyDao.replyCnt(no);
		
		resultMap.put("regItemCnt", regItemCnt);
		resultMap.put("replyCnt", replyCnt);
		resultMap.put("userVo", userVo);
		resultMap.put("itemVo", itemVo);
		resultMap.put("fileList", list);
		resultMap.put("replyList", replyList);
		
		return resultMap;
		
	}

	public void addreply(ReplyVo vo) {
		replyDao.addReply(vo);
	}
	
	public void delreply(Long no) {
		replyDao.delreply(no);
	}

	public ReplyVo getReply(Long replyNo) {
		return replyDao.getReply(replyNo);
	}

	public void addReReply(ReplyVo rereplyVo) {
		replyDao.addReReply(rereplyVo);		
	}

	public void addReplyCnt(Long boardNo) {
		// TODO Auto-generated method stub
		
	}

	public void insertItem(Map<String, Object> map, HttpServletRequest request) throws Exception {
		itemsDao.insertItem(map);

		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for (int i = 0, size = list.size(); i < size; i++) {
			itemsDao.insertFile(list.get(i));
		}
	}
	/*판매자의 아이템의 삭제   -by 이준기 0925*/
	public void deleteItem(Long itemno) {
		itemsDao.deleteItem(itemno);
		
	}
	
	public void updateSellState(Map<String, Object> map) {
		itemsDao.updateSellState(map);
		
	}

	public void updateItem(Map<String, Object> map, HttpServletRequest request) {
		itemsDao.update(map);
		/*
		List<Map<String, Object>> list = fileUtils2.parseInsertFileInfo(map, request);
		Map<String,Object> tempMap = null;
		for (int i = 0, size = list.size(); i < size; i++) {
			tempMap = list.get(i);
		        if("Y".equals(tempMap.get("IS_NEW"))){
		        	
		        }
		        else{
		        	itemsDao.appendFile(tempMap);
		        }
		    }*/
	}
	
	
}