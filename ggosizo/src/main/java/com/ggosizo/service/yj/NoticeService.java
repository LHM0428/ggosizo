package com.ggosizo.service.yj;

import java.util.List;

import com.ggosizo.domain.yj.NoticeVO;
import com.ggosizo.domain.yj.SearchCriteria;
import com.ggosizo.domain.yj.Criteria;


public interface NoticeService {
	public void insert(NoticeVO notice)throws Exception;
	public void delete(int no)throws Exception;
	public void update(NoticeVO notice)throws Exception;
	public NoticeVO select(int no)throws Exception;
	public NoticeVO updateSelect(int no)throws Exception;
	public List<NoticeVO> selectAll()throws Exception;
	public void selectPage(Criteria cri)throws Exception;
	public void selectCount()throws Exception;
	
	public List<NoticeVO> listCriteria(Criteria cri)throws Exception;
	public int listCountCriteria()throws Exception;
	
	public List<NoticeVO> listSearchCriteria(SearchCriteria cri)throws Exception;
	public int listSearchCount(SearchCriteria cri)throws Exception;
}
