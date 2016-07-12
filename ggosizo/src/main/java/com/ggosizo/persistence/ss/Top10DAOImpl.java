package com.ggosizo.persistence.ss;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.ss.DateCourseDTO;


@Repository
public class Top10DAOImpl implements Top10DAO {

	@Inject
	private SqlSession session;
	
	@Override
	public List<DateCourseDTO> top10() {
		return session.selectList("top10.top10");
	}

	@Override
	public List<String> course_title() {
		return session.selectList("top10.course_title");
	}

	@Override
	public int selectCourseNo(Map<String, Object> map) {
		return session.selectOne("top10.selectCourseNo",map);
	}
	
	@Override
	public DateCourse selectCourse(Map<String, Object> map) {
		return session.selectOne("top10.selectCourse",map);
	}


}
