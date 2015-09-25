package com.bit.mymarket.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.bit.mymarket.vo.ReplyVo;

@Repository
public class ReplyDao {
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;

	@SuppressWarnings("unchecked")
	public List<ReplyVo> getReplyList(Long targetNo) {
		System.out.println("articleNo : " + targetNo);
		List<ReplyVo> list = sqlMapClientTemplate.queryForList("itemreply.list", targetNo);
		return list;
	}

	public void addReply(ReplyVo vo) {
		System.out.println("addReply : " + vo);
		sqlMapClientTemplate.insert("itemreply.insert", vo);

	}

	public void delreply(Long no) {
		System.out.println("delreply : " + no);
		sqlMapClientTemplate.delete("itemreply.delete", no);

	}

	public void addReReply(ReplyVo rereplyVo) {
		sqlMapClientTemplate.insert("itemreply.replyreply", rereplyVo);
		/*sqlMapClientTemplate.update("itemreply.updateReply", rereplyVo);*/
	}

	public ReplyVo getReply(Long no) {
		ReplyVo replyVo = (ReplyVo) sqlMapClientTemplate.queryForObject("itemreply.getReplybyNo", no);
		return replyVo;
	}

	public int replyCnt(Long no) {
		return (int) sqlMapClientTemplate.queryForObject("itemreply.replyCount", no);
	}

}
