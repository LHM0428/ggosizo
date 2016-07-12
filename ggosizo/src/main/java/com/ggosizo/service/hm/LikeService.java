package com.ggosizo.service.hm;

import java.util.List;

import com.ggosizo.domain.hm.UserLikeCourseVO;

public interface LikeService {
	int downLike(UserLikeCourseVO vo) throws Exception;
	int upLike(UserLikeCourseVO vo) throws Exception;
	boolean checkLike(UserLikeCourseVO vo);
	List<Object> userLikeList(String u_id);
}
