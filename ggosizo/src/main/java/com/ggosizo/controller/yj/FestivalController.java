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

import com.ggosizo.domain.hm.SidoCriteria;
import com.ggosizo.domain.yj.FestivalVO;
import com.ggosizo.domain.yj.MonthCriteria;
import com.ggosizo.domain.yj.PageMaker;
import com.ggosizo.service.yj.FestivalService;

@Controller
@RequestMapping("/festival")
public class FestivalController {

	private static final Logger logger = LoggerFactory.getLogger(FestivalController.class);
	
	@Inject
	private FestivalService service;
	
	private String uploadPath;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String listPage(Model model, @ModelAttribute("cri") MonthCriteria cri, HttpSession session)throws Exception{
		
		List<FestivalVO> festival = service.listSearchCriteria(cri);
		for (int i = 0; i < festival.size(); i++) {
			
			if(!festival.get(i).getImg().substring(0, 4).equals("HTTP")){
				festival.get(i).setImg("/resources/uploadFiles/"+festival.get(i).getImg());
			}
		}
		String id = (String) session.getAttribute("login");
		
		model.addAttribute("id", id);
		model.addAttribute("festival", festival);
		model.addAttribute("top", service.topFestivalList("06"));
		model.addAttribute("id", session.getAttribute("login"));
	
			PageMaker maker = new PageMaker();
				maker.setCri(cri);
				maker.setTotalCount(service.listSearchCount(cri));
				  
			model.addAttribute("pageMaker", maker); 
		
		return "/festival/festival";
	}
	
	@RequestMapping("/read_form")
	public String read(@RequestParam("no") int no,Model model, @ModelAttribute("cri") MonthCriteria cri, HttpSession session)throws Exception{
	   System.out.println("no...["+ no +"]");
	   FestivalVO festival = service.select(no);
	   if(festival.getImg()!=null&&!festival.getImg().substring(0, 4).equals("HTTP")){
			festival.setImg("/resources/uploadFiles/"+festival.getImg());
		}
	   model.addAttribute("id", session.getAttribute("login"));
	   model.addAttribute("festival", festival);
	   model.addAttribute("");
	   return "/festival/f_read_form";
	}
	
	@RequestMapping(value="/inputForm", method=RequestMethod.GET)
	public String insertGET(FestivalVO festival, Model model, @ModelAttribute("cri") MonthCriteria cri, HttpSession session)throws Exception{
		model.addAttribute("id", session.getAttribute("login"));
		return "/festival/f_input_form";
	}
	
	@RequestMapping(value="/inputForm", method=RequestMethod.POST)
	public String insertPOST(FestivalVO festival, HttpSession session, RedirectAttributes attr, MonthCriteria cri, 
			@RequestParam("year1") String year1, @RequestParam("month1") String month1, @RequestParam("day1") String day1,
			@RequestParam("year2") String year2, @RequestParam("month2") String month2, @RequestParam("day2") String day2,
			MultipartFile files, SidoCriteria sido)throws Exception{
		uploadPath = session.getServletContext().getRealPath("/resources/uploadFiles");
		
		String savedName = uploadFile(files.getOriginalFilename(), files.getBytes());
		
		String startdate=year1+"/"+month1+"/"+day1;
		String enddate=year2+"/"+month2+"/"+day2;
		festival.setFile(savedName);
		festival.setImg(savedName);
		
		festival.setStartdate(startdate);
		festival.setEnddate(enddate);
		uploadPath = session.getServletContext().getRealPath("/resources/uploadFiles");
		
		System.out.println("vo : "+festival);
		
		service.insert(festival);
	
		attr.addFlashAttribute("msg", "success");
		return "redirect:/festival/list";
	
}
	
	private String uploadFile(String originName, byte[] fileData)throws Exception{
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() +"_"+ originName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData,target); 
		return savedName;
	}
	
	@RequestMapping(value="/removePage",method=RequestMethod.GET)
	public String delete(@RequestParam("no") int no, RedirectAttributes attr,
			MonthCriteria cri)throws Exception{
		service.delete(no);
		
		attr.addFlashAttribute("msg","SUCCESS");
		attr.addAttribute("page", cri.getPage());
		attr.addAttribute("perPageNum", cri.getPerPageNum());
		
		return "redirect:/festival/list";
	}
	
	@RequestMapping(value="/updateForm", method=RequestMethod.GET)
	public String updateGET(FestivalVO vo, Model model, @ModelAttribute("cri") MonthCriteria cri, HttpSession session)throws Exception{
	  System.out.println("no:"+ vo.getNo());
	  vo=service.select(vo.getNo());
	  if(vo.getStartdate()!= null && vo.getEnddate() != null){
		  int year1=Integer.parseInt(vo.getStartdate().substring(0,2));
		  int month1=Integer.parseInt(vo.getStartdate().substring(3,5));
		  int day1=Integer.parseInt(vo.getStartdate().substring(6,8));
		  int year2=Integer.parseInt(vo.getEnddate().substring(0,2));
		  int month2=Integer.parseInt(vo.getEnddate().substring(3,5));
		  int day2=Integer.parseInt(vo.getEnddate().substring(6,8));
		  session.setAttribute("year1",year1);
		  session.setAttribute("month1",month1);
		  session.setAttribute("day1",day1);
		  session.setAttribute("year2",year2);
		  session.setAttribute("month2",month2);
		  session.setAttribute("day2",day2);
	  }
	  
	  if(!vo.getImg().substring(0, 4).equals("HTTP")){
		  vo.setImg("/resources/uploadFiles/"+vo.getImg());
		}
	 
	  model.addAttribute("festival",vo);
	  return "/festival/f_update_form";
	}
	
	@RequestMapping(value="/updateForm", method=RequestMethod.POST)
	public String updatePOST(FestivalVO festival, HttpSession session,
			RedirectAttributes attr,
			@RequestParam("year1") String year1, @RequestParam("month1") String month1, @RequestParam("day1") String day1,
			@RequestParam("year2") String year2, @RequestParam("month2") String month2, @RequestParam("day2") String day2,
			MonthCriteria cri, MultipartFile files) throws Exception{
	
			uploadPath = session.getServletContext().getRealPath("/resources/uploadFiles");
			
			String savedName = uploadFile(files.getOriginalFilename(), files.getBytes());
			
			festival.setFile(savedName);
			if(savedName.length()<38){	
				festival.setImg(service.select(festival.getNo()).getImg());
			}else{
				festival.setImg(savedName);			
			}
		
			String startdate=year1+"/"+month1+"/"+day1;
			String enddate=year2+"/"+month2+"/"+day2;
			
			festival.setStartdate(startdate);
			festival.setEnddate(enddate);
			
	      	uploadPath = session.getServletContext().getRealPath("/resources/uploadFiles");
		
			service.update(festival);
	
			attr.addFlashAttribute("msg","SUCCESS");
			attr.addAttribute("page", cri.getPage());
			
			return "redirect:/festival/list";
	}
}
