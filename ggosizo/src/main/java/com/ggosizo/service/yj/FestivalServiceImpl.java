package com.ggosizo.service.yj;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.hm.CafeFileVO;
import com.ggosizo.domain.yj.FestivalFileVO;
import com.ggosizo.domain.yj.FestivalVO;
import com.ggosizo.domain.yj.MonthCriteria;
import com.ggosizo.persistence.yj.FestivalDAO;

@Service
public class FestivalServiceImpl implements FestivalService {
	@Inject
	private FestivalDAO dao;
	
	@Override
	public void insert(FestivalVO festival) throws Exception {
        dao.insert(festival);
        
        String files = festival.getFile();
        
        if(files == null)
        	return;
        
        FestivalFileVO file = new FestivalFileVO();
        file.setPath(files);
        file.setNo(dao.maxNo());
        
        dao.addAttach(file);
	}

	@Override
	public void delete(int no) throws Exception {
		dao.deleteAttach(no);
		dao.delete(no);
	}

	@Override
	public void update(FestivalVO festival) throws Exception {
		dao.update(festival);
		FestivalFileVO file = new FestivalFileVO();
		file = dao.getAttach(festival.getNo());
        file.setPath(festival.getFile());
        dao.updateAttach(file);
	}

	@Override
	public List<FestivalVO> selectAll() throws Exception {
		return dao.selectAll();
	}

	@Override
	public FestivalVO select(int no) throws Exception {
		FestivalVO festival = dao.select(no);
		if(dao.getAttach(no) != null){
			FestivalFileVO file = dao.getAttach(no);
			festival.setFile(file.getPath());		
		}
		dao.updateViewCnt(no);
		return dao.select(no);		
	}

	@Override
	public int selectCount() throws Exception {
		return dao.selectCount();
	}

	@Override
	public List<FestivalVO> listSearchCriteria(MonthCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(MonthCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<FestivalVO> topFestivalList(String mon) throws Exception {
		return dao.topFestivalList(mon);
	}


}
