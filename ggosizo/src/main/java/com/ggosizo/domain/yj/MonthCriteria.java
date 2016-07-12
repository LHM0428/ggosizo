package com.ggosizo.domain.yj;

public class MonthCriteria extends Criteria{
	private String month;
	private String searchType;
	private String keyword;
	
	public MonthCriteria() {
		month="";
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "MonthCriteria [month=" + month + "]";
	}
}
