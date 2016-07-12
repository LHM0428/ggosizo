package com.ggosizo.controller.hm;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ggosizo.domain.DateCourse;
import com.ggosizo.domain.hm.CafeVO;
import com.ggosizo.domain.hm.SidoCriteria;
import com.ggosizo.domain.yj.PageMaker;
import com.ggosizo.domain.yj.SearchCriteria;
import com.ggosizo.persistence.hm.SidoDAOImpl;
import com.ggosizo.service.hm.CafeServiceImpl;

@Controller
@RequestMapping("/cafe")
public class CafeController {
	@Inject
	private CafeServiceImpl cafeService;
	@Inject
	private SidoDAOImpl sidoDAO; 
	
	private String uploadPath;
	
	@RequestMapping(value="/selecSido", method=RequestMethod.POST)
	public String selecSido(String sido, String selectGugun, RedirectAttributes rttr, HttpSession session){
		List<String> list = sidoDAO.selectGugun(sido);
		rttr.addFlashAttribute("gugun", list);
		rttr.addFlashAttribute("selectGugun", selectGugun);
		return "redirect:/cafe/cafe_selsido";
	}
	@RequestMapping(value="/cafe_selsido", method=RequestMethod.GET)
	public void selSido(){
	}
	
	@RequestMapping(value="/selecGugun", method=RequestMethod.POST)
	public String selecGugun(String gugun,String selectDong, RedirectAttributes rttr){
		List<String> list = sidoDAO.selectDong(gugun);
		rttr.addFlashAttribute("dong", list);
		rttr.addFlashAttribute("selectDong", selectDong);
		return "redirect:/cafe/cafe_selsido";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String cafePage(SidoCriteria cri, Model model) throws Exception{
		List<CafeVO> list = cafeService.searchAddr(cri);
		model.addAttribute("list", list);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cafeService.searchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		return "/cafe/cafe";
	}
	@RequestMapping(value="/searchList", method=RequestMethod.GET)
	public String cafePage(SearchCriteria searchCri, Model model,
			String writer, SidoCriteria cri) throws Exception{
		if(writer==null){
			List<DateCourse> list = cafeService.selectKeyword(searchCri);
			model.addAttribute("list", list);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(cafeService.searchKewordCount(searchCri.getKeyword()));
			model.addAttribute("pageMaker", pageMaker);
		}else{
			List<DateCourse> list = cafeService.selectId(writer);
			model.addAttribute("list", list);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(list.size());
			model.addAttribute("pageMaker", pageMaker);
		}
		return "/cafe/cafe";
	}
	@RequestMapping(value="/inputForm", method=RequestMethod.GET)
	public String inputGET(){
		return "/cafe/cafe_inputForm";
	}
	@RequestMapping(value="/inputForm", method=RequestMethod.POST)
	public String inputPOST(CafeVO vo,SidoCriteria cri, RedirectAttributes rttr, HttpSession session, MultipartFile files)throws Exception{
		
		uploadPath = session.getServletContext().getRealPath("/resources/uploadFiles");
		
		String savedName = uploadFile(files.getOriginalFilename(), files.getBytes());
		
		vo.setFile(savedName);
		vo.setImg(savedName);
		
		cafeService.insert(vo);
		rttr.addFlashAttribute("msg","SUCCESS");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cafeService.searchCount(cri));
		
		rttr.addFlashAttribute("pageMaker", pageMaker);
		return "redirect:/cafe/list";
	}
	
	private String uploadFile(String originName, byte[] fileData)throws Exception{
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() +"_"+ originName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData,target); 
		return savedName;
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyGET(int no, Model model) throws Exception{
		model.addAttribute("cafe", cafeService.selectCafe(no));
		return "/cafe/cafe_modify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(CafeVO vo, SidoCriteria cri, RedirectAttributes rttr, HttpSession session, MultipartFile files)throws Exception{
		
		uploadPath = session.getServletContext().getRealPath("/resources/uploadFiles");
		
		String savedName = uploadFile(files.getOriginalFilename(), files.getBytes());
		
		vo.setFile(savedName);
		
		if(savedName.length()<38){	
			vo.setImg(cafeService.selectCafe(vo.getNo()).getImg());
		}else{
			vo.setImg(savedName);			
		}
		
		cafeService.update(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		if(cri.getCriGugun()!=null && cri.getCriGugun().length()>0){
			rttr.addAttribute("criGugun", cri.getCriGugun());
			rttr.addAttribute("criDong", cri.getCriDong());
		}
		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/cafe/list";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String remove(@RequestParam("no") int no, /*SearchCriteria cri, */
			RedirectAttributes rttr) throws Exception{
		cafeService.delete(no);

		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/cafe/list";
	}
}
