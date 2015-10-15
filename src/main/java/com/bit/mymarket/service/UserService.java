package com.bit.mymarket.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mymarket.dao.UserDao;
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
	
}
