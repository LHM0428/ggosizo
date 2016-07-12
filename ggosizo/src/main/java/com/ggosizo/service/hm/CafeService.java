package com.ggosizo.service.hm;

import java.util.List;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.hm.CafeVO;
import com.ggosizo.domain.hm.SidoCriteria;
import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.SearchCriteria;

public interface CafeService {

	public void insert(CafeVO cafe)throws Exception;
	public void delete(int no)throws Exception;
	public void update(CafeVO cafe)throws Exception;
	public List<CafeVO> selectAll();
	public List<CafeVO> searchAddr(SidoCriteria cri);
	public DateCourse selectCafe(int no)throws Exception;
	public int selectCount();
	public List<CafeVO> listCriterira(SidoCriteria cri) throws Exception;
	public int searchCount(SidoCriteria cri);
	List<DateCourse> selectKeyword(SearchCriteria searchCri) throws Exception;
	List<DateCourse> selectId(String writer);
}
 