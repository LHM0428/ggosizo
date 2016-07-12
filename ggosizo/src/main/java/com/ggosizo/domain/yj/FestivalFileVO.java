package com.ggosizo.domain.yj;

import java.util.Date;

import com.ggosizo.domain.DateCourseFile;

public class FestivalFileVO extends DateCourseFile{
	public FestivalFileVO() {
	
	}

	public FestivalFileVO(String path, int no, Date regdate) {
		super(path, no, regdate);
	}

	@Override
	public String toString() {
		return "FestivalFileVO [toString()=" + super.toString() + ", getPath()=" + getPath() + ", getNo()=" + getNo()
				+ ", getRegdate()=" + getRegdate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}

}
