package com.ggosizo.service.hm;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ggosizo.domain.hm.UserLikeCourseVO;
import com.ggosizo.persistence.hm.CafeDAO;
import com.ggosizo.persistence.hm.LikeDAO;
import com.ggosizo.persistence.hm.RestaurantDAO;
import com.ggosizo.persistence.ss.UserCourseDAO;
import com.ggosizo.persistence.yj.FestivalDAO;

@Service
public class LikeServiceImpl implements LikeService {

	@Inject
	LikeDAO likeDAO;
	@Inject
	UserCourseDAO userCourseDAO;
	@Inject
	CafeDAO cafeDAO; 
	@Inject
	RestaurantDAO restarauntDAO;
	@Inject
	FestivalDAO festivalDAO;
	
	private String course;
	private int no;
	@Override
	public int upLike(UserLikeCourseVO vo) throws Exception{
		int likecnt =0;
		likeDAO.insertLikeTable(vo);
		course = vo.getCourse();
		if(course==null)return likecnt;
		no=vo.getNo();
		if(course.equals("cafe")){
			cafeDAO.updateLikeCnt(no, 1);
			likecnt = cafeDAO.selectCafe(no).getLikecnt();
		}else if(course.equals("restaurant")){
			restarauntDAO.updateLikeCnt(no, 1);
			likecnt = restarauntDAO.selectRestaurant(no).getLikecnt();
		}else if(course.equals("userCourse")){
			userCourseDAO.updateLikeCnt(no, 1);
			likecnt = userCourseDAO.selectDateCourse(no).getCourse_like();
		}else if(course.equals("festival")){
			festivalDAO.updateLikeCnt(no,1);
			likecnt = festivalDAO.select(no).getLikecnt();
		}
		return likecnt;
	}

	@Override
	public int downLike(UserLikeCourseVO vo) throws Exception{
		int likecnt = 0;
		likeDAO.deleteLikeTable(vo);
		course = vo.getCourse();
		no=vo.getNo();
		if(course.equals("cafe")){
			cafeDAO.updateLikeCnt(no, -1);
			likecnt = cafeDAO.selectCafe(no).getLikecnt();
		}else if(course.equals("restaurant")){
			restarauntDAO.updateLikeCnt(no, -1);
			likecnt = restarauntDAO.selectRestaurant(no).getLikecnt();
		}else if(course.equals("userCourse")){
			userCourseDAO.updateLikeCnt(no, -1);
			likecnt = userCourseDAO.selectDateCourse(no).getCourse_like();
		}else if(course.equals("festival")){
			festivalDAO.updateLikeCnt(no, -1);
			likecnt = festivalDAO.select(no).getLikecnt();
		}
		return likecnt;
	}

	@Override
	public boolean checkLike(UserLikeCourseVO vo) {
		return likeDAO.checkLike(vo);
	}

	@Override
	public List<Object> userLikeList(String u_id) {
		List<UserLikeCourseVO> list = likeDAO.userLikeList(u_id);
		List<Object> likeList = new ArrayList<Object>();
			for(int i=0; i<list.size(); i++){
				course = list.get(i).getCourse();
				no = list.get(i).getNo();
				System.out.println(course);
				if(course!=null){
					if(course.equals("userCourse")){
						likeList.add(userCourseDAO.selectDateCourse(no));
					}else{
						if(course.equals("cafe")){
							likeList.add(cafeDAO.selectCafe(no));
						}else if(course.equals("restaurant")){
							likeList.add(restarauntDAO.selectRestaurant(no));
						}else if(course.equals("festival")){
							likeList.add(festivalDAO.select(no));
						}
					}
				}
			}
		return likeList;
	}


}
