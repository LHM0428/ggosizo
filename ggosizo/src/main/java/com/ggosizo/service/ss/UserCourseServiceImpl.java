package com.ggosizo.service.ss;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.ss.DateCourse1;
import com.ggosizo.domain.ss.DateCourse2;
import com.ggosizo.domain.ss.DateCourse3;
import com.ggosizo.domain.ss.DateCourseDTO;
import com.ggosizo.domain.yj.SearchCriteria;
import com.ggosizo.persistence.ss.UserCourseDAO;

@Service
public class UserCourseServiceImpl implements UserCourseService {

   @Inject
   private UserCourseDAO userCourseDAO;

   @Override
   public int selectCourseAllNo(String course) {
      Map<String,Object> map = new HashMap<>();
      map.put("course", course);
      
      return userCourseDAO.selectCourseAllNo(map);
   }
   
   @Transactional
   @Override
   public void insertDateCourse(DateCourse1 dateCourse1, DateCourse2 dateCourse2, DateCourse3 dateCourse3, 
         int course1,int course2, int course3, String order, String title){
      userCourseDAO.insertCourse1(dateCourse1);
      userCourseDAO.insertCourse2(dateCourse2);
      userCourseDAO.insertCourse3(dateCourse3);
      
      String[] orders = order.split("-");
      Map<String, Object> map = new HashMap<>();
         map.put("course1", orders[0]);
         map.put("course2", orders[1]);
         map.put("course3", orders[2]);
         map.put("courseNo1", course1);
         map.put("courseNo2", course2);
         map.put("courseNo3", course3);
         map.put("order", order);
         map.put("title", title);
         map.put("course_writer",dateCourse1.getWriter());
      userCourseDAO.insertDateCourse(map);
   }

   @Override
   public DateCourseDTO selectDateCourse(int no) {
      userCourseDAO.viewCntAdd(no);
      return userCourseDAO.selectDateCourse(no);
   }

   @Override
   public List<DateCourseDTO> selectCourseAll() {
      return userCourseDAO.selectCourseAll();
   }

   @Override
   public int selectCourseNo(int order, String name, int no) {
      Map<String, Object> map = new HashMap<>();
      map.put("order", order);
      map.put("name", name);
      map.put("no", no);
      return userCourseDAO.selectCourseNo(map);
   }

   @Override
   public DateCourse selectCourse(String name, int no) {
      Map<String, Object> map = new HashMap<>();
      map.put("name", name);
      map.put("no", no);
      return userCourseDAO.selectCourse(map);
   }

   @Override
   public void deleteDateCourse(int no) {
      userCourseDAO.deleteDateCourse(no);
   }
   
   @Transactional
   @Override
   public void updateDateCourse(DateCourse1 dateCourse1, DateCourse2 dateCourse2, DateCourse3 dateCourse3,
                        String order, String title,int dateCourseNo) {
      System.out.println("###ServiceImpl###");
      System.out.println("����Ʈ�ڽ�1 ��ȣ:"+dateCourse1.getNo());
      System.out.println("����Ʈ�ڽ�2 ��ȣ:"+dateCourse2.getNo2());
      System.out.println("����Ʈ�ڽ�3 ��ȣ:"+dateCourse3.getNo3());
      
      
      userCourseDAO.updateCourse1(dateCourse1);
      userCourseDAO.updateCourse2(dateCourse2);
      userCourseDAO.updateCourse3(dateCourse3);
      System.out.println("개별코스 업데이트 성공");
      
      String[] orders = order.split("-");
      Map<String, Object> map = new HashMap<>();
//         map.put("course1", orders[0]);
//         map.put("course2", orders[1]);
//         map.put("course3", orders[2]);
//         map.put("courseNo1", dateCourse1.getNo());
//         map.put("courseNo2", dateCourse2.getNo2());
//         map.put("courseNo3", dateCourse3.getNo3());
//         map.put("order", order);
         map.put("dateCourseNo", dateCourseNo); //����Ʈ�ڽ� ��ȣ
         map.put("title", title); //����Ʈ�ڽ� ����
         
      userCourseDAO.updateDateCourse(map);
   }

   @Override
   public List<DateCourseDTO> selectId(String writer) {
      return userCourseDAO.selectId(writer);
   }

   @Override
   public List<DateCourseDTO> selectKeyword(SearchCriteria cri) {
      return userCourseDAO.selectKeyword(cri);
   }

   @Override
   public int listSearchCount(SearchCriteria cri) {
      return userCourseDAO.listSearchCount(cri);
   }


}