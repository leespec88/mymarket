package com.bit.mymarket.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit.mymarket.vo.BoardVo;
import com.bit.mymarket.vo.ReplyVo;



@Repository
public class BoardDao {

	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;

	@SuppressWarnings("unchecked")
	public List<BoardVo> getList(int _skip, int _max) {
		List<BoardVo> list = sqlMapClientTemplate.queryForList("board.list",
				_skip, _max);
		// System.out.println("list size=" + list.size());
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<BoardVo> getList(int _skip, int _max, String kwd) {
		List<BoardVo> list = sqlMapClientTemplate.queryForList("board.listkwd",
				kwd, _skip, _max);
		return list;
	}

	public List<BoardVo> search(String kwd) {
		return sqlMapClientTemplate.queryForList("board.search");
	}

	public void write(BoardVo boardVo) {
		sqlMapClientTemplate.insert("board.insert", boardVo);
	}

	public void delete(Long no) {
		sqlMapClientTemplate.delete("board.delete", no);

	}

	public BoardVo view(Long no) {
		return (BoardVo) sqlMapClientTemplate.queryForObject("board.view", no);
	}

	public BoardVo get(long no) {
		BoardVo vo = (BoardVo) sqlMapClientTemplate.queryForObject(
				"board.getbyno", no);
		System.out.println(no + "의  vo : " + vo);
		return vo;

	}

	public void update(BoardVo vo) {
		sqlMapClientTemplate.update("board.update", vo);

	}

	public int count() {
		return (int) sqlMapClientTemplate.queryForObject("board.count");
	}

	public List<ReplyVo> getReplyList(Long articleNo) {
		System.out.println("articleNo : " + articleNo);
		List<ReplyVo> list = sqlMapClientTemplate.queryForList("reply.list", articleNo);
		// System.out.println(list);
		return list;
	}

	public void addReply(ReplyVo vo) {
		System.out.println("addReply : " + vo);
		sqlMapClientTemplate.insert("reply.insert", vo);

	}

	public void delreply(Long no) {
		System.out.println("delreply : " + no);
		sqlMapClientTemplate.delete("reply.delete", no);

	}

	public void addReReply(ReplyVo rereplyVo) {
		sqlMapClientTemplate.insert("reply.replyreply", rereplyVo);		
	}

	public ReplyVo getReply(Long no) {
		ReplyVo replyVo = (ReplyVo) sqlMapClientTemplate.queryForObject("reply.getreplybyno", no);
		System.out.println("BoardDao 결과 getReply replyVo : " +replyVo);
		return replyVo;
	}

	public void viewCnt(Long no) {
		// TODO Auto-generated method stub
		System.out.println("보드 다오 board.viewcount!!! " + no);
		sqlMapClientTemplate.update("board.viewcount", no);
	}

	public void addReplyCnt(Long no) {
		sqlMapClientTemplate.update("board.replycount", no);
	}
	public int replyCnt(Long no){
		return (int) sqlMapClientTemplate.queryForObject("reply.replyCount", no);
	}

	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	public void insertBoard(Map<String, Object> map) {
		sqlMapClientTemplate.insert("board.insertBoard", map);
		
	}
	public void insertFile(Map<String, Object> map) {
		sqlMapClientTemplate.insert("board.insertFile", map);		
	}


	public void appendFile(Map<String, Object> map) {
		sqlMapClientTemplate.insert("board.appendFile", map);		
	}

	public void updateHitCnt(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Long no) throws Exception{
		return (List<Map<String, Object>>)sqlMapClientTemplate.queryForList("board.selectFileList", no);
	}

	public Map<String, Object> selectBoardDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	public void update(Map<String, Object> map) {
//		System.out.println("update!!!");
		map.toString();
		sqlMapClientTemplate.update("board.updateboard", map);
		
	}

	public void deleteFileList(Map<String, Object> map) {
		
		
	}

	public void deleteFile(Integer integer) {
		sqlMapClientTemplate.update("board.deletefile", integer);
		
	}
	
}
