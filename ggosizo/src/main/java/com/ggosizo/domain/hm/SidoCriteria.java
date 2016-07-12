package com.ggosizo.domain.hm;

import com.ggosizo.domain.yj.Criteria;

public class SidoCriteria extends Criteria{

	private String criGugun;
	private String criDong;
	
	public String getCriGugun() {
		return criGugun;
	}

	public void setCriGugun(String criGugun) {
		this.criGugun = criGugun;
	}

	public String getCriDong() {
		return criDong;
	}

	public void setCriDong(String criDong) {
		this.criDong = criDong;
	}

	@Override
	public String toString() {
		return "SidoCriteria [criGugun=" + criGugun + ", criDong=" + criDong + "]";
	}
	
}
