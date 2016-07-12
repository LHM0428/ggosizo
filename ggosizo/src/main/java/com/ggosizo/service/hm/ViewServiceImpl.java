package com.ggosizo.service.hm;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ggosizo.persistence.hm.CafeDAO;
import com.ggosizo.persistence.hm.RestaurantDAO;

@Service
public class ViewServiceImpl implements ViewService {
	
	@Inject
	CafeDAO cafeDAO;
	@Inject
	RestaurantDAO restaurantDAO;

	@Override
	public int viewCnt(String course, int no) throws Exception{
		int viewCnt = 0;
		if(course.equals("cafe")){
			cafeDAO.viewCnt(no);
			viewCnt = cafeDAO.selectCafe(no).getViewcnt();
		}else if(course.equals("restaurant")){
			restaurantDAO.viewCnt(no);
			viewCnt = restaurantDAO.selectRestaurant(no).getViewcnt();
		}
		return viewCnt;
	}

}
