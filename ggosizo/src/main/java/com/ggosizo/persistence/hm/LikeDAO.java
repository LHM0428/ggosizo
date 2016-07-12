package com.ggosizo.persistence.hm;

import java.util.List;

import com.ggosizo.domain.hm.UserLikeCourseVO;

public interface LikeDAO {
	void deleteLikeTable(UserLikeCourseVO vo);
	void insertLikeTable(UserLikeCourseVO vo);
	boolean checkLike(UserLikeCourseVO vo);
	List<UserLikeCourseVO> userLikeList(String u_id);
}
