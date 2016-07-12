package com.ggosizo.service.ss;

import java.util.List;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.ss.DateCourseDTO;

public interface Top10Service {
	public List<String> course_title();
	public List<DateCourseDTO> top10();
	public DateCourse selectCourse(String name,int no);
	public int selectCourseNo(int order,String name,int no);
	
}
