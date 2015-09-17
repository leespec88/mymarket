package com.bit.mymarket.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit.mymarket.vo.UserVo;

@Repository
public class UserDao {
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;

	public UserVo getByIdNo(String idNo){
		UserVo userVo = (UserVo)sqlMapClientTemplate.queryForObject("user.getByIdNo", idNo);
		return userVo;
	}
	
	public void insertJoin(UserVo vo){
		sqlMapClientTemplate.insert("user.join", vo);
	}
	
	public UserVo getLoginInfo(UserVo vo){
		UserVo userVo = (UserVo)sqlMapClientTemplate.queryForObject("user.login", vo);
		return userVo;
		
	}
	
	
	public Boolean getByEmail(String email){
		UserVo vo = (UserVo)sqlMapClientTemplate.queryForObject("user.getByEmail", email);
		boolean result=false;
		if(vo!=null){
			result=true;
		}
		return result;
	}
	
	public void updateBasicInfo(UserVo vo){
		sqlMapClientTemplate.update("user.basicInfo", vo);
	}
	
	public void updatePassword(String password){
		sqlMapClientTemplate.update("user.password", password);
	}
}
