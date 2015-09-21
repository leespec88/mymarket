package com.bit.mymarket.vo;

public class ItemOnePicVo {
	private Long no;
	private String title;
	private String content;
	private String tradeCategory;
	private String itemCondition;
	private Long price;
	private Long userNo;
	private String userName;
	private String location;
	private String email;
	private String shippingFee;
	private Long viewCount;
	private String regDate; //등록시간 추가
	private String address;
	private Long itemNo;
	private String url;
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
	public String getTradeCategory() {
		return tradeCategory;
	}
	public void setTradeCategory(String tradeCategory) {
		this.tradeCategory = tradeCategory;
	}
	public String getItemCondition() {
		return itemCondition;
	}
	public void setItemCondition(String itemCondition) {
		this.itemCondition = itemCondition;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getShippingFee() {
		return shippingFee;
	}
	public void setShippingFee(String shippingFee) {
		this.shippingFee = shippingFee;
	}
	public Long getViewCount() {
		return viewCount;
	}
	public void setViewCount(Long viewCount) {
		this.viewCount = viewCount;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
		return "ItemOnePicVo [no=" + no + ", title=" + title + ", content="
				+ content + ", tradeCategory=" + tradeCategory
				+ ", itemCondition=" + itemCondition + ", price=" + price
				+ ", userNo=" + userNo + ", userName=" + userName
				+ ", location=" + location + ", email=" + email
				+ ", shippingFee=" + shippingFee + ", viewCount=" + viewCount
				+ ", regDate=" + regDate + ", address=" + address + ", itemNo="
				+ itemNo + ", url=" + url + "]";
	}
	
	
	
}
