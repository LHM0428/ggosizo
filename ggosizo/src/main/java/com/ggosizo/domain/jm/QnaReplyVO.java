package com.ggosizo.domain.jm;

import java.sql.Date;

public class QnaReplyVO {
	private int no;
	private int reply_no;
	private String reply_content;
	private String reply_writer;
	private Date reply_regdate;
	private Date reply_updatedate;

	public QnaReplyVO(int no, int reply_no, String reply_content, String reply_writer,
			Date reply_regdate, Date reply_updatedate) {
		this.no = no;
		this.reply_no = reply_no;
		this.reply_content = reply_content;
		this.reply_writer = reply_writer;
		this.reply_regdate = reply_regdate;
		this.reply_updatedate = reply_updatedate;
	}
	@Override
	public String toString() {
		return "QnaReplyVO [no=" + no + ", reply_no=" + reply_no + ", reply_content="
				+ reply_content + ", reply_writer=" + reply_writer + ", reply_regdate="
				+ reply_regdate + ", reply_updatedate=" + reply_updatedate + "]";
	}


	public QnaReplyVO() {
	}

	public int getno() {
		return no;
	}

	public void setno(int qna_no) {
		this.no = qna_no;
	}

	public int getreply_no() {
		return reply_no;
	}

	public void setreply_no(int qna_reply_no) {
		this.reply_no = qna_reply_no;
	}

	public String getreply_content() {
		return reply_content;
	}

	public void setreply_content(String qna_reply_content) {
		this.reply_content = qna_reply_content;
	}

	public String get_reply_writer() {
		return reply_writer;
	}

	public void setreply_writer(String qna_reply_writer) {
		this.reply_writer = qna_reply_writer;
	}

	public Date getreply_regdate() {
		return reply_regdate;
	}

	public void setreply_regdate(Date qna_reply_regdate) {
		this.reply_regdate = qna_reply_regdate;
	}

	public Date getreply_updatedate() {
		return reply_updatedate;
	}

	public void setreply_updatedate(Date qna_reply_updatedate) {
		this.reply_updatedate = qna_reply_updatedate;
	}

}
