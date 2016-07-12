package com.ggosizo.domain;

import java.io.File;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class DateCourse {
	private int no;
	private String name;
	private String addr;
	private String si;
	private String gugun;
	private String dong;
	private String coming;
	private String tel;
	private String url;
	private String img;
	private String openhour;
	private String closeday;
	private String startdate;
	private String enddate;
	private String category;
	private String price;
	private String content;
	private String writer;
	private int viewcnt;
	private int replycnt;
	private int likecnt;
	private Date regdate;
	private String file;
	
	public DateCourse() {
	}

	

	public DateCourse(int no, String name, String addr, String si, String gugun, String dong, String coming, String tel,
			String url, String img, String openhour, String closeday, String startdate, String enddate, String category,
			String price, String content, String writer, int viewcnt, int replycnt, int likecnt, Date regdate,
			String file) {
		super();
		this.no = no;
		this.name = name;
		this.addr = addr;
		this.si = si;
		this.gugun = gugun;
		this.dong = dong;
		this.coming = coming;
		this.tel = tel;
		this.url = url;
		this.img = img;
		this.openhour = openhour;
		this.closeday = closeday;
		this.startdate = startdate;
		this.enddate = enddate;
		this.category = category;
		this.price = price;
		this.content = content;
		this.writer = writer;
		this.viewcnt = viewcnt;
		this.replycnt = replycnt;
		this.likecnt = likecnt;
		this.regdate = regdate;
		this.file = file;
	}

	@Override
	public String toString() {
		return "DateCourse [no=" + no + ", name=" + name + ", addr=" + addr + ", si=" + si + ", gugun=" + gugun
				+ ", dong=" + dong + ", coming=" + coming + ", tel=" + tel + ", url=" + url + ", img=" + img
				+ ", openhour=" + openhour + ", closeday=" + closeday + ", startdate=" + startdate + ", enddate="
				+ enddate + ", category=" + category + ", price=" + price + ", content=" + content + ", writer="
				+ writer + ", viewcnt=" + viewcnt + ", replycnt=" + replycnt + ", likecnt=" + likecnt + ", regdate="
				+ regdate + ", file=" + file + "]";
	}



	/**
	 * @return the no
	 */
	public int getNo() {
		return no;
	}



	/**
	 * @param no the no to set
	 */
	public void setNo(int no) {
		this.no = no;
	}



	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}



	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}



	/**
	 * @return the addr
	 */
	public String getAddr() {
		return addr;
	}



	/**
	 * @param addr the addr to set
	 */
	public void setAddr(String addr) {
		this.addr = addr;
	}



	/**
	 * @return the si
	 */
	public String getSi() {
		return si;
	}



	/**
	 * @param si the si to set
	 */
	public void setSi(String si) {
		this.si = si;
	}



	/**
	 * @return the gugun
	 */
	public String getGugun() {
		return gugun;
	}



	/**
	 * @param gugun the gugun to set
	 */
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}



	/**
	 * @return the dong
	 */
	public String getDong() {
		return dong;
	}



	/**
	 * @param dong the dong to set
	 */
	public void setDong(String dong) {
		this.dong = dong;
	}



	/**
	 * @return the coming
	 */
	public String getComing() {
		return coming;
	}



	/**
	 * @param coming the coming to set
	 */
	public void setComing(String coming) {
		this.coming = coming;
	}



	/**
	 * @return the tel
	 */
	public String getTel() {
		return tel;
	}



	/**
	 * @param tel the tel to set
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}



	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}



	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}



	/**
	 * @return the img
	 */
	public String getImg() {
		return img;
	}



	/**
	 * @param img the img to set
	 */
	public void setImg(String img) {
		this.img = img;
	}



	/**
	 * @return the openhour
	 */
	public String getOpenhour() {
		return openhour;
	}



	/**
	 * @param openhour the openhour to set
	 */
	public void setOpenhour(String openhour) {
		this.openhour = openhour;
	}



	/**
	 * @return the closeday
	 */
	public String getCloseday() {
		return closeday;
	}



	/**
	 * @param closeday the closeday to set
	 */
	public void setCloseday(String closeday) {
		this.closeday = closeday;
	}



	/**
	 * @return the startdate
	 */
	public String getStartdate() {
		return startdate;
	}



	/**
	 * @param startdate the startdate to set
	 */
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}



	/**
	 * @return the enddate
	 */
	public String getEnddate() {
		return enddate;
	}



	/**
	 * @param enddate the enddate to set
	 */
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}



	/**
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}



	/**
	 * @param category the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}



	/**
	 * @return the price
	 */
	public String getPrice() {
		return price;
	}



	/**
	 * @param price the price to set
	 */
	public void setPrice(String price) {
		this.price = price;
	}



	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}



	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}



	/**
	 * @return the writer
	 */
	public String getWriter() {
		return writer;
	}



	/**
	 * @param writer the writer to set
	 */
	public void setWriter(String writer) {
		this.writer = writer;
	}



	/**
	 * @return the viewcnt
	 */
	public int getViewcnt() {
		return viewcnt;
	}



	/**
	 * @param viewcnt the viewcnt to set
	 */
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}



	/**
	 * @return the replycnt
	 */
	public int getReplycnt() {
		return replycnt;
	}



	/**
	 * @param replycnt the replycnt to set
	 */
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}



	/**
	 * @return the likecnt
	 */
	public int getLikecnt() {
		return likecnt;
	}



	/**
	 * @param likecnt the likecnt to set
	 */
	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}



	/**
	 * @return the regdate
	 */
	public Date getRegdate() {
		return regdate;
	}



	/**
	 * @param regdate the regdate to set
	 */
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}



	/**
	 * @return the file
	 */
	public String getFile() {
		return file;
	}



	/**
	 * @param file the file to set
	 */
	public void setFile(String file) {
		this.file = file;
	}

	
}
