package com.bit.mymarket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit.mymarket.vo.ItemListVo;
import com.bit.mymarket.vo.ItemPicVo;
import com.bit.mymarket.vo.JjimVo;

@Repository
public class JjimDao {

	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	//jjim 등록
	public void insert(JjimVo jjimVo){
		System.out.println(jjimVo);
		sqlMapClientTemplate.insert("jjim.insert", jjimVo);
	}
	//jjim사진 등록
	/*public void insertPic(Map<String, Object> map){
		System.out.println(map);
		sqlMapClientTemplate.insert("items.insertPic",map);
	}
	public List<JjimVo>	getList(){
		List<JjimVo> list = sqlMapClientTemplate.queryForList("items.list");
		return list;
	}*/

	public void list(Long userNo) {
		System.out.println("JjimDao : " + userNo);

		sqlMapClientTemplate.insert("jjim.list", userNo);
		
	}
	
	public List<JjimVo> getList(Long userNo) {
		System.out.println("JjimDao : " + userNo);
		List<JjimVo> jlist = sqlMapClientTemplate.queryForList("jjim.list", userNo);
		
		/*for(JjimVo vo : list){
			System.out.println(vo);
		}*/
		
		return jlist;
	}

	public void delete(Long itemNo) {
		sqlMapClientTemplate.delete("jjim.delete", itemNo);
		
	}
	
	
}
