package com.ggosizo.domain.ss;

import java.sql.Date;

public class DateCourseDTO {
	private int course_no;
	private String course_title;
	private int course_li;
	private int course_ga;
	private int course_mu;
	private int course_ca;
	private int course_con;
	private int course_re;
	private int course_f;
	private int course_p;
	private int course_etc;
	private String course_order;
	private int course_like;
	private String course_thema;
	private int course_viewcnt;
	private int course_replycnt;
	private Date course_regdate;
	private String course_writer;
	
	public DateCourseDTO() {
	}

	public DateCourseDTO(int course_no, String course_title, int course_li, int course_ga, int course_mu, int course_ca,
			int course_con, int course_re, int course_f, int course_p, int course_etc, String course_order,
			int course_like, String course_thema, int course_viewcnt, int course_replycnt, Date course_regdate,
			String course_writer) {
		super();
		this.course_no = course_no;
		this.course_title = course_title;
		this.course_li = course_li;
		this.course_ga = course_ga;
		this.course_mu = course_mu;
		this.course_ca = course_ca;
		this.course_con = course_con;
		this.course_re = course_re;
		this.course_f = course_f;
		this.course_p = course_p;
		this.course_etc = course_etc;
		this.course_order = course_order;
		this.course_like = course_like;
		this.course_thema = course_thema;
		this.course_viewcnt = course_viewcnt;
		this.course_replycnt = course_replycnt;
		this.course_regdate = course_regdate;
		this.course_writer = course_writer;
	}

	public int getCourse_no() {
		return course_no;
	}

	public void setCourse_no(int course_no) {
		this.course_no = course_no;
	}

	public String getCourse_title() {
		return course_title;
	}

	public void setCourse_title(String course_title) {
		this.course_title = course_title;
	}

	public int getCourse_li() {
		return course_li;
	}

	public void setCourse_li(int course_li) {
		this.course_li = course_li;
	}

	public int getCourse_ga() {
		return course_ga;
	}

	public void setCourse_ga(int course_ga) {
		this.course_ga = course_ga;
	}

	public int getCourse_mu() {
		return course_mu;
	}

	public void setCourse_mu(int course_mu) {
		this.course_mu = course_mu;
	}

	public int getCourse_ca() {
		return course_ca;
	}

	public void setCourse_ca(int course_ca) {
		this.course_ca = course_ca;
	}

	public int getCourse_con() {
		return course_con;
	}

	public void setCourse_con(int course_con) {
		this.course_con = course_con;
	}

	public int getCourse_re() {
		return course_re;
	}

	public void setCourse_re(int course_re) {
		this.course_re = course_re;
	}

	public int getCourse_f() {
		return course_f;
	}

	public void setCourse_f(int course_f) {
		this.course_f = course_f;
	}

	public int getCourse_p() {
		return course_p;
	}

	public void setCourse_p(int course_p) {
		this.course_p = course_p;
	}

	public int getCourse_etc() {
		return course_etc;
	}

	public void setCourse_etc(int course_etc) {
		this.course_etc = course_etc;
	}

	public String getCourse_order() {
		return course_order;
	}

	public void setCourse_order(String course_order) {
		this.course_order = course_order;
	}

	public int getCourse_like() {
		return course_like;
	}

	public void setCourse_like(int course_like) {
		this.course_like = course_like;
	}

	public String getCourse_thema() {
		return course_thema;
	}

	public void setCourse_thema(String course_thema) {
		this.course_thema = course_thema;
	}

	public int getCourse_viewcnt() {
		return course_viewcnt;
	}

	public void setCourse_viewcnt(int course_viewcnt) {
		this.course_viewcnt = course_viewcnt;
	}

	public int getCourse_replycnt() {
		return course_replycnt;
	}

	public void setCourse_replycnt(int course_replycnt) {
		this.course_replycnt = course_replycnt;
	}

	public Date getCourse_regdate() {
		return course_regdate;
	}

	public void setCourse_regdate(Date course_regdate) {
		this.course_regdate = course_regdate;
	}

	public String getCourse_writer() {
		return course_writer;
	}

	public void setCourse_writer(String course_writer) {
		this.course_writer = course_writer;
	}

	@Override
	public String toString() {
		return "DateCourseDTO [course_no=" + course_no + ", course_title=" + course_title + ", course_li=" + course_li
				+ ", course_ga=" + course_ga + ", course_mu=" + course_mu + ", course_ca=" + course_ca + ", course_con="
				+ course_con + ", course_re=" + course_re + ", course_f=" + course_f + ", course_p=" + course_p
				+ ", course_etc=" + course_etc + ", course_order=" + course_order + ", course_like=" + course_like
				+ ", course_thema=" + course_thema + ", course_viewcnt=" + course_viewcnt + ", course_replycnt="
				+ course_replycnt + ", course_regdate=" + course_regdate + ", course_writer=" + course_writer + "]";
	}
}
