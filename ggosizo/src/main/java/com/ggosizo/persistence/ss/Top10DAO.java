package com.ggosizo.persistence.ss;

import java.util.List;
import java.util.Map;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.ss.DateCourseDTO;

public interface Top10DAO {
	public List<DateCourseDTO> top10();
	public List<String> course_title();
	
	public int selectCourseNo(Map<String, Object> map);
	public DateCourse selectCourse(Map<String, Object> map);
	
}
