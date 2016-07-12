package com.ggosizo.controller.hm;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.jm.QnaVO;
import com.ggosizo.domain.ss.DateCourseDTO;
import com.ggosizo.domain.yj.Criteria;
import com.ggosizo.domain.yj.PageMaker;
import com.ggosizo.domain.yj.SearchCriteria;
import com.ggosizo.domain.yong.UserinfoDTO;
import com.ggosizo.domain.yong.UserinfoVO;
import com.ggosizo.persistence.hm.SidoDAOImpl;
import com.ggosizo.service.hm.CafeService;
import com.ggosizo.service.hm.LikeService;
import com.ggosizo.service.hm.MyPageService;
import com.ggosizo.service.hm.RestaurantService;
import com.ggosizo.service.ss.UserCourseService;
import com.ggosizo.service.yong.UserinfoService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Inject
	UserinfoService userService;
	@Inject
	SidoDAOImpl sidoDAO;
	@Inject
	LikeService likeService;
	@Inject
	CafeService cafeService;
	@Inject
	RestaurantService restaurantService;
	@Inject
	UserCourseService userCourseService;
	@Inject
	MyPageService myPageService;
	
	@RequestMapping("")
	public String mypage(Model model, HttpSession session) throws Exception{
		UserinfoDTO dto = new UserinfoDTO();
		
		dto.setU_id((String)session.getAttribute("login"));
		System.out.println(userService.selectItem(dto));
		model.addAttribute("user", userService.selectItem(dto));
		System.out.println(userService.selectItem(dto));
		return "/mypage/mypage";
	}
	
	@RequestMapping(value="/selecSido", method=RequestMethod.POST)
	public String selectSido(Model model, String selectSido) throws Exception{
		List<String> sido = sidoDAO.selectSido();
		model.addAttribute("sido", sido);
		model.addAttribute("selectSido", selectSido);
		return "/mypage/mypage_selsido";
	}
	
	@RequestMapping(value="/selecGugun", method=RequestMethod.POST)
	public String selectGugun(Model model, String selectGugun, String sido) throws Exception{
		List<String> gugun = sidoDAO.selectGugun(sido);
		model.addAttribute("gugun", gugun);
		model.addAttribute("selectGugun", selectGugun);
		return "/mypage/mypage_selsido";
	}
	
	@ResponseBody
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(@RequestBody UserinfoVO vo){
		String message = "";
		try {
			userService.updateItem(vo);
			message = "Your information is updated.";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	
	@RequestMapping(value="/myLikeList", method=RequestMethod.GET)
	public String myLikeList(String u_id,Model model, int page){
		List<Object> list = likeService.userLikeList(u_id);
		Criteria cri = new Criteria();
		cri.setPage(page);
		cri.setPerPageNum(10);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(list.size());
		int start = (page-1)*10;
		int end = page*10-1;
		if(list.size()>10)list = list.subList(start, end);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("u_id", u_id);
		return "/mypage/like_result";
	}
	
	@RequestMapping(value="/searchLikeCourse", method=RequestMethod.GET)
	public String searchLikeCourse(SearchCriteria searchCri, int no) throws Exception{
		String likeCourse = myPageService.searchLikeCourse(searchCri, no);
		System.out.println(likeCourse);
		return "redirect:"+likeCourse;
	}
	
	
	@RequestMapping(value="/myCourseList", method=RequestMethod.GET)
	public String myCourseList(String u_id,Model model, int page){
		List<Object> list = myPageService.myCourseList(u_id);
		Criteria cri = new Criteria();
		cri.setPage(page);
		cri.setPerPageNum(10);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println(list.size());
		pageMaker.setTotalCount(list.size());
		int start = (page-1)*10;
		int end = page*10-1;
		if(list.size()>10)list = list.subList(start, end);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("u_id", u_id);
		return "/mypage/myCourse_result";
	}
	
	@RequestMapping(value="/searchMyCourse", method=RequestMethod.GET)
	public String searchMyCourse(SearchCriteria searchCri, int no) throws Exception{
		String likeCourse = myPageService.searchMyCourse(searchCri, no);
		System.out.println(likeCourse);
		return "redirect:"+likeCourse;
	}
	@RequestMapping(value="/myQnAList", method=RequestMethod.GET)
	public String myQnAList(String u_id, Model model, int page){
		try {
			List<QnaVO> list = myPageService.myQnAList(u_id);
			Criteria cri = new Criteria();
			cri.setPage(page);
			cri.setPerPageNum(10);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			System.out.println(list.size());
			pageMaker.setTotalCount(list.size());
			int start = (page-1)*10;
			int end = page*10-1;
			if(list.size()>10)list = list.subList(start, end);
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("u_id", u_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/mypage/myQnA_result";
	}
	@RequestMapping(value="/searchMyQnA", method=RequestMethod.GET)
	public String searchMyQnA(int no) throws Exception{
		String QnACourse = "/qna/read_form?no="+no;
		return "redirect:"+QnACourse;
	}
}
