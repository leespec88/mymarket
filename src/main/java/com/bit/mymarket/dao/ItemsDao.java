package com.bit.mymarket.dao;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit.mymarket.vo.HashTagVo;
import com.bit.mymarket.vo.ItemPicVo;
import com.bit.mymarket.vo.ItemsVo;

@Repository
public class ItemsDao {
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;

	public void insert(ItemsVo itemsVo){
		System.out.println("itemsdao : " + itemsVo);
		sqlMapClientTemplate.insert("items.insert", itemsVo);
	}
	
	public void insertPic(ItemPicVo itemPicVo){
		System.out.println("itemsdao : " + itemPicVo);
		sqlMapClientTemplate.insert("items.insertPic", itemPicVo);
	}
	
	public void insertByHash(Long no, String tagName){
		System.out.println("itemsNo:" + no +" : tageName:"+tagName );
		Map<Object,Object> map = new HashMap<Object, Object>();
		map.put("itemNo", no);
		map.put("tagName", tagName);
		sqlMapClientTemplate.insert("items.insertByHash", map);
	}
	
	public List<ItemsVo> getList() {
		//System.out.println(list);
		List<ItemsVo> list = sqlMapClientTemplate.queryForList("items.list");
		return list;
	}
	
	public Long getItemNo(String email, String title){
		Map<String,String> map = new HashMap<String,String>();
		map.put("email",email);
		map.put("title", title);
		Long itemNo = (Long)sqlMapClientTemplate.queryForObject("items.getItemNo",map);
		return itemNo;
	}
	
	public List<ItemPicVo> getPicList() {
		System.out.println("ItemPicDaoList");
		List<ItemPicVo> picList = sqlMapClientTemplate.queryForList("items.picList");
		return picList;
	}
	
	public List<HashTagVo> getTagList(){
		List<HashTagVo> list = sqlMapClientTemplate.queryForList("items.TagList");
		return list;
	}
	
	public List<ItemsVo> getKwdList(String kwd){
		List<ItemsVo> list = sqlMapClientTemplate.queryForList("items.kwdList",kwd);
		return list;
	}
	
	public List<ItemsVo> getHashList(String kwd){
		List<ItemsVo> list = sqlMapClientTemplate.queryForList("items.tagListByItemNo",kwd);
		return list;
	}
	
	public HashTagVo tagList(HashTagVo tagVo){
		HashTagVo vo = (HashTagVo)sqlMapClientTemplate.queryForObject("items.tagList", tagVo);
		return vo;
	}
	
}
