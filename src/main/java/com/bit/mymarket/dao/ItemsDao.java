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
		System.out.println("ItemsDaoList");
		System.out.println();
		
		//System.out.println(list);
		List<ItemsVo> list = sqlMapClientTemplate.queryForList("items.list");
		System.out.println(list.iterator().next().getItemCondition());
		return list;

	}
	
	public List<ItemPicVo> getPicList() {
		System.out.println("ItemPicDaoList");
		
		List<ItemPicVo> picList = sqlMapClientTemplate.queryForList("items.picList");
		System.out.println(picList.iterator().next().getNo());
		System.out.println(picList.iterator().next().getItemNo());
		System.out.println(picList.iterator().next().getUrl());

		return picList;

	}
	
}
