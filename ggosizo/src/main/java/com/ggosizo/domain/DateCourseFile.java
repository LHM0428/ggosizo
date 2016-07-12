package com.ggosizo.domain;

import java.util.Date;

public class DateCourseFile {
	
	private String path;
	private int no;
	private Date regdate;
	
	public DateCourseFile(String path, int no, Date regdate) {
		super();
		this.path = path;
		this.no = no;
		this.regdate = regdate;
	}
	
	public DateCourseFile() {
	}

	@Override
	public String toString() {
		return "DateCourseFile [path=" + path + ", no=" + no + ", regdate=" + regdate + "]";
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
