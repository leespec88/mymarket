package com.bit.mymarket.dao;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

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
	
	public List<ItemsVo> getList() {
		//System.out.println(list);
		List<ItemsVo> list = sqlMapClientTemplate.queryForList("items.list");
		return list;

	}
	
	public List<ItemPicVo> getPicList() {
		System.out.println("ItemPicDaoList");
		List<ItemPicVo> picList = sqlMapClientTemplate.queryForList("items.picList");
		return picList;

	}
	
}
