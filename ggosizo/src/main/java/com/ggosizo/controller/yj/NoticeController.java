package com.ggosizo.controller.yj;


import java.io.File;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ggosizo.domain.yj.NoticeVO;
import com.ggosizo.domain.yj.PageMaker;
import com.ggosizo.domain.yj.SearchCriteria;
import com.ggosizo.service.yj.NoticeService;


@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeService service;
	
	private String uploadPath;
	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String selectAll(Model model)throws Exception{
		model.addAttribute("list", service.selectAll());
		return "/notice/notice";
	}
	
	@RequestMapping(value="/input_form", method=RequestMethod.GET)
	public String insertGET(NoticeVO notice, Model model, @ModelAttribute("cri") SearchCriteria cri, HttpSession session)throws Exception{
		model.addAttribute("id", session.getAttribute("login"));
		return "/notice/input_form";
	}
	
	@RequestMapping(value="/input_form", method=RequestMethod.POST)
	public String insertPOST(NoticeVO notice, HttpSession session, RedirectAttributes attr, SearchCriteria cri, MultipartFile file)throws Exception{
		
			uploadPath = session.getServletContext().getRealPath("/resources/uploadFiles");
			
			String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
			
			notice.setFiles(savedName);
		
			service.insert(notice);
			
			attr.addFlashAttribute("msg", "success");
			return "redirect:/notice/noticePage";
	}
	
	private String uploadFile(String originName, byte[] fileData)throws Exception{
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() +"_"+ originName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData,target); 
		return savedName;
	}
	
	@RequestMapping("/read_form")
	public String read(@RequestParam("no") int no,Model model, @ModelAttribute("cri") SearchCriteria cri, HttpSession session)throws Exception{
	   model.addAttribute("id", session.getAttribute("login"));
	   model.addAttribute("notice", service.select(no));
	   return "/notice/read_form";
	}
	
	@RequestMapping(value="/removePage",method=RequestMethod.POST)
	public String remove(@RequestParam("notice_no") int no, RedirectAttributes attr,
			SearchCriteria cri)throws Exception{
		service.delete(no);
		
		attr.addFlashAttribute("msg","SUCCESS");
		attr.addAttribute("page", cri.getPage());
		attr.addAttribute("perPageNum", cri.getPerPageNum());
		
		return "redirect:/notice/noticePage";
	}
	
	@RequestMapping(value="/update_form", method=RequestMethod.GET)
	public String updateGET(NoticeVO vo, Model model, @ModelAttribute("cri") SearchCriteria cri)throws Exception{//������ ���̱�
	  int no = vo.getNotice_no();
	  vo = service.updateSelect(no);
	  model.addAttribute("notice",vo);
	  return "/notice/update_form";
	}
	
	@RequestMapping(value="/update_form", method=RequestMethod.POST)
	public String updatePOST(NoticeVO notice, HttpSession session,
			RedirectAttributes attr,
			SearchCriteria cri, MultipartFile file)throws Exception{//����ó��(DB)
		 
		 	uploadPath = session.getServletContext().getRealPath("/resources/uploadFiles");
			
			String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
			
			if(savedName.length()<38){	
				notice.setFiles(service.select(notice.getNotice_no()).getFiles());
			}else{
				notice.setFiles(savedName);		
			}
			
			
	      
			service.update(notice);

			attr.addFlashAttribute("msg","SUCCESS");
			attr.addAttribute("page", cri.getPage());
			
			return "redirect:/notice/noticePage";
	}	
	
	@RequestMapping(value="/noticePage", method=RequestMethod.GET)
	public String listPage(Model model, @ModelAttribute("cri") SearchCriteria cri, HttpSession session)throws Exception{	
		model.addAttribute("id", session.getAttribute("login"));
		model.addAttribute("list", service.listSearchCriteria(cri));
	
		PageMaker maker = new PageMaker();
		  maker.setCri(cri);
		  maker.setTotalCount(service.listSearchCount(cri));//131);
		  
		model.addAttribute("pageMaker", maker);  
		
		return "/notice/noticePage";
	}
	
}
