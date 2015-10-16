package com.bit.mymarket.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit.mymarket.vo.NotifyVo;
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
	
	/*상품정보의 UserNo로 등록된 회원의 정보를 가져오는 메소드 이준기 0922*/
	public UserVo getUserInfobyNo(Long no) {
		System.out.println("유저 서비스의 파라미터 NO = " + no);
		return (UserVo) sqlMapClientTemplate.queryForObject("user.getUserInfobyNo", no);
	}
	
	/*아이템 넘버로 유저 넘버 가져오기*/
	public Long getNoByitemNo(Long itemNo){
		Long userNo = (Long)sqlMapClientTemplate.queryForObject("items.getNoByitemNo", itemNo);
		return userNo;
	}
	
	public void messageInsert(NotifyVo notifyVo){
		sqlMapClientTemplate.insert("user.messageInsert", notifyVo);
	}
	
	public List<NotifyVo> getMessage(Long userNo){
		System.out.println("머리세웠어"+userNo);
		List<NotifyVo> list = sqlMapClientTemplate.queryForList("user.getMessage", userNo);
		for(NotifyVo vo : list){
			System.out.println("머리잘랐다."+list);
		}
		return list;
	}
	
	public Integer getCount(Long userNo){
		
		Integer count = (Integer)sqlMapClientTemplate.queryForObject("user.getCount", userNo);
		return count;
	}
}
