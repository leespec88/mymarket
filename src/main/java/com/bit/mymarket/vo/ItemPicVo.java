package com.bit.mymarket.vo;

public class ItemPicVo {
	private Long no;
	private Long itemNo;
	private String url;
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public Long getItemNo() {
		return itemNo;
	}
	public void setItemNo(Long itemNo) {
		this.itemNo = itemNo;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "ItemPicVo [no=" + no + ", itemNo=" + itemNo + ", url=" + url
				+ "]";
	}
	
		
}
