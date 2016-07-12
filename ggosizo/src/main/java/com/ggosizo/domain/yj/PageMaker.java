package com.ggosizo.domain.yj;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.ggosizo.domain.hm.SidoCriteria;

public class PageMaker {
   private int totalCount;
   private int startPage;
   private int endPage;
   private boolean prev;
   private boolean next;
   
   private int displayPageNum=10;
   private Criteria cri;
   
public int getTotalCount() {
	return totalCount;
}
public void setTotalCount(int totalCount) {
	this.totalCount = totalCount;
	calcData();
}

   private void calcData(){
	 endPage= (int)(Math.ceil(cri.getPage()/(double)displayPageNum)
			 *displayPageNum);
	 //10
	 
     startPage = (endPage - displayPageNum) + 1; 
     //1
     
     int tempEndPage = 
    	(int)(Math.ceil(totalCount/(double) cri.getPerPageNum()));
     //9
     
     if(endPage> tempEndPage) endPage = tempEndPage;
     prev = startPage==1 ? false:true;
     next = endPage * cri.getPerPageNum() >= totalCount ? false :true;
   }//calcData

   public String makeQuery(int page){
	   UriComponents uriComponents =
			UriComponentsBuilder.newInstance()
			.queryParam("page", page)
			.queryParam("perPageNum",cri.getPerPageNum())
			.build();
	   return uriComponents.toUriString();
   }//makeQuery
   
   public String makeSearch(int page){
	   UriComponents uriComponents =
			   UriComponentsBuilder.newInstance()
			   .queryParam("page", page)
			   .queryParam("perPageNum",cri.getPerPageNum())
	   //?searchType=Ÿ��Ʋ
			   .queryParam("searchType", ((SearchCriteria)cri).getSearchType())
			   .queryParam("keyword", ((SearchCriteria)cri).getKeyword())
			   .build();
	   return uriComponents.toUriString();
   }//makeSearch
   
   public String makeMonthSearch(int page){
	   UriComponents uriComponents = null;
	   if(((MonthCriteria)cri).getMonth()!=null){
		   uriComponents =
				   UriComponentsBuilder.newInstance()
				   .queryParam("page", page)
				   .queryParam("perPageNum",cri.getPerPageNum())
		   //?month
				   .queryParam("month", ((MonthCriteria)cri).getMonth())
				   .build();
	   }else{
		   uriComponents =
				   UriComponentsBuilder.newInstance()
				   .queryParam("page", page)
				   .queryParam("perPageNum",cri.getPerPageNum())
				   .build();
	   }
	   return uriComponents.toUriString();	   
   }//makeSearch
   
   public String makeSidoSearch(int page){
	   UriComponents uriComponents = null;
	   if(((SidoCriteria)cri).getCriGugun()!=null){
		   uriComponents =
				   UriComponentsBuilder.newInstance()
				   .queryParam("page", page)
				   .queryParam("perPageNum",cri.getPerPageNum())
				   .queryParam("gugun", ((SidoCriteria)cri).getCriGugun())
				   .queryParam("dong", ((SidoCriteria)cri).getCriDong())
				   .build();
	   }else{
		   uriComponents =
				   UriComponentsBuilder.newInstance()
				   .queryParam("page", page)
				   .queryParam("perPageNum",cri.getPerPageNum())
				   .build();
	   }
	   return uriComponents.toUriString();
   }//makeSearch


public int getStartPage() {
	return startPage;
}
public void setStartPage(int startPage) {
	this.startPage = startPage;
}
public int getEndPage() {
	return endPage;
}
public void setEndPage(int endPage) {
	this.endPage = endPage;
}
public boolean isPrev() {
	return prev;
}
public void setPrev(boolean prev) {
	this.prev = prev;
}
public boolean isNext() {
	return next;
}
public void setNext(boolean next) {
	this.next = next;
}
public int getDisplayPageNum() {
	return displayPageNum;
}
public void setDisplayPageNum(int displayPageNum) {
	this.displayPageNum = displayPageNum;
}
public Criteria getCri() {
	return cri;
}
public void setCri(Criteria cri) {
	this.cri = cri;
}
   
   
}
