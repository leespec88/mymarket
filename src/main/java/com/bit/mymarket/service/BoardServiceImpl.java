package com.bit.mymarket.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.mymarket.dao.BoardDao;
import com.bit.mymarket.util.FileUtils;
import com.bit.mymarket.vo.BoardVo;
import com.bit.mymarket.vo.ReplyVo;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao boardDao;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	private static final Log LOG = LogFactory.getLog(BoardServiceImpl.class);

	public List<BoardVo> search(String kwd) {
		return boardDao.search(kwd);
	}

	public void write(BoardVo boardVo) {
		boardDao.write(boardVo);
	}

	public void delete(Long no) {
		boardDao.delete(no);
	}

	public BoardVo view(Long no) {
		return boardDao.view(no);
	}

	public int countrow() {
		return boardDao.count();
	}

	public List<BoardVo> list(int _skip, int _max) {
		List<BoardVo> list = boardDao.getList(_skip, _max);
		return list;
	}

	public List<BoardVo> list(int _skip, int _max, String kwd) {
		List<BoardVo> list = boardDao.getList(_skip, _max, kwd);
		return list;
	}

	public BoardVo get(long no) {
		return boardDao.get(no);
	}

	public void delete(long no) {
		boardDao.delete(no);
	}

	public void update(BoardVo vo) {
		boardDao.update(vo);
	}
	public void delreply(Long no) {
		boardDao.delreply(no);

	}
	public int replyCnt(Long no){
		return boardDao.replyCnt(no);
	}

	public List<ReplyVo> getReplyList(Long no) {
		return boardDao.getReplyList(no);

	}

	public void addreply(ReplyVo vo) {
		boardDao.addReply(vo);

	}

	public void addReReply(ReplyVo rereplyVo) {
		boardDao.addReReply(rereplyVo);
	}

	public ReplyVo getReply(Long no) {
		// TODO Auto-generated method stub
		return boardDao.getReply(no);
	}

	public void viewcnt(Long no) {
		// TODO Auto-generated method stub
		boardDao.viewCnt(no);
	}

	public void addReplyCnt(Long no) {
		boardDao.addReplyCnt(no);

	}

	public void insertBoard(CommandMap defaultCommandMap) {
		// TODO Auto-generated method stub

	}

	@Override
	public void insertBoard(Map<String, Object> map) throws Exception {
		boardDao.insertBoard(map);
	}

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		boardDao.insertBoard(map);

		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map,
				request);
		for (int i = 0, size = list.size(); i < size; i++) {
			boardDao.insertFile(list.get(i));
		}
	}

	public Map<String, Object> fileList(Long no) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> list = (List<Map<String, Object>>) boardDao
				.selectFileList(no);
		resultMap.put("fileList", list);
		return resultMap;
	}

	public void update(Map<String, Object> map) {
		boardDao.update(map);
	}

	public void updateBoard(Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		boardDao.update(map);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map,
				request);
		Map<String,Object> tempMap = null;
		for (int i = 0, size = list.size(); i < size; i++) {
			tempMap = list.get(i);
		        if("Y".equals(tempMap.get("IS_NEW"))){
		        	
		        }
		        else{
		        	boardDao.appendFile(tempMap);
		        }
		    }
	}

	public void deleteFile(Integer integer) {
		boardDao.deleteFile(integer);
	}

}
