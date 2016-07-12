package com.ggosizo.persistence.ss;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.ss.DateCourse1;
import com.ggosizo.domain.ss.DateCourse2;
import com.ggosizo.domain.ss.DateCourse3;
import com.ggosizo.domain.ss.DateCourseDTO;
import com.ggosizo.domain.yj.SearchCriteria;
@Repository
public class UserCourseDAOImpl implements UserCourseDAO {
   @Inject
   private SqlSession session;
   
   @Override
   public int selectCourseAllNo(Map<String, Object> map) {
      return session.selectOne("userCourse.selectCourseAllNo",map);
   }
   //insert
   @Override
   public void insertCourse1(DateCourse1 dateCourse1) {
      session.insert("userCourse.insertCourse1",dateCourse1);
   }
   @Override
   public void insertCourse2(DateCourse2 dateCourse2) {
      session.insert("userCourse.insertCourse2",dateCourse2);
   }
   @Override
   public void insertCourse3(DateCourse3 dateCourse3) {
      session.insert("userCourse.insertCourse3",dateCourse3);
   }
   @Override
   public void insertDateCourse(Map<String, Object> map) {
      session.insert("userCourse.insertDateCourse",map);
   }
   
   //select
   @Override
   public DateCourseDTO selectDateCourse(int no) {
      return session.selectOne("userCourse.selectDateCourse",no);
   }
   @Override
   public List<DateCourseDTO> selectCourseAll() {
      return session.selectList("userCourse.selectDateCourseAll");
   }
   @Override
   public int selectCourseNo(Map<String, Object> map) {
      return session.selectOne("userCourse.selectCourseNo",map);
   }
   @Override
   public DateCourse selectCourse(Map<String, Object> map) {
      return session.selectOne("userCourse.selectCourse",map);
   }
   
   //delete
   @Override
   public void deleteDateCourse(int no) {
      session.delete("userCourse.deleteDateCourse",no);
   }
   
   //update
   @Override
   public void updateCourse1(DateCourse1 dateCourse1) {
      session.update("userCourse.updateCourse1",dateCourse1);
   }
   @Override
   public void updateCourse2(DateCourse2 dateCourse2) {
      session.update("userCourse.updateCourse2",dateCourse2);
   }
   @Override
   public void updateCourse3(DateCourse3 dateCourse3) {
      session.update("userCourse.updateCourse3",dateCourse3);
   }
   @Override
   public void updateDateCourse(Map<String, Object> map) {
      session.update("userCourse.updateDateCourse",map);
   }
   @Override
   public List<DateCourseDTO> selectId(String writer) {
      return session.selectList("userCourse.selectId",writer);
   }
   @Override
   public List<DateCourseDTO> selectKeyword(SearchCriteria cri) {
      RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
      return session.selectList("userCourse.selectKeyword",cri, bounds);
   }
   @Override
   public int listSearchCount(SearchCriteria cri) {
      return session.selectOne("userCourse.listSearchCount", cri);
   }
   @Override
   public void viewCntAdd(int no) {
      session.update("userCourse.viewCntAdd", no);
   }
   @Override
	public void updateReplyCnt(int no, int i) {
	   Map<String, Integer> map = new HashMap<>();
	   map.put("no", no);
	   map.put("amount", i);
	   session.update("userCourse.updateReplyCnt", map);
   }
@Override
public void updateLikeCnt(int no, int i) {
	   Map<String, Integer> map = new HashMap<>();
	   map.put("no", no);
	   map.put("amount", i);
	   session.update("userCourse.updateLikeCnt", map);	
}

}