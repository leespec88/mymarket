package com.bit.mymarket.service;


import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mymarket.dao.ItemsDao;
import com.bit.mymarket.util.FileUtils;
import com.bit.mymarket.vo.HashTagVo;
import com.bit.mymarket.vo.ItemPicVo;
import com.bit.mymarket.vo.ItemsVo;


@Service
public class ItemsService {

	@Autowired
	private ItemsDao itemsDao;
	
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;
	

	public ItemsVo insert(ItemsVo itemsVo){
		itemsDao.insert(itemsVo);
		Long itemNo = itemsDao.getItemNo(itemsVo.getEmail(), itemsVo.getTitle());
		System.out.println("아 이 템 넘 버 :"+itemNo);
		hashTagList(itemNo, itemsVo.getTitle(), itemsVo.getContent());
		
		return itemsVo;
	}
	
	public List<ItemsVo> getList() {
		List<ItemsVo> list = itemsDao.getList();
		return list;
	}
	
	public List<ItemPicVo> getPicList() {
		List<ItemPicVo> picList = itemsDao.getPicList();
		return picList;
	}
	
	public List<ItemsVo> getKwdList(String kwd){
		List<ItemsVo> list = itemsDao.getKwdList(kwd);
		return list;
	}
	
	public List<ItemsVo> getHashList(String kwd){
		kwd = sepcialCharacter_replace(kwd);
		List<ItemsVo> list = itemsDao.getHashList(kwd);
		return list;
	}
	
	public ItemPicVo insertPic(ItemPicVo itemPicVo){
		itemsDao.insertPic(itemPicVo);
		return itemPicVo;
	}
	
		/*System.out.println("itemsService insertPic : " + map);
		//itemsDao.insertPic(map);
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map,
				request);
		for (int i = 0, size = list.size(); i < size; i++) {
			itemsDao.insertPic(list.get(i));
		}*/
	
	//tag 추출 메서드 1
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
	    		HashTagVo vo = itemsDao.tagList(tagVo);
	    		
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
	    		HashTagVo vo = itemsDao.tagList(tagVo);
	    		
	    		if(vo==null){
	    			itemsDao.insertByHash(no, extractHashTag2);
	    		}
	    		
	    	}
	    }
	}
	
	//tag 추출 메서드 2
	public static String sepcialCharacter_replace(String str) {
		str = StringUtils.replaceChars(str, "-_+=!@#$%^&*()[]{}|\\;:'\"<>,.?/~`） ", "");
		if (str.length() < 1) {
			return null;
		}
		return str;
	}
	
/*	public void insertBoard(Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		boardDao.insertBoard(map);

		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map,
				request);
		for (int i = 0, size = list.size(); i < size; i++) {
			boardDao.insertFile(list.get(i));
		}
	}*/
	
	
}
