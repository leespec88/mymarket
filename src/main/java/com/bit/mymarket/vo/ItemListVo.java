package com.bit.mymarket.vo;

public class ItemListVo {
	private Long no;
	private String title;
	private String price;
	private String location;
	private String regDate; //등록시간 추가
	private String url;
	
	public Long getNo() {
		return no;
	}
	public void setItemNo(Long no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "ItemListVo [no=" + no + ", title=" + title + ", price="
				+ price + ", location=" + location + ", regDate=" + regDate
				+ ", url=" + url + "]";
	}
	
	
	
	
}
