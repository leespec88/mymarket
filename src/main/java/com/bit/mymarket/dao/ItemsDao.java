package com.bit.mymarket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit.mymarket.CommandMap;
import com.bit.mymarket.vo.AnalysisKeywordVo;
import com.bit.mymarket.vo.HashTagVo;
import com.bit.mymarket.vo.ItemListVo;
import com.bit.mymarket.vo.ItemPicVo;
import com.bit.mymarket.vo.ItemsVo;
import com.bit.mymarket.vo.ReplyVo;

@Repository
public class ItemsDao {
	
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	// item 등록
	public void insert(ItemsVo itemsVo){
		System.out.println(itemsVo);
		sqlMapClientTemplate.insert("items.insert", itemsVo);
	}
	// 위 아이템에 대한 사진 등록
	public void insertPic(Map<String, Object> map){
		System.out.println(map);
		sqlMapClientTemplate.insert("items.insertPic", map);
		
	}
	
	public void insertByHash(Long no, String tagName){
		System.out.println("itemsNo:" + no +" : tageName:"+tagName );
		Map<Object,Object> map = new HashMap<Object, Object>();
		map.put("itemNo", no);
		map.put("tagName", tagName);
		sqlMapClientTemplate.insert("items.insertByHash", map);
	}
	
	public List<ItemListVo> getList() {
		//System.out.println(list);
		List<ItemListVo> list = sqlMapClientTemplate.queryForList("items.list");
		
		return list;
	}
	
	public Long getItemNo(String email, String title){
		Map<String,String> map = new HashMap<String,String>();
		map.put("email",email);
		map.put("title", title);
		Long itemNo = (Long)sqlMapClientTemplate.queryForObject("items.getItemNo",map);
		return itemNo;
	}
	
	public List<ItemPicVo> getPicList() {
		System.out.println("ItemPicDaoList");
		List<ItemPicVo> picList = sqlMapClientTemplate.queryForList("items.picList");
		return picList;
	}
	
	//사진 한장에 없으면 null 가져오기
	public List<ItemListVo> getItemList() {
		List<ItemListVo> itemList = sqlMapClientTemplate.queryForList("items.list");
		return itemList;
	}
	
	public List<ItemListVo> getItemList(String minlat, String minlng, String maxlat, String maxlng) {
		System.out.println("getOnePicListmapBounds");
		Map<String,String> map = new HashMap<String,String>();
		map.put("minlat",minlat);
		map.put("minlng",minlng);
		map.put("maxlat",maxlat);
		map.put("maxlng", maxlng);
		
		//System.out.println(mapBounds);
		List<ItemListVo> itemList = sqlMapClientTemplate.queryForList("items.getItemList", map);
		return itemList;
}
	public String getUrl(Long itemNo){
		List<ItemPicVo> list= sqlMapClientTemplate.queryForList("items.getUrlByItemNo", itemNo);
		String url = null;
		if(list.size()!=0){
			url=list.get(0).getUrl();
		}
		return url;
				
	}
	
	public List<HashTagVo> getTagName(Long itemNo){
		List<HashTagVo> list = sqlMapClientTemplate.queryForList("items.getTagName",itemNo);
		return list;
	}
	
	public List<HashTagVo> getTagList(){
		List<HashTagVo> list = sqlMapClientTemplate.queryForList("items.tagList");
		return list;
	}
	
	public List<ItemListVo> getKwdList(String kwd){
		List<ItemListVo> list = sqlMapClientTemplate.queryForList("items.kwdList",kwd);

		return list;
	}
	
	public List<HashTagVo> getNoList(String kwd){
		List<HashTagVo> list = sqlMapClientTemplate.queryForList("items.noList",kwd);
		return list;
	}
	
	public ItemsVo getItemByNo(Long no){
		ItemsVo itemsVo = (ItemsVo)sqlMapClientTemplate.queryForObject("items.getItemByNo", no);
		return itemsVo;
	}
	
	public ItemListVo getItemListByNo(Long no){
		ItemListVo itemsVo = (ItemListVo)sqlMapClientTemplate.queryForObject("items.getItemListByNo", no);
		return itemsVo;
	}
	
	public List<ItemsVo> getHashList(String kwd){
		List<ItemsVo> list = sqlMapClientTemplate.queryForList("items.hashList",kwd);
		return list;
	}
	
	public HashTagVo getTagListByItemNo(HashTagVo tagVo){
		HashTagVo vo = (HashTagVo)sqlMapClientTemplate.queryForObject("items.getTagListByItemNo", tagVo);
		return vo;
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Long no) {
		
		return (List<Map<String, Object>>)sqlMapClientTemplate.queryForList("items.selectFileList", no);
	}

	public void addReply(ReplyVo vo) {
		sqlMapClientTemplate.insert("itemreply.insert", vo);
	}

	public Long getRegItem(Long no) {
		return (Long) sqlMapClientTemplate.queryForObject("items.regItem", no);
		
	}

	public void insertItem(Map<String, Object> map) {
		System.err.println("insertItem!!!!1 = " + map.get("userNo"));
		sqlMapClientTemplate.insert("items.insertItem", map);
	}

	public void insertFile(Map<String, Object> map) {
		sqlMapClientTemplate.insert("items.insertFile", map);
	}
	public void insertAppendFile(Map<String, Object> map) {
		sqlMapClientTemplate.insert("items.insertAppendFile", map);
	}
	
	/*판매자의 아이템의 삭제   -by 이준기 0925*/
	public void deleteItem(Long itemno) {
		sqlMapClientTemplate.delete("items.deleteItem", itemno);
	}
	
	public void updateSellState(Map<String, Object> map) {
		sqlMapClientTemplate.update("items.updateState", map);
		
	}
	public void update(Map<String, Object> map) {
		sqlMapClientTemplate.update("items.updateItems", map);
	}
	public void insertKwd(Map<String, Object> map) {
		sqlMapClientTemplate.insert("items.insertKwd", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<AnalysisKeywordVo> getKwdList() {
		return sqlMapClientTemplate.queryForList("items.selectAllStoredKeyword");
	}
	
	@SuppressWarnings("unchecked")
	public List<AnalysisKeywordVo> selectKeywordCntList() {
		return sqlMapClientTemplate.queryForList("items.selectKeywordCntList");
	}
	
	public void insertProcessedKwd(Map<String, Object> map) {
		sqlMapClientTemplate.insert("items.mergeAnalysisKeywod", map);
	}
	@SuppressWarnings("unchecked")
	public List<AnalysisKeywordVo> selectRecentRegItemlist() {
		return sqlMapClientTemplate.queryForList("items.selectRecentRegItemlist");
	}
	public void deleteFile(Integer fileNo) {
		System.err.println("deleteFile!" +fileNo);
		sqlMapClientTemplate.delete("items.deleteFile", fileNo);
	}
	public void updateViewCnt(Long no) {
		sqlMapClientTemplate.update("items.updateViewCnt", no);
	}
	public List<Map<String, Object>> selectListViewCnt(){
		return sqlMapClientTemplate.queryForList("items.selectListViewCnt");
	}
	public List<Map<String, Object>> selectUserItemList(Long userNo) {
		return sqlMapClientTemplate.queryForList("items.selectListUserItem", userNo);
	}
	
}
