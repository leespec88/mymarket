package com.bit.mymarket.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit.mymarket.vo.InterestLocationVo;

@Repository
public class InterestLocationDao {
	
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	public void insertInterestLocation(InterestLocationVo vo){
		
		sqlMapClientTemplate.insert("interest.insertLocation", vo);
		
	}
	
	public List<InterestLocationVo> getIntLocation(Long no){
		
		List<InterestLocationVo> list = sqlMapClientTemplate.queryForList("interest.getList", no);
		
		return list;
		
	}
	
	public void deleteLocation(Long interestNo){
		
		sqlMapClientTemplate.delete("interest.deleteLocation", interestNo);
		
	}

}
