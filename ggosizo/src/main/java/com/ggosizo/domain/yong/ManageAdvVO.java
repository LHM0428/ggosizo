package com.ggosizo.domain.yong;

public class ManageAdvVO {
	private String name;
	private int viewcnt;
	private int price;
	private String url_name;
	private String file_name;
	private int max_viewcnt;
	public ManageAdvVO() {
		// TODO Auto-generated constructor stub
	}
	
	public ManageAdvVO(String name, int viewcnt, int price, String url_name, String file_name,
			int max_viewcnt) {
		super();
		this.name = name;
		this.viewcnt = viewcnt;
		this.price = price;
		this.url_name = url_name;
		this.file_name = file_name;
		this.max_viewcnt = max_viewcnt;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getUrl_name() {
		return url_name;
	}
	public void setUrl_name(String url_name) {
		this.url_name = url_name;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getMax_viewcnt() {
		return max_viewcnt;
	}
	public void setMax_viewcnt(int max_viewcnt) {
		this.max_viewcnt = max_viewcnt;
	}
	
	
}
