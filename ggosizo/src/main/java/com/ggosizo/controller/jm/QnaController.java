package com.ggosizo.controller.jm;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ggosizo.domain.jm.PageMaker;
import com.ggosizo.domain.jm.QnaVO;
import com.ggosizo.domain.jm.SearchCriteria;
import com.ggosizo.service.jm.QnaService;


@Controller
@RequestMapping("/qna")
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Inject
	private QnaService service;

	// @RequestMapping(value = "/qna")
	// public String selectAll(Model model) throws Exception {
	// model.addAttribute("list", service.selectAll());
	// logger.info("selectAll");
	// return "/qna/qna";
	// }

	// @RequestMapping(value = "/qnaCri")
	// public String listAll(Criteria cri, Model model) throws Exception {
	// logger.info("listCri.....GET" + model);
	// model.addAttribute("list", service.listCriteria(cri));
	// return "/qna/qnaCri";
	//
	// }
	@RequestMapping(value = "/qnaPage", method = RequestMethod.GET)
	public String listPageGET(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpSession session) throws Exception {
		logger.info("특占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙청" + cri);
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pagemaker = new PageMaker();
		pagemaker.setCri(cri);
		pagemaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker", pagemaker);
		model.addAttribute("id",session.getAttribute("login"));
		return "/qna/qnaPage";
	}

	@RequestMapping(value = "/input_form", method = RequestMethod.GET)
	public String insertGET(Model model, HttpSession session,@ModelAttribute("cri") SearchCriteria cri) throws Exception {
		logger.info("insert GET....");
			model.addAttribute("u_id", session.getAttribute("login"));
		return "/qna/input_form";
	}

	@RequestMapping(value = "/input_form", method = RequestMethod.POST)
	public String insertPOST(QnaVO vo, Model model, RedirectAttributes attr) throws Exception {
		logger.info("insert POST....");
		System.out.println("占쏙옙占쏙옙占� post 占쌉억옙占�");
		System.out.println(vo.toString());
		service.insert(vo);
		attr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/qna/qnaPage";
	}

	@RequestMapping(value = "/read_form", method = RequestMethod.GET) // 특占쏙옙占쌉시뱄옙
																		// 占싻깍옙
	public String read(@RequestParam("no") int no, Model model,HttpSession session ,@ModelAttribute("cri") SearchCriteria cri)
			throws Exception {
		logger.info("占쌉시뱄옙 占싻깍옙...[" + no + "]" + cri.getPage());

		model.addAttribute("qna", service.select(no));
		model.addAttribute("u_id", session.getAttribute("login"));
		return "/qna/read_form";
	}

	@RequestMapping(value = "/update_form", method = RequestMethod.GET)
	public String updateGET(QnaVO vo, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {// 占쏙옙占쏙옙占쏙옙
																												// 占쏙옙占싱깍옙
		logger.info("占쌉시뱄옙 占쏙옙占쏙옙占쏙옙...[" + vo.getQna_no() + "]");
		System.out.println("占쏙옙호:" + vo.getQna_no());
		model.addAttribute("qna", vo);
		return "/qna/update_form";

	}

	@RequestMapping(value = "/update_form", method = RequestMethod.POST)
	public String updatePOST(QnaVO vo, SearchCriteria cri, RedirectAttributes attr) throws Exception {// 占쏙옙占쏙옙처占쏙옙(DB)
		service.update(vo);
		System.out.println(cri.getPage());
		System.out.println(cri.getPerPageNum());
		logger.info("占쌉시뱄옙 占쏙옙占쏙옙처占쏙옙...[" + vo.getQna_no() + "]");
		System.out.println("占쌉시뱄옙 占쏙옙占쏙옙처占쏙옙...[" + vo.getQna_no() + "]");
		logger.info("占쌉시뱄옙 占쏙옙占쏙옙처占쏙옙[타占쏙옙틀]...[" + vo.getQna_title() + "]");
		attr.addAttribute("page", cri.getPage());
		attr.addAttribute("perPageNum", cri.getPerPageNum());
		attr.addAttribute("searchType", cri.getSearchType());
		attr.addAttribute("keyword", cri.getKeyword());

		attr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/qna/qnaPage";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(@RequestParam("qna_no") int no, SearchCriteria cri, RedirectAttributes attr) throws Exception {
		logger.info("占쏙옙占쏙옙占�");
		service.delete(no);
		attr.addAttribute("page", cri.getPage());
		attr.addAttribute("perPageNum", cri.getPerPageNum());
		attr.addAttribute("searchType", cri.getSearchType());
		attr.addAttribute("keyword", cri.getKeyword());

		attr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/qna/qnaPage";
	}

	@RequestMapping("company_info")
	public String company() {
		System.out.println("켜져라");
		return "/qna/company_info";
	}

}
