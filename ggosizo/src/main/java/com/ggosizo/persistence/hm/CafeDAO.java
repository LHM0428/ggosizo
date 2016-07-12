package com.ggosizo.persistence.hm;

import java.util.List;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.hm.CafeFileVO;
import com.ggosizo.domain.hm.CafeVO;
import com.ggosizo.domain.hm.RestaurantFileVO;
import com.ggosizo.domain.hm.SidoCriteria;
import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.SearchCriteria;

public interface CafeDAO {

	public void insert(CafeVO cafe);
	public void delete(int no);
	public void update(CafeVO cafe);
	public List<CafeVO> selectAll();
	public List<CafeVO> searchAddr(SidoCriteria cri);
	public DateCourse selectCafe(int no);
	public int selectCount();
	public List<CafeVO> listCriteria(Criteria cri) throws Exception;
	public int searchCount(SidoCriteria cri);
	public void updateReplyCnt(int no, int amount);
	public void updateLikeCnt(int no, int amount) throws Exception;
	public void viewCnt(int no);
	List<DateCourse> selectKeyword(SearchCriteria searchCri) throws Exception;
	public int selectKeywordCount(String keyword);
	public List<DateCourse> selectID(String u_id);
	
	//파일 입출력
	public void addAttach (CafeFileVO file)throws Exception;
	public int maxNo ()throws Exception;
	public CafeFileVO getAttach (int no)throws Exception;
	public void updateAttach (CafeFileVO file)throws Exception;
	public void deleteAttach (int no)throws Exception;
		
}
