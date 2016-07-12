package com.ggosizo.domain.jm;

import java.sql.Date;

public class QnaVO {

	private int qna_no;
	private String qna_title;
	private String qna_content;
	private String qna_writer;
	private Date qna_regdate;
	private int qna_viewcnt;
	private int qna_replycnt;
	
	public QnaVO(int qna_no, String qna_title, String qna_content, String qna_writer, Date qna_regdate, int qna_viewcnt,
			int qna_replycnt) {
		this.qna_no = qna_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_writer = qna_writer;
		this.qna_regdate = qna_regdate;
		this.qna_viewcnt = qna_viewcnt;
		this.qna_replycnt = qna_replycnt;
	}

	@Override
	public String toString() {
		return "QnaVO [qna_no=" + qna_no + ", qna_title=" + qna_title + ", qna_content=" + qna_content + ", qna_writer="
				+ qna_writer + ", qna_regdate=" + qna_regdate + ", qna_viewcnt=" + qna_viewcnt + ", qna_replycnt="
				+ qna_replycnt + "]";
	}
	public QnaVO() {

	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_writer() {
		return qna_writer;
	}

	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}

	public Date getQna_regdate() {
		return qna_regdate;
	}

	public void setQna_regdate(Date qna_regdate) {
		this.qna_regdate = qna_regdate;
	}

	public int getQna_viewcnt() {
		return qna_viewcnt;
	}

	public void setQna_viewcnt(int qna_viewcnt) {
		this.qna_viewcnt = qna_viewcnt;
	}

	public int getQna_replycnt() {
		return qna_replycnt;
	}

	public void setQna_replycnt(int qna_replycnt) {
		this.qna_replycnt = qna_replycnt;
	}

}
