package com.bit.mymarket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit.mymarket.vo.BoardVo;
import com.bit.mymarket.vo.ItemsVo;
import com.bit.mymarket.vo.UserVo;


@Repository
public class AdminDao {
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	public int getTotCnt(){
		int totCnt = (int)sqlMapClientTemplate.queryForObject("user.getTotCnt");
		return totCnt;
	}
	
	public int getSearchTotCnt(String kwd){
		int totCnt = (int)sqlMapClientTemplate.queryForObject("user.getSearchTotCnt",kwd);
		return totCnt;
	}
	public List<UserVo> getMemberList(Integer currentPageNo){
		List<UserVo> list = sqlMapClientTemplate.queryForList("user.getMemberList", currentPageNo);
		return list;
	}
	
	public List<UserVo> getSearchMember(String kwd, Integer currentPageNo){
		Map<Object,Object> map = new HashMap<Object,Object>();
		map.put("kwd", kwd);
		map.put("currentPageNo", currentPageNo);
		List<UserVo> list = sqlMapClientTemplate.queryForList("user.getSearchMember", map);
		return list;
	}
	
	public UserVo getModifyMember(Long no){
		UserVo userVo = (UserVo)sqlMapClientTemplate.queryForObject("user.getModifyMember",no);
		return userVo;
	}
	
	public void updateBasicInfo(UserVo vo){
		sqlMapClientTemplate.update("user.basicInfo", vo);
	}
	
	
	
	//board
	
	
	public List<BoardVo> getBoardList(Integer currentPageNo){
		List<BoardVo> list = sqlMapClientTemplate.queryForList("board.getBoardList", currentPageNo);
		return list;
	}
	
	public List<BoardVo> getSearchBoard(String kwd, Integer currentPageNo){
		Map<Object, Object> map = new HashMap<Object,Object>();
		map.put("kwd", kwd);
		map.put("currentPageNo", currentPageNo);
		List<BoardVo> list = sqlMapClientTemplate.queryForList("board.getSearchBoard", map);
		return list;
	}
	
	public int getTotCntByBoard(){
		int totCnt = (int)sqlMapClientTemplate.queryForObject("board.count");
		return totCnt;
	}
	
	public int getTotCntBySearchBoard(String kwd){
		int totCnt = (int)sqlMapClientTemplate.queryForObject("board.countBySearch",kwd);
		return totCnt;
	}
	
	public BoardVo getViewContext(Long no){
		BoardVo boardVo = (BoardVo)sqlMapClientTemplate.queryForObject("board.getbyno", no);
		return boardVo;
	}
	
	public void deleteContext(Long no){
		sqlMapClientTemplate.delete("board.delete", no);
	}
	
	public List<BoardVo> getBoardByNo(Long userNo){
		List<BoardVo> list = sqlMapClientTemplate.queryForList("board.getBoardByNo", userNo);
		return list;
	}
	
	
	//items
	
	public int getTotCntByItems(){
		int totCnt = (int)sqlMapClientTemplate.queryForObject("items.totCnt");
		return totCnt;
	}
	
	public int getTotCntBySearchItems(String kwd){
		int totCnt = (int)sqlMapClientTemplate.queryForObject("items.totCntBySearch", kwd);
		return totCnt;
	}
	
	public List<ItemsVo> getItems(Integer currentPageNo){
		List<ItemsVo> list = sqlMapClientTemplate.queryForList("items.items", currentPageNo);
		return list;
	}
	
	public List<ItemsVo> getSearchItems(String kwd, Integer currentPageNo){
		Map<Object,Object> map = new HashMap<Object,Object>();
		map.put("kwd", kwd);
		map.put("currentPageNo", currentPageNo);
		List<ItemsVo> list = sqlMapClientTemplate.queryForList("items.itemsBySearch", map);
		return list;
	}
	public ItemsVo getItemByNo(Long no){
		ItemsVo itemsVo =(ItemsVo) sqlMapClientTemplate.queryForObject("items.getItemByNo", no);
		return itemsVo;
	}
	
	public UserVo getNameByUserNo(Long no){
		UserVo userVo = (UserVo) sqlMapClientTemplate.queryForObject("user.getUserName", no);
		return userVo;
	}
	public List<ItemsVo> getItemsByUserNo(Long no){
		List<ItemsVo> list = sqlMapClientTemplate.queryForList("items.getItemsByUserNo", no);
		return list;
	}
	
	public void deleteItems(Long no){
		sqlMapClientTemplate.delete("items.deleteItems", no);
	}
}
