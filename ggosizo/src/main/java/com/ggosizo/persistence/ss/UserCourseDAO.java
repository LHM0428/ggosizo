package com.ggosizo.persistence.ss;

import java.util.List;
import java.util.Map;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.ss.DateCourse1;
import com.ggosizo.domain.ss.DateCourse2;
import com.ggosizo.domain.ss.DateCourse3;
import com.ggosizo.domain.ss.DateCourseDTO;
import com.ggosizo.domain.yj.SearchCriteria;

public interface UserCourseDAO {
   public int selectCourseAllNo(Map<String, Object> map);
   //insert
   public void insertCourse1(DateCourse1 dateCourse1);
   public void insertCourse2(DateCourse2 dateCourse2);
   public void insertCourse3(DateCourse3 dateCourse3);
   public void insertDateCourse(Map<String, Object> map);
   
   //select
   public DateCourseDTO selectDateCourse(int no);
   public List<DateCourseDTO> selectCourseAll();
   
   public int selectCourseNo(Map<String, Object> map);
   DateCourse selectCourse(Map<String, Object> map);
   
   //delete
   public void deleteDateCourse(int no);
   //update
   public void updateCourse1(DateCourse1 dateCourse1);
   public void updateCourse2(DateCourse2 dateCourse2);
   public void updateCourse3(DateCourse3 dateCourse3);
   public void updateDateCourse(Map<String, Object> map);

   public List<DateCourseDTO> selectId(String writer);
   public List<DateCourseDTO> selectKeyword(SearchCriteria cri);
   public int listSearchCount(SearchCriteria cri);
   void viewCntAdd(int no);
   void updateReplyCnt(int no, int i);
   void updateLikeCnt(int no, int i);
}