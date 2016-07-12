package com.ggosizo.persistence.hm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.hm.RestaurantFileVO;
import com.ggosizo.domain.hm.RestaurantVO;
import com.ggosizo.domain.hm.SidoCriteria;
import com.ggosizo.domain.yj.SearchCriteria;

@Repository
public class RestaurantDAOImpl implements RestaurantDAO {

	@Inject
	SqlSession session;
	
	@Override
	public void insert(RestaurantVO vo) {
		session.insert("restaurant.insert", vo);
	}

	@Override
	public void delete(int no) {
		session.delete("restaurant.delete", no);
	}

	@Override
	public void update(RestaurantVO vo) {
		System.out.println(vo);
		session.update("restaurant.update", vo);
	}

	@Override
	public List<RestaurantVO> selectAll() {
		return session.selectList("restaurant.selectAll");
	}

	@Override
	public List<RestaurantVO> searchAddr(SidoCriteria cri) {
		RowBounds bound = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return session.selectList("restaurant.searchAddr",cri, bound);
	}

	@Override
	public int searchCount(SidoCriteria cri) {
		return session.selectOne("restaurant.searchCount", cri);
	}

	@Override
	public DateCourse selectRestaurant(int no) {
		return (RestaurantVO)session.selectOne("restaurant.selectRestaurant", no);
	}

	@Override
	public int selectCount() {
		return session.selectOne("restaurant.selectCount");
	}
	@Override
	public void updateReplyCnt(int no, int amount) {
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("amount", amount);
		session.update("restaurant.updateReplyCnt", map);
	}

	@Override
	public void updateLikeCnt(int no, int amount) {
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("amount", amount);
		session.update("restaurant.updateLikeCnt", map);
	}

	@Override
	public void viewCnt(int no) {
		session.update("restaurant.viewCnt", no);
	}

	@Override
	public List<DateCourse> selectKeyword(SearchCriteria searchCri) throws Exception {
		RowBounds bound = new RowBounds(searchCri.getPageStart(), searchCri.getPerPageNum());
		return session.selectList("restaurant.selectKeyword", searchCri, bound);
	}
	@Override
	public int selectKeywordCount(String keyword) {
		return session.selectOne("restaurant.selectKeywordCount", keyword);
	}

	@Override
	public List<DateCourse> selectID(String u_id) {
		return session.selectList("restaurant.selectId",u_id);
	}

	@Override
	public void addAttach(RestaurantFileVO file) throws Exception {
		session.insert("restaurant_file.addAttach", file);
	}

	@Override
	public int maxNo() throws Exception {
		return session.selectOne("restaurant_file.maxNo");
	}

	@Override
	public RestaurantFileVO getAttach(int no) throws Exception {
		return session.selectOne("restaurant_file.getAttach", no);
	}

	@Override
	public void updateAttach(RestaurantFileVO file) throws Exception {
		session.update("restaurant_file.updateAttach",file);
	}

	@Override
	public void deleteAttach(int no) throws Exception {
		session.delete("restaurant_file.deleteAttach", no);
	}
}
