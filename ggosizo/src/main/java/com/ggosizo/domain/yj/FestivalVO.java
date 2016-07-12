package com.ggosizo.domain.yj;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.ggosizo.domain.DateCourse;

public class FestivalVO extends DateCourse{
	
	public FestivalVO() {
	}

	public FestivalVO(int no, String name, String addr, String si, String gugun, String dong, String coming, String tel,
			String url, String img, String openhour, String closeday, String startdate, String enddate, String category,
			String price, String content, String writer, int viewcnt, int replycnt, int likecnt, Date regdate,
			String file) {
		super(no, name, addr, si, gugun, dong, coming, tel, url, img, openhour, closeday, startdate, enddate, category, price,
				content, writer, viewcnt, replycnt, likecnt, regdate, file);
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "FestivalVO [toString()=" + super.toString() + ", getNo()=" + getNo() + ", getName()=" + getName()
				+ ", getAddr()=" + getAddr() + ", getSi()=" + getSi() + ", getGugun()=" + getGugun() + ", getDong()="
				+ getDong() + ", getComing()=" + getComing() + ", getTel()=" + getTel() + ", getUrl()=" + getUrl()
				+ ", getImg()=" + getImg() + ", getOpenhour()=" + getOpenhour() + ", getCloseday()=" + getCloseday()
				+ ", getStartdate()=" + getStartdate() + ", getEnddate()=" + getEnddate() + ", getCategory()="
				+ getCategory() + ", getPrice()=" + getPrice() + ", getContent()=" + getContent() + ", getWriter()="
				+ getWriter() + ", getViewcnt()=" + getViewcnt() + ", getReplycnt()=" + getReplycnt()
				+ ", getLikecnt()=" + getLikecnt() + ", getRegdate()=" + getRegdate() + ", getFile()=" + getFile()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
}
