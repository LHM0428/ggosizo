package com.ggosizo.persistence.hm;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

public interface LikeMapper {

	@Insert("insert user_like_#{u_id) values (#{course}_#{no})")
	public String insertLike(@Param("u_id") String u_id, @Param("course") String course,
			@Param("no") int no);
}
