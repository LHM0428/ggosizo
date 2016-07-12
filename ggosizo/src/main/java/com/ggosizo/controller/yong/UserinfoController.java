package com.ggosizo.controller.yong;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ggosizo.domain.yong.UserinfoDTO;
import com.ggosizo.domain.yong.UserinfoVO;
import com.ggosizo.persistence.hm.SidoDAOImpl;
import com.ggosizo.security.yong.PasswordEncoder;
import com.ggosizo.service.yong.MailServiceImpl;
import com.ggosizo.service.yong.UserinfoService;

@Controller
@RequestMapping("/user")
public class UserinfoController {

	@Inject
	private UserinfoService service;
	@Inject
	SidoDAOImpl sidoDAO;
	@Autowired
	private MailServiceImpl emailSender;

	private static final Logger logger = LoggerFactory.getLogger(UserinfoService.class);

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertUserGET() throws Exception {
		logger.info("insertUserGET...............");
		return "/user/user_insert"; // tiles
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertUserPOST(@RequestBody UserinfoVO vo) throws Exception {
		logger.info("insertUserPOST...............");
		logger.info("id : " + vo.getU_id());
		logger.info("pass : " + vo.getU_pass());
		PasswordEncoder pwencoder = new PasswordEncoder(vo.getU_id());
		vo.setU_pass(pwencoder.enctyped(vo.getU_pass()));
		service.insertItem(vo);
		return "/main/body";
	}

	@RequestMapping(value = "/user_id_check", method = RequestMethod.POST)
	public String insertUserIdCheckGET(@RequestParam("u_id") String u_id, Model model) throws Exception {
		logger.info("insertUserIdCheckGET.........");
		logger.info("u_id : " + u_id);
		int check = service.selectCheckId(u_id);
		if (check == 0) {
			model.addAttribute("u_id_check", true);
		} else {
			model.addAttribute("u_id_check", false);
		}
		return "/user/user_id_check"; // .jsp
	}

	   @RequestMapping(value = "/update", method = RequestMethod.GET)
	   public String updateUserGET(@RequestParam("u_id") String u_id, Model model, HttpServletRequest req)
	         throws Exception {
	      logger.info("updateUserGET...............");
	      HttpSession session = req.getSession();
	      logger.info("login : " + (String) session.getAttribute("login"));
	      logger.info("id : " + u_id);
	      if(session.getAttribute("m_check").equals(true)){
	    	  UserinfoDTO dto = new UserinfoDTO();
	    	  dto.setU_id(u_id);
	    	  model.addAttribute("userinfoDTO", service.selectItem(dto));
	    	  return "/user/user_update";
	      }
	      else if (session.getAttribute("login").equals(u_id) 
	    		  && session.getAttribute("login") != null ) {
	         UserinfoDTO dto = new UserinfoDTO();
	         dto.setU_id(u_id);
	         model.addAttribute("userinfoDTO", service.selectItem(dto));
	         return "/user/user_update";
	      }
	      else{
	    	  return "/user/login";
	      }
	   }

	   @RequestMapping(value = "/update", method = RequestMethod.POST)
	   public String updateUserPOST(@RequestBody UserinfoVO vo,HttpServletRequest req) throws Exception {
	      logger.info("updateUserPOST...............");
	      logger.info("id : " + vo.getU_id());

	      PasswordEncoder pwencoder = new PasswordEncoder(vo.getU_id());
	      vo.setU_pass(pwencoder.enctyped(vo.getU_pass()));
	      logger.info("pass after : " + vo.getU_pass());
	      service.updateItem(vo);
	      if(req.getSession().getAttribute("m_check")!=null &&
	    		  req.getSession().getAttribute("m_check").equals(true)){
	    	  return "/main/body";
	      }
	      return "/mypage/mypage";
	   }
	   
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteUserGET() throws Exception {
		logger.info("deleteUserGET...............");
		return "/user/user_delete";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deleteUserPOST(@ModelAttribute UserinfoVO vo, Model model, HttpServletRequest req)
			throws Exception {
		logger.info("deleteUserPOST...............");
		logger.info(vo.getU_id());
		logger.info(vo.getU_pass());
		PasswordEncoder passwordEncoder = new PasswordEncoder(vo.getU_id());
		vo.setU_pass(passwordEncoder.enctyped(vo.getU_pass()));
		if (service.selectUserCheck(vo) == 1) {
			service.deleteItem(vo);
		} else {
			return "/user/error";
		}
		return "/user/user_delete";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginUserGET() throws Exception {
		logger.info("loginUserGET...............");
		return "/user/login";
	}

	@RequestMapping(value = "/loginPOST", method = RequestMethod.POST)
	public String loginUserPOST(@ModelAttribute UserinfoVO vo, Model model) throws Exception {
		logger.info("loginUserPOST...............");
		logger.info("u_id : " + vo.getU_id());
		logger.info("u_pass : " + vo.getU_pass());

		if (vo != null || service.selectCheckId(vo.getU_id()) == 1) {
			PasswordEncoder pwencoder = new PasswordEncoder(vo.getU_id());
			vo.setU_pass(pwencoder.enctyped(vo.getU_pass()));
		}
		if (service.selectUserCheck(vo) == 1) {
			model.addAttribute("u_id", vo.getU_id());
			service.UserLogintimeSet(vo);
		} else {
			return "/user/user_error";
		}

		return "/main/body";
	}

	@RequestMapping(value = "/user_logout", method = RequestMethod.GET)
	public String logOutUserGET(@ModelAttribute UserinfoVO vo, HttpServletRequest req) throws Exception {
		logger.info("logOutUserGET...............");
		logger.info("u_id : " + vo.getU_id());
		req.getSession().setAttribute("u_id", null);
		return "/user/user_logout";
	}

	@RequestMapping(value = "/findid", method = RequestMethod.GET)
	public String findUserIdGET() throws Exception {
		logger.info("findUserIdGET...............");
		return "/user/find_id";
	}

	@RequestMapping(value = "/findid", method = RequestMethod.POST)
	public String findUserIdPOST(@ModelAttribute UserinfoVO vo, Model model) throws Exception {
		logger.info("findUserIdPOST...............");
		logger.info("name : " + vo.getU_name());
		logger.info("email : " + vo.getU_email());

		model.addAttribute("findId", findIdSecurity(service.findId(vo)));

		return "/user/response_id"; // .jsp
	}

	public String findIdSecurity(String user_id) {
		int user_id_len = user_id.substring(3).length();
		user_id = "*" + user_id.substring(1, 3);
		for (int i = 0; i < user_id_len; i++) {
			user_id = user_id.concat("*");
		}
		return user_id;
	}

	@RequestMapping(value = "/findpass", method = RequestMethod.GET)
	public String findPassGET(@ModelAttribute UserinfoVO vo, Model model) throws Exception {
		logger.info("findUserIdGET...............");

		return "/user/find_pass";
	}

	@RequestMapping(value = "/findpass", method = RequestMethod.POST)
	public String findPassPOST(@ModelAttribute UserinfoVO vo, Model model) throws Exception {
		logger.info("findPassPOST...............");
		logger.info("vo id : " + vo.getU_id());
		logger.info("vo email : " + vo.getU_email());
		logger.info("vo tel : " + vo.getU_tel());
		vo = service.selectUserIdEmailTel(vo);
		if (vo == null || vo.getU_pass() == null || vo.getU_email() == null) {
			model.addAttribute("findpass", null);
			return "/user/find_pass";
		} else {
			logger.info("vo email : " + vo.getU_email());
			logger.info("vo pass : " + vo.getU_pass());
			model.addAttribute("findpass", true);
			PasswordEncoder pwencoder = new PasswordEncoder(vo.getU_id());
			emailSender.sendMail("꼬시조 데이트 추천 웹사이트 비밀번호", "당신의 비밀번호는 [ " + pwencoder.decrypted(vo.getU_pass()) + " ] 입니다.",
					vo.getU_email());
		}
		return "/user/response_pass"; //.jsp
	}
}
