package com.ggosizo.service.yong;

import com.ggosizo.domain.yong.ManageVO;
import com.ggosizo.domain.yong.UserinfoVO;

public interface ManageService {
	public int manageCheck(ManageVO vo) throws Exception;
	public void deleteItem(UserinfoVO vo) throws Exception;
}
