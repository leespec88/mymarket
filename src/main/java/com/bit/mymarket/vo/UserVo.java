package com.bit.mymarket.vo;

public class UserVo {
	private Long no;
	private String idNo;
	private String name;
	private String email;
	private String password;
	private String birth;
	private String gender;
	private String phone;
	private String member_type;
	private String wishItem;
	private String regDate;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getIdNo() {
		return idNo;
	}
	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMemberType() {
		return member_type;
	}
	public void setMemberType(String member_type) {
		this.member_type = member_type;
	}
	public String getWishItem() {
		return wishItem;
	}
	public void setWishItem(String wishItem) {
		this.wishItem = wishItem;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "TestVo [no=" + no + ", idNo=" + idNo + ", name=" + name
				+ ", email=" + email + ", password=" + password + ", birth="
				+ birth + ", gender=" + gender + ", phone=" + phone
				+ ", memberType=" + member_type + ", wishItem=" + wishItem
				+ ", regDate=" + regDate + "]";
	}
	
	

}
