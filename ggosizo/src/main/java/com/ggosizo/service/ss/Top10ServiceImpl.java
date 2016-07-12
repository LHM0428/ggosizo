package com.ggosizo.service.ss;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.ss.DateCourseDTO;
import com.ggosizo.persistence.ss.Top10DAO;

@Service
public class Top10ServiceImpl implements Top10Service {

	@Inject
	private Top10DAO top10DAO; 
	
	@Override
	public List<DateCourseDTO> top10() {
		return top10DAO.top10();
	}

	@Override
	public List<String> course_title() {
		return top10DAO.course_title();
	}

	@Override
	public DateCourse selectCourse(String name,int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("no", no);
		return top10DAO.selectCourse(map);
	}

	@Override
	public int selectCourseNo(int order,String name,int no) {
		System.out.println("###Top10ServiceImpl###");
		Map<String, Object> map = new HashMap<>();
		map.put("order", order);
		map.put("name", name);
		map.put("no", no);
		System.out.println("order:"+order);
		System.out.println("name:"+name);
		System.out.println("no:"+no);
		return top10DAO.selectCourseNo(map);
	}

}
