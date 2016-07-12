package com.ggosizo.controller.yj;


import java.io.File;
import java.util.List;
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

import com.ggosizo.domain.yj.EventVO;
import com.ggosizo.domain.yj.PageMaker;
import com.ggosizo.domain.yj.SearchCriteria;
import com.ggosizo.service.yj.EventService;


@Controller
@RequestMapping("/event")
public class EventController {

	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Inject
	private EventService service;
	
	private String uploadPath;
	
	@RequestMapping(value="/input_form", method=RequestMethod.GET)
	public String insertGET(EventVO event, Model model, @ModelAttribute("cri") SearchCriteria cri, HttpSession session)throws Exception{
		model.addAttribute("id",session.getAttribute("login"));
		
		return "/event/input_form";
	}
	
	@RequestMapping(value="/input_form", method=RequestMethod.POST)
	public String insertPOST(EventVO event, HttpSession session, RedirectAttributes attr, SearchCriteria cri, MultipartFile file)throws Exception{
		uploadPath = session.getServletContext().getRealPath("/resources/uploadFiles");
		
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		event.setFiles(savedName);
	
		service.insert(event);
	
		attr.addFlashAttribute("msg", "success");
		return "redirect:/event/event";			
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
	   model.addAttribute("event", service.select(no));
	   return "/event/read_form";
	}
	
	@RequestMapping(value="/removePage",method=RequestMethod.POST)
	public String remove(@RequestParam("event_no") int no, RedirectAttributes attr,
			SearchCriteria cri)throws Exception{
		service.delete(no);
		
		attr.addFlashAttribute("msg","SUCCESS");
		attr.addAttribute("page", cri.getPage());
		attr.addAttribute("perPageNum", cri.getPerPageNum());
		
		return "redirect:/event/event";
	}
	
	@RequestMapping(value="/update_form", method=RequestMethod.GET)
	public String updateGET(EventVO vo, Model model, @ModelAttribute("cri") SearchCriteria cri)throws Exception{//������ ���̱�

	  int no = vo.getEvent_no();
	  vo = service.updateSelect(no);
	 
	  model.addAttribute("event",vo);
	  return "/event/update_form";
	}
	
	@RequestMapping(value="/update_form", method=RequestMethod.POST)
	public String updatePOST(EventVO notice, HttpSession session,
			RedirectAttributes attr,
			SearchCriteria cri, MultipartFile file)throws Exception{//����ó��(DB)
		
		uploadPath = session.getServletContext().getRealPath("/resources/uploadFiles");
		
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		notice.setFiles(savedName);
		
		service.update(notice);

		attr.addFlashAttribute("msg","SUCCESS");
		attr.addAttribute("page", cri.getPage());
		
		return "redirect:/event/event";
	}	
	
	@RequestMapping(value="/event", method=RequestMethod.GET)
	public String listPage(Model model, @ModelAttribute("cri") SearchCriteria cri, HttpSession session)throws Exception{
			
		model.addAttribute("id", session.getAttribute("login"));
		model.addAttribute("list", service.listSearchCriteria(cri));
		System.out.println("cri:"+cri.getPage());
		
		PageMaker maker = new PageMaker();
		  maker.setCri(cri);
		  maker.setTotalCount(service.listSearchCount(cri));//131);
		  
		model.addAttribute("pageMaker", maker);  
		
		return "/event/event";
	}
	
}
