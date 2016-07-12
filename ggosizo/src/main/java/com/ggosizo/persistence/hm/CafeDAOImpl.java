package com.ggosizo.persistence.hm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.hm.CafeFileVO;
import com.ggosizo.domain.hm.CafeVO;
import com.ggosizo.domain.hm.SidoCriteria;
import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.SearchCriteria;

@Repository

public class CafeDAOImpl implements CafeDAO{
	
	@Inject
	private SqlSession session;
	
	public void insert(CafeVO cafe){
		session.insert("cafe.insert",cafe);
	}
	public void delete(int no){
		session.delete("cafe.delete",no);
	}
	public void update(CafeVO cafe){
		System.out.println("DAOImpl Update VO : "+cafe);
		session.update("cafe.update", cafe);
	}
	
	public List<CafeVO> selectAll(){
		return session.selectList("cafe.selectAll");
	}//selectAll
	
	public List<CafeVO> searchAddr(SidoCriteria cri){
		RowBounds bound = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return session.selectList("cafe.searchAddr",cri, bound);
	}//searchAddr
	
	public DateCourse selectCafe(int no){
	return (CafeVO)session.selectOne("cafe.selectInfo",no);
	}
	
	public int selectCount(){
		return (int)session.selectOne("cafe.selectCount");
	}//selectCount
	
	@Override
	public List<CafeVO> listCriteria(Criteria cri) throws Exception {
		RowBounds bound = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return session.selectList("cafe.selectAll", null, bound);
	}
	
	@Override
	public int searchCount(SidoCriteria cri) {
		return session.selectOne("cafe.searchCount", cri);
	}
	@Override
	public void updateReplyCnt(int no, int amount) {
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("amount", amount);
		session.update("cafe.updateReplyCnt", map);
	}
	
	@Override
	public void updateLikeCnt(int no, int amount) {
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("amount", amount);
		session.update("cafe.updateLikeCnt", map);
	}
	@Override
	public void viewCnt(int no) {
		session.update("cafe.viewCnt", no);
	}
	@Override
	public List<DateCourse> selectKeyword(SearchCriteria searchCri) throws Exception {
		RowBounds bound = new RowBounds(searchCri.getPageStart(), searchCri.getPerPageNum());
		return session.selectList("cafe.selectKeyword", searchCri, bound);
	}
	@Override
	public int selectKeywordCount(String keyword) {
		return session.selectOne("cafe.selectKeywordCount", keyword);
	}
	@Override
	public List<DateCourse> selectID(String u_id) {
		return session.selectList("cafe.selectId", u_id);
	}
	@Override
	public void addAttach(CafeFileVO file) throws Exception {
		session.insert("cafe_file.addAttach", file);
	}
	@Override
	public int maxNo() throws Exception {
		return session.selectOne("cafe_file.maxNo");
	}
	@Override
	public CafeFileVO getAttach(int no) throws Exception {
		return session.selectOne("cafe_file.getAttach", no);
	}
	@Override
	public void updateAttach(CafeFileVO file) throws Exception {
		session.update("cafe_file.updateAttach",file);
	}
	@Override
	public void deleteAttach(int no) throws Exception {
		session.delete("cafe_file.deleteAttach", no);
	}
}
