package com.ggosizo.domain.hm;

public class UserLikeCourseVO {
	private int no;
	private String course;
	private String u_id;
	
	public UserLikeCourseVO() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "UserLikeCourseVO [no=" + no + ", course=" + course + ", u_id=" + u_id + "]";
	}

	public UserLikeCourseVO(int no, String course, String u_id) {
		super();
		this.no = no;
		this.course = course;
		this.u_id = u_id;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
	
}
