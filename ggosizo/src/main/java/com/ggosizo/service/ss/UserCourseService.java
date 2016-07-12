package com.ggosizo.service.ss;

import java.util.List;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.ss.DateCourse1;
import com.ggosizo.domain.ss.DateCourse2;
import com.ggosizo.domain.ss.DateCourse3;
import com.ggosizo.domain.ss.DateCourseDTO;
import com.ggosizo.domain.yj.SearchCriteria;

public interface UserCourseService {
   public int selectCourseAllNo(String course1Str);
   public void insertDateCourse(
         DateCourse1 dateCourse1,DateCourse2 dateCourse2,DateCourse3 dateCourse3,
         int course1,int course2,int course3,String order,String title);
   public DateCourseDTO selectDateCourse(int no);
   public List<DateCourseDTO> selectCourseAll();
   
   public int selectCourseNo(int order,String name,int no);
   public DateCourse selectCourse(String name,int courseNo);
   
   public void deleteDateCourse(int no);
   public void updateDateCourse(DateCourse1 dateCourse1,DateCourse2 dateCourse2,DateCourse3 dateCourse3,
                        String order,String title,int dateCourseNo);
   
   public List<DateCourseDTO> selectId(String writer);
   public List<DateCourseDTO> selectKeyword(SearchCriteria cri);
   public int listSearchCount(SearchCriteria cri);
}