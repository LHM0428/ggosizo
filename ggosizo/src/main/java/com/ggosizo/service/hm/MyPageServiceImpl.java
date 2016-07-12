package com.ggosizo.service.hm;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.jm.QnaVO;
import com.ggosizo.domain.ss.DateCourseDTO;
import com.ggosizo.domain.yj.SearchCriteria;
import com.ggosizo.persistence.hm.CafeDAO;
import com.ggosizo.persistence.hm.RestaurantDAO;
import com.ggosizo.persistence.jm.QnaDAO;
import com.ggosizo.service.ss.UserCourseService;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Inject
	UserCourseService userCourseService;
	@Inject
	CafeDAO cafeDAO; 
	@Inject
	RestaurantDAO restaurantDAO;
	@Inject
	QnaDAO qnaDAO;
	
	@Override
	public String searchLikeCourse(SearchCriteria searchCri, int no) {
		String keyword = searchCri.getKeyword();
		String likeCourse = "";
		try {
			if(cafeDAO.selectKeyword(searchCri).size()>0){
				likeCourse = "/cafe/searchList?keyword="+keyword;
			}else if(restaurantDAO.selectKeyword(searchCri).size()>0){
				likeCourse = "/restaurant/searchList?keyword="+keyword;
			}else if(userCourseService.selectCourse(searchCri.getKeyword(), no)!=null){
				//userCourse 페이지로 이동
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		likeCourse = likeCourse.replaceAll("\\s", "%20");
		return likeCourse;
	}

	@Override
	public String searchMyCourse(SearchCriteria searchCri, int no) {
		String keyword = searchCri.getKeyword();
		String myCourse = "";
		try {
			if(cafeDAO.selectKeyword(searchCri).size()>0){
				myCourse = "/cafe/searchList?writer="+keyword;
			}else if(restaurantDAO.selectKeyword(searchCri).size()>0){
				myCourse = "/restaurant/searchList?writer="+keyword;
			}else if(userCourseService.selectCourse(searchCri.getKeyword(), no)!=null){
				//userCourse 페이지로 이동
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		myCourse = myCourse.replaceAll("\\s", "%20");
		return myCourse;
	}

	@Override
	public List<Object> myCourseList(String u_id) {
		List<Object> list = new ArrayList<Object>();
		list.addAll(cafeDAO.selectID(u_id));
		list.addAll(restaurantDAO.selectID(u_id));
		list.addAll(userCourseService.selectId(u_id));
		for(int j=0; j<list.size(); j++){
			for(int i=0; i<list.size()-1; i++){
				int a = orderList(list.get(i),list.get(i+1));
				if(a>0){
					Object oldOb = list.get(i);
					list.set(i, list.get(i+1));
					list.set(i+1, oldOb);
				}
			}
		}
		return list;
	}
	
	public List<QnaVO> myQnAList(String writer) throws Exception{
		return qnaDAO.selectId(writer);
	}
	
	public int orderList(Object o1, Object o2){
		String[] o1Arr = o1.getClass().getTypeName().split("\\.");
		String o1Class = o1Arr[o1Arr.length-1];
		String[] o2Arr = o2.getClass().getTypeName().split("\\.");
		String o2Class = o2Arr[o2Arr.length-1];
		if(o1Class.equals("DateCourseDTO")
				&&o2Class.equals("DateCourseDTO")){
			return ((DateCourseDTO)o1).getCourse_regdate().compareTo(((DateCourseDTO)o2).getCourse_regdate());
		}else if(o1Class.equals("DateCourseDTO")
				&&o2Class.equals("DateCourse")){
			return ((DateCourseDTO)o1).getCourse_regdate().compareTo(((DateCourse)o2).getRegdate());
		}else if(o2Class.equals("DateCourseDTO")
				&&o1Class.equals("DateCourse")){
			return ((DateCourseDTO)o2).getCourse_regdate().compareTo(((DateCourse)o1).getRegdate());
		}else{
			return  ((DateCourse)o2).getRegdate().compareTo(((DateCourse)o1).getRegdate());
		}
	}


}
