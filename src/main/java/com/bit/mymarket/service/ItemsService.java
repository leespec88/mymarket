package com.bit.mymarket.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mymarket.dao.ItemsDao;
import com.bit.mymarket.util.FileUtils;
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
