package com.bit.mymarket.vo;

public class ReplyVo {

	private Long no;
	private Long boardNo;
	private String content;
	private Long userNo;
	private String userName;
	private String regDate;
	private Long groupNo;
	private Long orderNo;
	private Long depth;
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public Long getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(Long boardNo) {
		this.boardNo = boardNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public Long getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(Long groupNo) {
		this.groupNo = groupNo;
	}
	public Long getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}
	public Long getDepth() {
		return depth;
	}
	public void setDepth(Long depth) {
		this.depth = depth;
	}
	@Override
	public String toString() {
		return "ReplyVo [no=" + no + ", boardNo=" + boardNo + ", content="
				+ content + ", userNo=" + userNo + ", userName=" + userName
				+ ", regDate=" + regDate + ", groupNo=" + groupNo
				+ ", orderNo=" + orderNo + ", depth=" + depth + "]";
	}
	
}