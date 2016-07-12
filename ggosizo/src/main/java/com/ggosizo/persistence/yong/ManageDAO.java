package com.ggosizo.persistence.yong;

import com.ggosizo.domain.yong.ManageVO;
import com.ggosizo.domain.yong.UserinfoVO;

public interface ManageDAO {

		public int manageCheck(ManageVO vo) throws Exception;
		public void deleteItem(UserinfoVO vo) throws Exception;
		
		
}

/*public int manageCheck(String id, String pass) {
	int cnt=0;
	Map<String, String> map = new HashMap<>();
	map.put("id", id);
	map.put("pass", pass);
	System.out.println("dao" + id);
	System.out.println("dao" + pass);
	   try {
		  cnt= (int) smc.queryForObject("userinfo.manageCheck",map);
//		  cnt= (int) smc.queryForObject("userinfo.manageCheck",id,pass);
		  System.out.println("dao" + cnt);
	   } catch (SQLException e) {
		   e.printStackTrace();
	   }
	   return cnt;
}*/