package com.ggosizo.service.yj;

import java.util.List;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.FestivalVO;
import com.ggosizo.domain.yj.MonthCriteria;
import com.ggosizo.domain.yj.SearchCriteria;

public interface FestivalService {
	public void insert(FestivalVO festival)throws Exception ;
	public void delete(int no)throws Exception ;
	public void update(FestivalVO festival)throws Exception ;
	public List<FestivalVO> selectAll()throws Exception ;
	public FestivalVO select(int no)throws Exception ;
	public int selectCount()throws Exception ;
	
	public List<FestivalVO> listSearchCriteria(MonthCriteria cri)throws Exception;
	public int listSearchCount(MonthCriteria cri)throws Exception;
	
	public List<FestivalVO> topFestivalList(String mon)throws Exception;
}
