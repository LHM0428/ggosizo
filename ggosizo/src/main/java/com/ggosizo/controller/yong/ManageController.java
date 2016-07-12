package com.ggosizo.controller.yong;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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

import com.ggosizo.domain.yong.ManageAdvVO;
import com.ggosizo.domain.yong.ManageVO;
import com.ggosizo.domain.yong.UserinfoVO;
import com.ggosizo.persistence.yong.ManageAdvDAO;
import com.ggosizo.security.yong.PasswordEncoder;
import com.ggosizo.service.yong.ManageService;
import com.ggosizo.service.yong.UserinfoService;

@Controller
@RequestMapping("/manage")
public class ManageController {

	private static final Logger logger = LoggerFactory.getLogger(ManageService.class);

	@Inject
	private ManageService service;
	@Inject
	private UserinfoService userservice;
	@Inject
	private ManageAdvDAO advservice;

	private String uploadPath;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String manageGET() throws Exception {
		logger.info("manageGET.........");

		return "/manage/manage_login";
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public String managePOST(@ModelAttribute ManageVO vo, Model model, HttpServletRequest req)
			throws Exception {
		logger.info("managePOST.. .......");
		PasswordEncoder passwordencoder = new PasswordEncoder(vo.getM_id());
		String mypw = passwordencoder.enctyped(vo.getM_pass());
		vo.setM_pass(mypw);
		if (service.manageCheck(vo) == 1) {
			req.getSession().setAttribute("m_check", true);
		} else {
			req.getSession().setAttribute("m_check", false);
		}
		return "/manage/manage";
	}

	@RequestMapping(value = "/user_delete", method = RequestMethod.POST)
	public String manageUserDetePOST(@RequestParam("u_id") String u_id, HttpServletRequest req)
			throws Exception {
		logger.info("manageUserDetePOST.........");
		HttpSession session = req.getSession();
		logger.info("login : " + (String) session.getAttribute("login"));
		logger.info("id : " + u_id);
		if (session.getAttribute("m_check").equals(true) && userservice.selectCheckId(u_id) == 1) {
			UserinfoVO vo = new UserinfoVO();
			vo.setU_id(u_id);
			service.deleteItem(vo);
		}
		return "/manage/manage";
	}

	@RequestMapping(value = "/user_list", method = RequestMethod.GET)
	public String manageUserList(HttpServletRequest req) throws Exception {
		logger.info("manageUserList.........");
		int pageNum = 1;
		final int MAXRECORDCNT = 10;
		if (req.getSession().getAttribute("m_check").equals(true)) {
			String pageStr = req.getParameter("page");
			if (pageStr != null) {
				pageNum = Integer.parseInt(pageStr);
			}
			int end = pageNum * MAXRECORDCNT;
			int start = end - (MAXRECORDCNT - 1);

			List<UserinfoVO> list = userservice.selectPage(start, end);
			int totalCount = userservice.selectCount();
			int totalPage = totalCount / MAXRECORDCNT;
			if (totalCount % MAXRECORDCNT != 0) {
				totalPage++;
			}

			req.setAttribute("list", list);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("page", pageNum);
			//request.getRequestDispatcher("/notice/notice.jsp?page="+pageNum).forward(request, response);

		} else {
			req.getSession().setAttribute("m_check", false);
		}
		return "/manage/manage";
	}

	/*private String uploadFile(String originName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = UUID.randomUUID() + "_" + originName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}

	@RequestMapping(value = "/manage_adv", method = RequestMethod.GET)
	public String manageAdvGET() throws Exception {
		logger.info("manageAdvGET.........");

		return "";
	}

	@RequestMapping(value = "/manage_adv", method = RequestMethod.POST)
	public String manageAdvPOST() throws Exception {
		logger.info("manageAdvPOST.........");

		return "";
	}

	@RequestMapping(value = "/manage_adv_insert", method = RequestMethod.POST)
	public String manageAdvInsertPOST(MultipartFile file, Model model, ManageAdvVO vo, HttpServletRequest req,
			RedirectAttributes attr) throws Exception {
		logger.info("manageAdvInsertPOST.........");
		uploadPath = req.getSession().getServletContext().getRealPath("/resources/advuploadFiles");
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		vo.setFile_name(savedName);
		advservice.insertAdvVO(vo.getName(), vo.getViewcnt(), vo.getPrice(), vo.getUrl_name(),
				vo.getFile_name(), vo.getMax_viewcnt());
		return "redirect:/manage_adv_insert";
	}

	@RequestMapping(value = "/manage_adv_update", method = RequestMethod.GET)
	public String manageAdvUpdateGET(MultipartFile file, Model model, ManageAdvVO vo, HttpServletRequest req,
			RedirectAttributes attr) throws Exception {
		logger.info("manageAdvUpdateGET.........");
		vo = advservice.selectAdvVO(vo.getName());
		model.addAttribute("manage_adv", vo);
		return "/manage/manage_adv";
	}

	@RequestMapping(value = "/manage_adv_update", method = RequestMethod.POST)
	public String manageAdvUpdatePOST(MultipartFile file, Model model, ManageAdvVO vo, HttpServletRequest req,
			RedirectAttributes attr) throws Exception {
		logger.info("manageAdvUpdatePOST.........");
		uploadPath = req.getSession().getServletContext().getRealPath("/resources/advuploadFiles");
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		vo.setFile_name(savedName);
		advservice.updateAdvVO(vo.getName(), vo.getViewcnt(), vo.getPrice(), vo.getUrl_name(),
				vo.getFile_name(), vo.getMax_viewcnt());
		return "redirect:/manage/manage_adv";
	}*/
}
