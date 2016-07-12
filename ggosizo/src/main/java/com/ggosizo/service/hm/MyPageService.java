package com.ggosizo.service.hm;

import java.util.List;

import com.ggosizo.domain.jm.QnaVO;
import com.ggosizo.domain.yj.SearchCriteria;

public interface MyPageService {
	String searchLikeCourse(SearchCriteria searchCri, int no);
	String searchMyCourse(SearchCriteria searchCri, int no);
	List<Object> myCourseList(String u_id);
	List<QnaVO> myQnAList(String writer) throws Exception;
}
