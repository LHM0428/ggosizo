package com.ggosizo.persistence.yong;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ggosizo.domain.yong.ManageAdvVO;

public interface ManageAdvDAO {
	
	@Select("select sysdate from dual")
	public String getTime();
	
	@Select("select * from manage_adv where name=#{name}")
	public ManageAdvVO selectAdvVO(@Param("name") String name);

	@Insert("insert into manage_adv values(#{name},#{viewcnt},#{price},#{url_name},#{file_name},#{max_viewcnt}")
	public String insertAdvVO(@Param("name") String name, @Param("viewcnt") String viewcnt,
			@Param("price") String price, @Param("url_name") String url_name,
			@Param("file_name") String file_name, @Param("max_viewcnt") String max_viewcnt);

	@Update("update manage_adv set viewcnt=#{viewcnt}")
	public void updateAdvView(@Param("viewcnt") int viewcnt);

	@Update("update manage_adv set" + " name=#{name}," + " viewcnt=#{viewcnt}," + " price=#{price},"
			+ " url_name=#{url_name}," + " file_name=#{file_name}, " + "max_viewcnt=#{max_viewcnt}")
	public void updateAdvVO(@Param("name") String name, @Param("viewcnt") String viewcnt,
			@Param("price") String price, @Param("url_name") String url_name,
			@Param("file_name") String file_name, @Param("max_viewcnt") String max_viewcnt);

	public void insertAdvVO(String name, int viewcnt, int price, String url_name, String file_name,
			int max_viewcnt);

	public void updateAdvVO(String name, int viewcnt, int price, String url_name, String file_name,
			int max_viewcnt);
	
}
