package com.ggosizo.service.yj;

import java.util.List;

import com.ggosizo.domain.yj.SearchCriteria;
import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.EventVO;


public interface EventService {
	public void insert(EventVO event)throws Exception;
	public void delete(int no)throws Exception;
	public void update(EventVO event)throws Exception;
	public EventVO select(int no)throws Exception;
	public EventVO updateSelect(int no)throws Exception;
	public List<EventVO> selectAll()throws Exception;
	public void selectPage(Criteria cri)throws Exception;
	public void selectCount()throws Exception;
	
	public List<EventVO> listCriteria(Criteria cri)throws Exception;
	public int listCountCriteria()throws Exception;
	
	public List<EventVO> listSearchCriteria(SearchCriteria cri)throws Exception;
	public int listSearchCount(SearchCriteria cri)throws Exception;
}
