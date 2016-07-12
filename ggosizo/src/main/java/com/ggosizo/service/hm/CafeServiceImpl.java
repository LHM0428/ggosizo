package com.ggosizo.service.hm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.hm.CafeFileVO;
import com.ggosizo.domain.hm.CafeVO;
import com.ggosizo.domain.hm.SidoCriteria;
import com.ggosizo.domain.yj.SearchCriteria;
import com.ggosizo.persistence.hm.CafeDAO;

@Service
public class CafeServiceImpl implements CafeService {
	
	@Inject
	private CafeDAO dao;
	
	@Override
	public void insert(CafeVO cafe) throws Exception{
		dao.insert(cafe);
		
		String files = cafe.getFile();
        
        if(files == null)
        	return;
        
        CafeFileVO file = new CafeFileVO();
        file.setPath(files);
        file.setNo(dao.maxNo());
        
        dao.addAttach(file);
	}

	@Override
	public void delete(int no) throws Exception{
		dao.deleteAttach(no);
		dao.delete(no);
	}

	@Override
	public void update(CafeVO cafe) throws Exception{
		dao.update(cafe);
		CafeFileVO file = new CafeFileVO();
		file = dao.getAttach(cafe.getNo());
        file.setPath(cafe.getFile());
        dao.updateAttach(file);
	}

	@Override
	public List<CafeVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<CafeVO> searchAddr(SidoCriteria cri) {
		return dao.searchAddr(cri);
	}

	@Override
	public DateCourse selectCafe(int ca_no) throws Exception{
		DateCourse cafe = dao.selectCafe(ca_no);
		if(dao.getAttach(ca_no) != null){
			CafeFileVO file = dao.getAttach(ca_no);
			cafe.setFile(file.getPath());		
		}
		
		return dao.selectCafe(ca_no);
	}

	@Override
	public int selectCount() {
		return dao.selectCount();
	}

	@Override
	public List<CafeVO> listCriterira(SidoCriteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	public int searchCount(SidoCriteria cri) {
		return dao.searchCount(cri);
	}

	@Override
	public List<DateCourse> selectKeyword(SearchCriteria searchCri) throws Exception {
		return dao.selectKeyword(searchCri);
	}

	public int searchKewordCount(String keyword) {
		return dao.selectKeywordCount(keyword);
	}

	public List<DateCourse> selectId(String writer) {
		return dao.selectID(writer);
	}

}
