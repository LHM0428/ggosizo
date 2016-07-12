package com.ggosizo.persistence.hm;

import java.util.List;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.hm.RestaurantFileVO;
import com.ggosizo.domain.hm.RestaurantVO;
import com.ggosizo.domain.hm.SidoCriteria;
import com.ggosizo.domain.yj.SearchCriteria;

public interface RestaurantDAO {
	
	public void insert(RestaurantVO vo);
	public void delete(int no);
	public void update(RestaurantVO vo);
	public List<RestaurantVO> selectAll();
	public List<RestaurantVO> searchAddr(SidoCriteria cri);
	public int selectCount();
	public DateCourse selectRestaurant(int no);
	int searchCount(SidoCriteria cri);
	public void updateReplyCnt(int no, int amount) throws Exception;
	public void updateLikeCnt(int no, int amount);
	void viewCnt(int no);
	public List<DateCourse> selectKeyword(SearchCriteria searchCri) throws Exception;
	public int selectKeywordCount(String keyword);
	public List<DateCourse>selectID(String u_id);
	
	//파일 입출력
	public void addAttach (RestaurantFileVO file)throws Exception;
	public int maxNo ()throws Exception;
	public RestaurantFileVO getAttach (int no)throws Exception;
	public void updateAttach (RestaurantFileVO file)throws Exception;
	public void deleteAttach (int no)throws Exception;
	
}
