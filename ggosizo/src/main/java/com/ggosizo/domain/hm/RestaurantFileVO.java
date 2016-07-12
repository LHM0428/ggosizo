package com.ggosizo.domain.hm;

import java.util.Date;

import com.ggosizo.domain.DateCourseFile;

public class RestaurantFileVO extends DateCourseFile{

	public RestaurantFileVO() {
		// TODO Auto-generated constructor stub
	}

	public RestaurantFileVO(String path, int no, Date regdate) {
		super(path, no, regdate);
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "RestaurantFileVO [toString()=" + super.toString() + ", getPath()=" + getPath() + ", getNo()=" + getNo()
				+ ", getRegdate()=" + getRegdate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
	
}
