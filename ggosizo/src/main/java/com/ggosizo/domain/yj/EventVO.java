package com.ggosizo.domain.yj;

import java.sql.Date;
import java.util.List;

public class EventVO {
	
	private int event_no;
	private String event_title;
	private String event_content;
	private String event_writer;
	private Date event_regdate;
	private int event_viewcnt;
	private int event_replycnt;
	
	private String files;
	
	public EventVO() {
		// TODO Auto-generated constructor stub
	}

	public EventVO(int event_no, String event_title, String event_content, String event_writer, Date event_regdate,
			int event_viewcnt, int event_replycnt, String files) {
		super();
		this.event_no = event_no;
		this.event_title = event_title;
		this.event_content = event_content;
		this.event_writer = event_writer;
		this.event_regdate = event_regdate;
		this.event_viewcnt = event_viewcnt;
		this.event_replycnt = event_replycnt;
		this.files = files;
	}

	/**
	 * @return the event_no
	 */
	public int getEvent_no() {
		return event_no;
	}

	/**
	 * @param event_no the event_no to set
	 */
	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}

	/**
	 * @return the event_title
	 */
	public String getEvent_title() {
		return event_title;
	}

	/**
	 * @param event_title the event_title to set
	 */
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}

	/**
	 * @return the event_content
	 */
	public String getEvent_content() {
		return event_content;
	}

	/**
	 * @param event_content the event_content to set
	 */
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}

	/**
	 * @return the event_writer
	 */
	public String getEvent_writer() {
		return event_writer;
	}

	/**
	 * @param event_writer the event_writer to set
	 */
	public void setEvent_writer(String event_writer) {
		this.event_writer = event_writer;
	}

	/**
	 * @return the event_regdate
	 */
	public Date getEvent_regdate() {
		return event_regdate;
	}

	/**
	 * @param event_regdate the event_regdate to set
	 */
	public void setEvent_regdate(Date event_regdate) {
		this.event_regdate = event_regdate;
	}

	/**
	 * @return the event_viewcnt
	 */
	public int getEvent_viewcnt() {
		return event_viewcnt;
	}

	/**
	 * @param event_viewcnt the event_viewcnt to set
	 */
	public void setEvent_viewcnt(int event_viewcnt) {
		this.event_viewcnt = event_viewcnt;
	}

	/**
	 * @return the event_replycnt
	 */
	public int getEvent_replycnt() {
		return event_replycnt;
	}

	/**
	 * @param event_replycnt the event_replycnt to set
	 */
	public void setEvent_replycnt(int event_replycnt) {
		this.event_replycnt = event_replycnt;
	}

	/**
	 * @return the files
	 */
	public String getFiles() {
		return files;
	}

	/**
	 * @param files the files to set
	 */
	public void setFiles(String files) {
		this.files = files;
	}
	
}
