package com.ggosizo.persistence.yj;

import java.util.List;

import com.ggosizo.domain.yj.NoticeVO;
import com.ggosizo.domain.yj.SearchCriteria;
import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.NoticeFileVO;

public interface NoticeDAO {
	public void insert(NoticeVO vo)throws Exception;
	public void delete(int no)throws Exception;
	public void update(NoticeVO vo)throws Exception;
	public NoticeVO select(int no)throws Exception;
	public List<NoticeVO> selectAll()throws Exception;
	public List<NoticeVO> selectPage(int page)throws Exception;
	public List<NoticeVO> selectCriteria(Criteria cri)throws Exception;
	public int countPage()throws Exception;
	
	//좋아요
	public List<NoticeVO> listSearch(SearchCriteria cri)throws Exception;
	public int listSearchCount(SearchCriteria cri)throws Exception; //��ü ���ڵ� ��
		
	//댓글 조회수
	public void updateReplyCnt(int no, int amount)throws Exception;
		
	public List<NoticeVO> testSelect()throws Exception;
		
	//글 조회수
	public void updateViewCnt(int no)throws Exception;
	
	//파일입출력
	public void addAttach (NoticeFileVO file)throws Exception;
	public int maxNo ()throws Exception;
	public NoticeFileVO getAttach (int no)throws Exception;
	public void updateAttach (NoticeFileVO file)throws Exception;
	public void deleteAttach (int no)throws Exception;
}
