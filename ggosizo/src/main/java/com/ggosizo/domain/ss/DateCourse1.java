package com.ggosizo.domain.ss;

import java.util.Date;

public class DateCourse1 {
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
	private int viewcnt;
	private int replycnt;
	private Date regdate;
	private String etc_title;
	private String writer;
	
	public DateCourse1() {
	}

	public DateCourse1(int no, String name, String addr, String si, String gugun, String dong, String coming,
			String tel, String url, String img, String openhour, String closeday, String startdate, String enddate,
			String category, String price, String content, int viewcnt, int replycnt, Date regdate, String etc_title,
			String writer) {
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
		this.viewcnt = viewcnt;
		this.replycnt = replycnt;
		this.regdate = regdate;
		this.etc_title = etc_title;
		this.writer = writer;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getSi() {
		return si;
	}

	public void setSi(String si) {
		this.si = si;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getComing() {
		return coming;
	}

	public void setComing(String coming) {
		this.coming = coming;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getOpenhour() {
		return openhour;
	}

	public void setOpenhour(String openhour) {
		this.openhour = openhour;
	}

	public String getCloseday() {
		return closeday;
	}

	public void setCloseday(String closeday) {
		this.closeday = closeday;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public int getReplycnt() {
		return replycnt;
	}

	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getEtc_title() {
		return etc_title;
	}

	public void setEtc_title(String etc_title) {
		this.etc_title = etc_title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "DateCourse1 [no=" + no + ", name=" + name + ", addr=" + addr + ", si=" + si + ", gugun=" + gugun
				+ ", dong=" + dong + ", coming=" + coming + ", tel=" + tel + ", url=" + url + ", img=" + img
				+ ", openhour=" + openhour + ", closeday=" + closeday + ", startdate=" + startdate + ", enddate="
				+ enddate + ", category=" + category + ", price=" + price + ", content=" + content + ", viewcnt="
				+ viewcnt + ", replycnt=" + replycnt + ", regdate=" + regdate + ", etc_title=" + etc_title + ", writer="
				+ writer + "]";
	}
	
}
