package com.ggosizo.domain.hm;

import java.util.Date;

import com.ggosizo.domain.DateCourseFile;

public class CafeFileVO extends DateCourseFile{

	public CafeFileVO() {
		// TODO Auto-generated constructor stub
	}

	public CafeFileVO(String path, int no, Date regdate) {
		super(path, no, regdate);
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "CafeFileVO [toString()=" + super.toString() + ", getPath()=" + getPath() + ", getNo()=" + getNo()
				+ ", getRegdate()=" + getRegdate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
	
}
