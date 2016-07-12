package com.ggosizo.persistence.yj;

import java.util.List;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.FestivalFileVO;
import com.ggosizo.domain.yj.FestivalVO;
import com.ggosizo.domain.yj.MonthCriteria;

public interface FestivalDAO {
	public void insert(FestivalVO festival);
	public void delete(int no);
	public void update(FestivalVO festival);
	public List<FestivalVO> selectAll();
	public FestivalVO select(int no);
	public int selectCount();
	public List<FestivalVO> listCriteria(Criteria cri) throws Exception;
	public List<FestivalVO> listSearch(MonthCriteria cri)throws Exception;
	public int listSearchCount(MonthCriteria cri)throws Exception; 
	public List<FestivalVO> topFestivalList(String mon)throws Exception;
	
	//파일입출력
		public void addAttach (FestivalFileVO file)throws Exception;
		public int maxNo ()throws Exception;
		public FestivalFileVO getAttach (int no)throws Exception;
		public void updateAttach (FestivalFileVO file)throws Exception;
		public void deleteAttach (int no)throws Exception;
		
	//댓글 조회수
		public void updateReplyCnt(int no, int amount)throws Exception;
			
	//글 조회수
		public void updateViewCnt(int no)throws Exception;
		
	//좋아요
		public void updateLikeCnt(int no, int i);
			
}
