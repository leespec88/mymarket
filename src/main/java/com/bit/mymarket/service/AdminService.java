package com.bit.mymarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mymarket.dao.AdminDao;
import com.bit.mymarket.vo.BoardVo;
import com.bit.mymarket.vo.ItemsVo;
import com.bit.mymarket.vo.UserVo;

@Service
public class AdminService {
	@Autowired
	private AdminDao adminDao;
	
	public int getTotCnt(){
		int totCnt = adminDao.getTotCnt();
		return totCnt;
	}
	
	public int getSearchTotCnt(String kwd){
		int totCnt= adminDao.getSearchTotCnt(kwd);
		return totCnt;
	}
	
	public List<UserVo> getMemberList(Integer currentPageNo){
		List<UserVo> list = adminDao.getMemberList(currentPageNo);
		return list;
	}
	
	public List<UserVo> getSearchMember(String kwd, Integer currentPageNo){
		List<UserVo> list = adminDao.getSearchMember(kwd, currentPageNo);
		return list;
	}
	
	public UserVo getModifyMember(Long no){
		UserVo userVo = adminDao.getModifyMember(no);
		return userVo;
	}
	
	public void modify(UserVo vo){
		adminDao.updateBasicInfo(vo);
	}
	
	//board
	public List<BoardVo> getBoardList(Integer currentPageNo){
		List<BoardVo> list = adminDao.getBoardList(currentPageNo);
		return list;
	}
	
	public List<BoardVo> getSearchBoard(String kwd, Integer currentPageNo){
		List<BoardVo> list = adminDao.getSearchBoard(kwd, currentPageNo);
		return list;
	}
	
	public int getTotCntByBoard(){
		int totCnt = adminDao.getTotCntByBoard();
		return totCnt;
	}
	
	public int getTotCntBySearchBoard(String kwd){
		int totCnt = adminDao.getTotCntBySearchBoard(kwd);
		return totCnt;
	}
	
	public BoardVo getViewContext(Long no){
		BoardVo boardVo = adminDao.getViewContext(no);
		return boardVo;
	}
	
	public void deleteContext(Long no){
		adminDao.deleteContext(no);
	}
	
	public List<BoardVo> getBoardByNo(Long userNo){
		List<BoardVo> list = adminDao.getBoardByNo(userNo);
		return list;
	}
	
	//items
	
	public int getTotCntByItems(){
		int totCnt = adminDao.getTotCntByItems();
		return totCnt;
	}
	
	public int getTotCntBySearchItems(String kwd){
		int totCnt = adminDao.getTotCntBySearchItems(kwd);
		return totCnt;
	}
	
	public List<ItemsVo> getItems(Integer currentPageNo){
		List<ItemsVo> list = adminDao.getItems(currentPageNo);
		return list;
	}
	
	public List<ItemsVo> getSearchItems(String kwd, Integer currentPageNo){
		List<ItemsVo> list = adminDao.getSearchItems(kwd, currentPageNo);
		return list;
	}
	
	public ItemsVo getItemByNo(Long no){
		ItemsVo itemsVo = adminDao.getItemByNo(no);
		return itemsVo;
	}
	// 유저 number 로 유저이름 얻기
	public UserVo getNameByUserNo(Long no){
		UserVo userVo = adminDao.getNameByUserNo(no);
		return userVo;
	}
	
	// 유저 number 로 리스트 뽑기
	public List<ItemsVo> getItemsByUserNo(Long no){
		List<ItemsVo> list = adminDao.getItemsByUserNo(no);
		return list;
	}
	
	public void deleteItems(Long no){
		adminDao.deleteItems(no);
	}
}
