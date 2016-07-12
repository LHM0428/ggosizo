package com.ggosizo.controller.yong;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.HttpState;
import org.apache.http.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ggosizo.domain.hm.SidoCriteria;
import com.ggosizo.domain.ss.DateCourseDTO;
import com.ggosizo.domain.yj.EventVO;
import com.ggosizo.domain.yj.MonthCriteria;
import com.ggosizo.domain.yj.NoticeVO;
import com.ggosizo.service.ss.UserCourseService;
import com.ggosizo.service.yj.EventService;
import com.ggosizo.service.yj.NoticeService;

@Controller
public class MainController {

	@Inject
	private EventService event_service;

	@Inject
	private NoticeService notice_service;

	@Inject
	private UserCourseService top10_service;

	@RequestMapping(value = { "/", "/main" }, method = RequestMethod.GET)
	public String main(Model model, NoticeVO notice, EventVO event, DateCourseDTO top10, SidoCriteria cri,
			MonthCriteria mcri) throws Exception {

		List<NoticeVO> noticeList = notice_service.selectAll();
		List<EventVO> eventList = event_service.selectAll();
		List<DateCourseDTO> top10List = top10_service.selectCourseAll();

		model.addAttribute("notice", noticeList);
		model.addAttribute("event", eventList);
		model.addAttribute("top10", top10List);

		/*//cafe
		PageMaker cafe_maker = new PageMaker();
		cafe_maker.setCri(cri);
		cafe_maker.setTotalCount(cafe_service.searchCount(cri));//131);
		
		//festival
		PageMaker festival_maker = new PageMaker();
		cafe_maker.setCri(mcri);
		cafe_maker.setTotalCount(festival_service.listSearchCount(mcri));//131);
		maker.setTotalCount(service.selectMonthCount(month));
		
		model.addAttribute("cafe_pageMaker", cafe_maker); 
		model.addAttribute("festival_pageMaker", festival_maker); */

		return "/main/body";
	}

}
