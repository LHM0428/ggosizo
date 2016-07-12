package com.ggosizo.controller.ss;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.ss.DateCourseDTO;
import com.ggosizo.service.ss.Top10Service;

@Controller
public class Top10Controller {
	 
	@Inject
	private Top10Service service;
	
	@RequestMapping("/top10")
	public String top10(Model model)throws Exception{
		List<DateCourseDTO> top10 = service.top10();
		for(int i=0; i<top10.size(); i++)
			System.out.println(top10.get(i).getCourse_title());
		model.addAttribute("top10",top10);
		
		return "/top10/top10";
	}
	
	@RequestMapping("/top10_content")
	public String top10_content(int rank,Model model)throws Exception{
		List<DateCourseDTO> top10 = service.top10(); //top10 데이트코스 select
		System.out.println(top10);
		System.out.println(top10.get(rank-1).getCourse_order());
		String orders = top10.get(rank-1).getCourse_order(); //top10중 선택된 데이트 코스의 순서
		String[] order = orders.split("-"); 
		DateCourse course[] = new DateCourse[3];
		System.out.println("rank:"+rank);
		System.out.println("orders:"+orders);
		
		for (int i = 0; i < order.length; i++) {
			int no = service.selectCourseNo(i+1,order[i],top10.get(rank-1).getCourse_no());
			System.out.println("no:"+no);
			course[i] = service.selectCourse(order[i], no);
			System.out.println(course[i]);
		}
		model.addAttribute("places",order); //데이트코스 순서
		model.addAttribute("rank",rank); //선택한 수
		model.addAttribute("course",course); // # 배열(데이트코스1,2,3의 정보)
		
		return "/top10/top10_content";
	}
	
}
