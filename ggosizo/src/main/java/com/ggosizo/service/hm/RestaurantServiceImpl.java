package com.ggosizo.service.hm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.hm.RestaurantFileVO;
import com.ggosizo.domain.hm.RestaurantVO;
import com.ggosizo.domain.hm.SidoCriteria;
import com.ggosizo.domain.yj.NoticeFileVO;
import com.ggosizo.domain.yj.SearchCriteria;
import com.ggosizo.persistence.hm.RestaurantDAO;
@Service
public class RestaurantServiceImpl implements RestaurantService {

	@Inject
	RestaurantDAO dao;
	@Override
	public void insert(RestaurantVO vo) throws Exception{
		dao.insert(vo);
		
		String files = vo.getFile();
        
        if(files == null)
        	return;
        
        RestaurantFileVO file = new RestaurantFileVO();
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
	public void update(RestaurantVO vo) throws Exception{
		dao.update(vo);
		RestaurantFileVO file = new RestaurantFileVO();
		file = dao.getAttach(vo.getNo());
        file.setPath(vo.getFile());
        dao.updateAttach(file);
	}

	@Override
	public List<RestaurantVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<RestaurantVO> searchAddr(SidoCriteria cri) {
		return dao.searchAddr(cri);
	}

	@Override
	public int selectCount() {
		return dao.selectCount();
	}

	@Override
	public DateCourse selectRestaurant(int no) throws Exception{
		DateCourse restaurant = dao.selectRestaurant(no);
			if(dao.getAttach(no) != null){
				RestaurantFileVO file = dao.getAttach(no);
				restaurant.setFile(file.getPath());		
			}
		return dao.selectRestaurant(no);
	}

	@Override
	public int searchCount(SidoCriteria cri) {
		return dao.searchCount(cri);
	}

	@Override
	public int updateLikeCnt(int no, int amount) throws Exception{
		dao.updateReplyCnt(no, amount);
		return dao.selectRestaurant(no).getLikecnt();
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
