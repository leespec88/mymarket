package com.bit.mymarket.vo;

public class HashTagVo {
	
	private Long no;
	private String tagName;
	private Long itemNo;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public Long getItemNo() {
		return itemNo;
	}
	public void setItemNo(Long itemNo) {
		this.itemNo = itemNo;
	}
	
	@Override
	public String toString() {
		return "HashTagVo [no=" + no + ", tagName=" + tagName + ", itemNo="
				+ itemNo + "]";
	}
	
	
}
