package com.ggosizo.service.yong;

import java.util.List;

import com.ggosizo.domain.yong.UserinfoDTO;
import com.ggosizo.domain.yong.UserinfoVO;

public interface UserinfoService {
	public void insertItem(UserinfoVO vo) throws Exception;

	public void deleteItem(UserinfoVO vo) throws Exception;
	
	public void updateItem(UserinfoVO vo) throws Exception;

	public List<UserinfoVO> selectAllItem() throws Exception;

	public UserinfoDTO selectItem(UserinfoDTO dto) throws Exception;

	public int selectCount() throws Exception;

	public int selectCheckId(String id) throws Exception;

	public int selectUserCheck(UserinfoVO vo) throws Exception;

	public List<UserinfoVO> selectPage(int start, int end) throws Exception;

	public String findId(UserinfoVO vo) throws Exception;
	
	public UserinfoVO selectUserIdEmailTel(UserinfoVO vo) throws Exception;
	
	public void UserLogintimeSet(UserinfoVO vo) throws Exception;
}
