package com.bit.mymarket.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mymarket.dao.ItemsDao;
import com.bit.mymarket.dao.UserDao;
import com.bit.mymarket.util.FileUtils;
import com.bit.mymarket.vo.HashTagVo;
import com.bit.mymarket.vo.ItemOnePicVo;
import com.bit.mymarket.vo.ItemPicVo;
import com.bit.mymarket.vo.ItemsVo;
import com.bit.mymarket.vo.UserVo;


@Service
public class ItemsService {

	@Autowired
	private ItemsDao itemsDao;
	
	@Autowired
	private UserDao userDao;
	
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
	//사진 한장에 없으면 null 가져오기
	public List<ItemOnePicVo> getOnePicList() {
		List<ItemOnePicVo> onePicList = itemsDao.getOnePicList();
		List<ItemOnePicVo> onePicList1 = new ArrayList<ItemOnePicVo>();
		//System.out.println("size:" + onePicList.size());
		if(onePicList != null){
			for (int i = 0; i<onePicList.size(); i++) {
				if(i==0){
					if(onePicList.get(i).getNo() == onePicList.get(i).getNo()){
						//System.out.println("i와 사이즈가 같음" + onePicList.get(i).getNo());
						onePicList1.add(onePicList.get(i));
					}
				}else {
					if(onePicList.get(i).getNo().equals(onePicList.get(i-1).getNo())){
					//System.out.println("숫자가 겹침" + onePicList.get(i).getNo());
					}else{
						//System.out.println("숫자가 안겹침" + onePicList.get(i).getNo());
						onePicList1.add(onePicList.get(i));
					}
				}
				
			}
			
		}
		return onePicList1;
	}
	
	public List<HashTagVo> getTagList(){
		List<HashTagVo> list = itemsDao.getTagList();
		return list;
	}
	
	public List<ItemsVo> getKwdList(String kwd){
		List<ItemsVo> list = itemsDao.getKwdList(kwd);
		return list;
	}
	
	public List<ItemsVo> getHashList(String kwd){
		List<ItemsVo> list=new ArrayList<ItemsVo>();
		kwd = sepcialCharacter_replace(kwd);
		List<HashTagVo> noList = itemsDao.getNoList(kwd);

		for(HashTagVo vo: noList){
			ItemsVo itemsVo = itemsDao.getItemByNo(vo.getItemNo());
			System.out.println("넘버로 뽑은"+itemsVo);
			list.add(itemsVo);
		}
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
	
	//tag 추출 메서드 2
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
		
		resultMap.put("userVo", userVo);
		resultMap.put("itemVo", itemsDao.getItemByNo(no));
		resultMap.put("fileList", list);
//		itemsDao.getItemByNo(no);
		return resultMap;
		
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