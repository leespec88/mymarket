package com.bit.mymarket.vo;

public class JjimVo {
	 Long jjimNo;
	 Long userNo;
	 Long itemNo;
	 String title;
	 Long price;
	 String image;
	public Long getJjimNo() {
		return jjimNo;
	}
	public void setJjimNo(Long jjimNo) {
		this.jjimNo = jjimNo;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "JjimVo [jjimNo=" + jjimNo + ", userNo=" + userNo + ", itemNo="
				+ itemNo + ", title=" + title + ", price=" + price + ", image="
				+ image + "]";
	}
	

	
	
}