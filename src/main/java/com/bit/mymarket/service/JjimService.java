package com.bit.mymarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mymarket.dao.ItemsDao;
import com.bit.mymarket.dao.JjimDao;
import com.bit.mymarket.vo.JjimVo;



@Service
public class JjimService {

	@Autowired
	private JjimDao jjimdao;
	
	@Autowired
	private ItemsDao itemsDao;
	
	public void insert(JjimVo jjimVo){
		jjimdao.insert(jjimVo);
	}

	/*public void list(Long userNo) {
		System.out.println("JjimService : " + userNo);

		jjimdao.list(userNo);		
	}*/
	
	public List<JjimVo> getList(Long userNo) {
		System.out.println("JjimService : " + userNo);
		
		List<JjimVo> jlist = jjimdao.getList(userNo);
		
		/*for(JjimVo vo : list){
			vo.setUrl(jjimdao.getUrl(vo.getNo())); // 이미지 추가하는 부분
		}*/
		return jlist;
	}

	public void delete(Long itemNo) {
		jjimdao.delete(itemNo);
		
	}
	
//item 등록
	
	
	
}
