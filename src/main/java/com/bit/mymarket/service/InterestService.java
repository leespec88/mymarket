package com.bit.mymarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mymarket.dao.InterestLocationDao;
import com.bit.mymarket.vo.InterestLocationVo;

@Service
public class InterestService {

	@Autowired
	InterestLocationDao interestLocationDao;
	
	public void insertInterestLocation(InterestLocationVo vo){
		
		interestLocationDao.insertInterestLocation(vo);
		
	}
	
	public List<InterestLocationVo> getIntLocation(Long no){
		
		List<InterestLocationVo> list = interestLocationDao.getIntLocation(no);
		
		return list;
		
	}
	
	public void deleteLocation(Long interestNo){
		
		interestLocationDao.deleteLocation(interestNo);
		
	}
	
}
