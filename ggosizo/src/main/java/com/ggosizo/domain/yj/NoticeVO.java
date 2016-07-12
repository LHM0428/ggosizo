package com.ggosizo.domain.yj;

import java.sql.Date;
import java.util.List;

public class NoticeVO{
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private String notice_writer;
	private Date notice_regdate;
	private int notice_viewcnt;
	private int notice_replycnt;
	  
	private String files;
	
	public NoticeVO() {
	}

	public NoticeVO(int notice_no, String notice_title, String notice_content, String notice_writer,
			Date notice_regdate, int notice_viewcnt, int notice_replycnt, String files) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_writer = notice_writer;
		this.notice_regdate = notice_regdate;
		this.notice_viewcnt = notice_viewcnt;
		this.notice_replycnt = notice_replycnt;
		this.files = files;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_writer() {
		return notice_writer;
	}

	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}

	public Date getNotice_regdate() {
		return notice_regdate;
	}

	public void setNotice_regdate(Date notice_regdate) {
		this.notice_regdate = notice_regdate;
	}

	public int getNotice_viewcnt() {
		return notice_viewcnt;
	}

	public void setNotice_viewcnt(int notice_viewcnt) {
		this.notice_viewcnt = notice_viewcnt;
	}

	public int getNotice_replycnt() {
		return notice_replycnt;
	}

	public void setNotice_replycnt(int notice_replycnt) {
		this.notice_replycnt = notice_replycnt;
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}
	
}
