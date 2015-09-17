package com.bit.mymarket.vo;

public class BoardVo {

	private Long no;
	private String title;
	private String content;
	private Long userNo;
	private String userName;
	private Long viewCnt;
	private String regDate;
	private Integer replyCnt;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Long getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(Long viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "BoardVo [no=" + no + ", title=" + title + ", content="
				+ content + ", userNo=" + userNo + ", userName=" + userName
				+ ", viewCnt=" + viewCnt + ", regDate=" + regDate
				+ ", replyCnt=" + replyCnt + "]";
	}
	public Integer getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(Integer replyCnt) {
		this.replyCnt = replyCnt;
	}
	
	
	
}
