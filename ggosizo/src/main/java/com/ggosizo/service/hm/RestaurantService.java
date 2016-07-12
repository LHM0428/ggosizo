package com.ggosizo.service.hm;

import java.util.List;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.hm.RestaurantVO;
import com.ggosizo.domain.hm.SidoCriteria;
import com.ggosizo.domain.yj.SearchCriteria;

public interface RestaurantService {

	public void insert(RestaurantVO vo) throws Exception;
	public void delete(int no) throws Exception;
	public void update(RestaurantVO vo) throws Exception;
	public List<RestaurantVO> selectAll();
	public int selectCount();
	public DateCourse selectRestaurant(int no) throws Exception;
	List<RestaurantVO> searchAddr(SidoCriteria cri);
	int searchCount(SidoCriteria cri);
	int updateLikeCnt(int no, int amount) throws Exception;
	List<DateCourse> selectKeyword(SearchCriteria searchCri) throws Exception;
	int searchKewordCount(String keyword);
	List<DateCourse> selectId(String writer);
}
