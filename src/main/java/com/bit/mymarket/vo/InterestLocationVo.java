package com.bit.mymarket.vo;

public class InterestLocationVo {

	private Long interestNo;
	private Long userNo;
	private String cityName;
	private String guName;
	public Long getInterestNo() {
		return interestNo;
	}
	public void setInterestNo(Long interestNo) {
		this.interestNo = interestNo;
	}
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getGuName() {
		return guName;
	}
	public void setGuName(String guName) {
		this.guName = guName;
	}
	
	@Override
	public String toString() {
		return "InterestLocation [interestNo=" + interestNo + ", userNo="
				+ userNo + ", cityName=" + cityName + ", guName=" + guName
				+ "]";
	}
	
	
	
}
