package com.ggosizo.persistence.yj;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.FestivalFileVO;
import com.ggosizo.domain.yj.FestivalVO;
import com.ggosizo.domain.yj.MonthCriteria;

@Repository
public class FestivalDAOImpl implements FestivalDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public void insert(FestivalVO festival) {
		session.insert("festival.insert", festival);
	}

	@Override
	public void delete(int no) {
		session.delete("festival.delete",no);
	}

	@Override
	public void update(FestivalVO festival) {
		session.update("festival.update", festival);
		
	}

	@Override
	public List<FestivalVO> selectAll() {
		return session.selectList("festival.selectAll");
	}

	@Override
	public FestivalVO select(int no) {
		return session.selectOne("festival.select", no);
	}

	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<FestivalVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FestivalVO> listSearch(MonthCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		String month='%'+cri.getMonth()+'%';
		cri.setMonth(month);
		return session.selectList("festival.listSearch", cri, bounds);
	}

	@Override
	public int listSearchCount(MonthCriteria cri) throws Exception {
		String month='%'+cri.getMonth()+'%';
		cri.setMonth(month);
		return session.selectOne("festival.listSearchCount", cri);
	}

	@Override
	public List<FestivalVO> topFestivalList(String mon) throws Exception {
		String month='%'+mon+'%';
		return session.selectList("festival.topFestival", month);
	}

	@Override
	public void addAttach(FestivalFileVO file) throws Exception {
		session.insert("festival_file.addAttach",file);
	}

	@Override
	public int maxNo() throws Exception {
		return session.selectOne("festival_file.maxNo");
	}

	@Override
	public FestivalFileVO getAttach(int no) throws Exception {
		return session.selectOne("festival_file.getAttach", no);
	}

	@Override
	public void updateAttach(FestivalFileVO file) throws Exception {
		session.update("festival_file.updateAttach",file);
	}

	@Override
	public void deleteAttach(int no) throws Exception {
		session.delete("festival_file.deleteAttach", no);
	}

	@Override
	public void updateReplyCnt(int no, int amount) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("no", no);
		map.put("amount", amount);
		session.update("festival.updateReplyCnt", map);
	}

	@Override
	public void updateViewCnt(int no) throws Exception {
		session.update("festival.updateViewCnt",no);
	}

	@Override
	public void updateLikeCnt(int no, int i) {
		Map<String, Integer> map = new HashMap<>();
		map.put("no", no);
		map.put("amount", i);
		session.update("festival.updateLikeCnt", map);
	}

}
