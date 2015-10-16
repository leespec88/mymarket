package com.bit.mymarket.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mymarket.dao.UserDao;
import com.bit.mymarket.vo.NotifyVo;
import com.bit.mymarket.vo.UserVo;


@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	
	public UserVo getByIdNo(String idNo){
		UserVo userVo = userDao.getByIdNo(idNo);
		return userVo;
	}
	public void join(UserVo userVo) {
		userDao.insertJoin(userVo);
	}
	
	public UserVo getLoginInfo(UserVo vo){
		UserVo userVo = userDao.getLoginInfo(vo);
		return userVo;
	}
	
	
	public boolean getByEmail(String email){
		boolean result = userDao.getByEmail(email);
		return result;
	}
	
	public void modify(UserVo vo){
		userDao.updateBasicInfo(vo);
	}
	
	public Long getNoByitemNo(Long itemNo){
		Long userNo = userDao.getNoByitemNo(itemNo);
		return userNo;
	}
	
	public void messageInsert(NotifyVo notifyVo){
		userDao.messageInsert(notifyVo);
	}
	
	public List<NotifyVo> getMessage(Long userNo){
		List<NotifyVo> list = userDao.getMessage(userNo);
		return list;
	}
	
	public Integer getCount(Long userNo){
		Integer count = userDao.getCount(userNo);
		return count;
	}
	
}
