package com.ggosizo.service.jm;

import java.util.List;

import com.ggosizo.domain.jm.Criteria;
import com.ggosizo.domain.jm.QnaVO;
import com.ggosizo.domain.jm.SearchCriteria;

public interface QnaService {
   
	public void insert(QnaVO vo)throws Exception;//입력
	public void delete(int no)throws Exception;//지우기	
	public void update(QnaVO vo)throws Exception;//업데이트
	public QnaVO select(int no)throws Exception;//읽기
	public List<QnaVO> selectAll()throws Exception;//조회
	public void selectPage(Criteria cri)throws Exception;
	public void selectCount()throws Exception;
	
	public List<QnaVO> selectCriteria(Criteria cri)throws Exception;
	public int listCountCriteria(Criteria cri)throws Exception;
	
	public List<QnaVO> listSearchCriteria(SearchCriteria cri)throws Exception;
	public int listSearchCount(SearchCriteria cri)throws Exception;
	List<QnaVO> selectId(String writer) throws Exception;

	
	
	

	

}
