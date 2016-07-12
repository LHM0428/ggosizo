package com.ggosizo.domain;

import java.util.Date;

public class Reply {

	private int no;
	private int reply_no;
	private String reply_content;
	private String reply_writer;
	private Date reply_regdate;
	private Date reply_updatedate;
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}
	
	public Reply(int no, int reply_no, String reply_content, String reply_writer, Date reply_regdate,
			Date reply_updatedate) {
		super();
		this.no = no;
		this.reply_no = reply_no;
		this.reply_content = reply_content;
		this.reply_writer = reply_writer;
		this.reply_regdate = reply_regdate;
		this.reply_updatedate = reply_updatedate;
	}

	@Override
	public String toString() {
		return "Reply [no=" + no + ", reply_no=" + reply_no + ", reply_content=" + reply_content + ", reply_writer="
				+ reply_writer + ", reply_regdate=" + reply_regdate + ", reply_updatedate=" + reply_updatedate + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public String getReply_writer() {
		return reply_writer;
	}

	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}

	public Date getReply_regdate() {
		return reply_regdate;
	}

	public void setReply_regdate(Date reply_regdate) {
		this.reply_regdate = reply_regdate;
	}

	public Date getReply_updatedate() {
		return reply_updatedate;
	}

	public void setReply_updatedate(Date reply_updatedate) {
		this.reply_updatedate = reply_updatedate;
	}
}
