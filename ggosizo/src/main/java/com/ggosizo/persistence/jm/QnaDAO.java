package com.ggosizo.persistence.jm;

import java.util.List;

import com.ggosizo.domain.jm.Criteria;
import com.ggosizo.domain.jm.QnaVO;
import com.ggosizo.domain.jm.SearchCriteria;




public interface QnaDAO {
  public void insert(QnaVO vo)throws Exception;//글쓰기
  public void delete(int no)throws Exception;//삭제;
  public void update(QnaVO vo)throws Exception;//수정
  public QnaVO select(int no)throws Exception;//읽기
  public List<QnaVO> selectAll()throws Exception;//전체목록
  
  public List<QnaVO> selectPage(int page)throws Exception;
  public List<QnaVO> selectId(String writer)throws Exception;
  public List<QnaVO> selectCriteria(Criteria cri)throws Exception;
  public int countPaging(Criteria cri)throws Exception;
  
    //검색어와 일치(like)하는 행을 조회
	public List<QnaVO> listSearch(SearchCriteria cri)throws Exception;
		
	//검색어와 일치(like)하는 행의 전체 수
	public int listSearchCount(SearchCriteria cri)throws Exception; //전체 레코드 수
		
    //조회수 
	public int updateViewCnt(int no)throws Exception;

	//댓글의 수를 카운트
	public void updateReplyCnt(int no, int amount)throws Exception;
  

  
	

}
