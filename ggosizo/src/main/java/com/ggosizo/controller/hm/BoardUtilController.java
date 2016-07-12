package com.ggosizo.controller.hm;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ggosizo.domain.hm.UserLikeCourseVO;
import com.ggosizo.service.hm.CafeService;
import com.ggosizo.service.hm.LikeService;
import com.ggosizo.service.hm.RestaurantService;
import com.ggosizo.service.hm.ViewService;

@RestController
public class BoardUtilController {

	@Inject
	CafeService cafeService;
	@Inject
	RestaurantService restaurantService;
	@Inject
	LikeService likeService;
	@Inject
	ViewService viewService;
	
	@RequestMapping(value="/like/addLike", method=RequestMethod.POST)
	public ResponseEntity<String> addLike(@RequestBody UserLikeCourseVO vo){
		ResponseEntity<String> entity = null;
		try {
			int likeCnt = likeService.upLike(vo);
			entity = new ResponseEntity<String>("[ "+likeCnt+" ]", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
	@RequestMapping(value="/like/deleteLike", method=RequestMethod.POST)
	public ResponseEntity<String> deleteLike(@RequestBody UserLikeCourseVO vo){
		ResponseEntity<String> entity = null;
		try {
			int likeCnt = likeService.downLike(vo);
			entity = new ResponseEntity<String>("[ "+likeCnt+" ]", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
	@RequestMapping(value="/like/checkLike", method=RequestMethod.POST)
	public ResponseEntity<Object> checkLike(@RequestBody UserLikeCourseVO vo){
		ResponseEntity<Object> entity = null;
		boolean check = likeService.checkLike(vo);
		try {
			if(check){
				entity = new ResponseEntity<Object>(true, HttpStatus.OK);
			}else{
				entity = new ResponseEntity<Object>(false, HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<Object>(e.getMessage(), HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
	
	@RequestMapping(value="/{course}/{no}")
	public ResponseEntity<String> viewCnt(@PathVariable("course") String course, @PathVariable("no") int no){
		ResponseEntity<String> entity = null;
		int viewCnt = 0;
		try {
			viewCnt = viewService.viewCnt(course, no);
			entity = new ResponseEntity<String>(viewCnt+"", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}

}
