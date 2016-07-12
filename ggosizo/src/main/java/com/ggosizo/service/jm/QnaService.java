package com.ggosizo.service.jm;

import java.util.List;

import com.ggosizo.domain.jm.Criteria;
import com.ggosizo.domain.jm.QnaVO;
import com.ggosizo.domain.jm.SearchCriteria;

public interface QnaService {
   
	public void insert(QnaVO vo)throws Exception;//�Է�
	public void delete(int no)throws Exception;//�����	
	public void update(QnaVO vo)throws Exception;//������Ʈ
	public QnaVO select(int no)throws Exception;//�б�
	public List<QnaVO> selectAll()throws Exception;//��ȸ
	public void selectPage(Criteria cri)throws Exception;
	public void selectCount()throws Exception;
	
	public List<QnaVO> selectCriteria(Criteria cri)throws Exception;
	public int listCountCriteria(Criteria cri)throws Exception;
	
	public List<QnaVO> listSearchCriteria(SearchCriteria cri)throws Exception;
	public int listSearchCount(SearchCriteria cri)throws Exception;
	List<QnaVO> selectId(String writer) throws Exception;

	
	
	

	

}
