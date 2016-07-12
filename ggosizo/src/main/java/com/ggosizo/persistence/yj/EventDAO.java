package com.ggosizo.persistence.yj;

import java.util.List;

import com.ggosizo.domain.yj.SearchCriteria;
import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.EventFileVO;
import com.ggosizo.domain.yj.EventVO;

public interface EventDAO {
	public void insert(EventVO vo)throws Exception;
	public void delete(int no)throws Exception;
	public void update(EventVO vo)throws Exception;
	public EventVO select(int no)throws Exception;
	public List<EventVO> selectAll()throws Exception;
	public List<EventVO> selectPage(int page)throws Exception;
	public List<EventVO> selectCriteria(Criteria cri)throws Exception;
	public int countPage()throws Exception;
	
	//좋아요 기능
	public List<EventVO> listSearch(SearchCriteria cri)throws Exception;
	public int listSearchCount(SearchCriteria cri)throws Exception;
		
	public void updateReplyCnt(int no, int amount)throws Exception;
		
	public List<EventVO> testSelect()throws Exception;

	public void updateViewCnt(int no)throws Exception;

	public void addAttach (EventFileVO file)throws Exception;
	public int maxNo ()throws Exception;
	public EventFileVO getAttach (int no)throws Exception;
	public void updateAttach (EventFileVO file)throws Exception;
	public void deleteAttach (int no)throws Exception;
}
