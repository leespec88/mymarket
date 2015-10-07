package com.bit.mymarket.vo;

public class AnalysisKeywordVo {
	
	private String keyword;
	private String gender;
	private Long ageGroup;
	private Long count;
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Long getAgeGroup() {
		return ageGroup;
	}
	public void setAgeGroup(Long ageGroup) {
		this.ageGroup = ageGroup;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "AnalysisKeywordVo [keyword=" + keyword + ", gender=" + gender
				+ ", ageGroup=" + ageGroup + ", count=" + count + "]";
	}
	
}
