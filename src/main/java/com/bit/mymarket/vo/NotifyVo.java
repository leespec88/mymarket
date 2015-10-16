package com.bit.mymarket.vo;

public class NotifyVo {
	private Long no;
	private Long userNo;
	private Long itemNo;
	private String message;
	private String regDate;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public Long getItemNo() {
		return itemNo;
	}
	public void setItemNo(Long itemNo) {
		this.itemNo = itemNo;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "NotifyVo [no=" + no + ", userNo=" + userNo + ", itemNo="
				+ itemNo + ", message=" + message + ", regDate=" + regDate
				+ "]";
	}
	
	
	
}
