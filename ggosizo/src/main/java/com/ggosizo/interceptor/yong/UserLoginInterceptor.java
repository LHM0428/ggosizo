package com.ggosizo.interceptor.yong;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserLoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(UserLoginInterceptor.class);
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		Object userObject = modelMap.get("u_id");
		if(userObject != null){
			logger.info("new login success");
			session.setAttribute(LOGIN, userObject);
			
//			response.sendRedirect("/main");
			Object dest = session.getAttribute("dest");
			response.sendRedirect(dest != null ? (String)dest : "/main");
		}
	}

	@Override
	 public boolean preHandle(HttpServletRequest request,
	   HttpServletResponse response, Object handler) throws Exception {
	  // TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN)!=null){
			logger.info("clear login data befor");
			session.removeAttribute(LOGIN);
		}
		
		
		return true;
		
	}
	 /* 
	  // session검사
	  HttpSession session = request.getSession(false);
	  
	   if (session == null) {
	   // 처리를 끝냄 - 컨트롤로 요청이 가지 않음.
	   response.sendRedirect("/user/login");
	   return false;
	  }
	  String userId = (String)session.getAttribute("u_id");
	  if (userId == null) { 
	   response.sendRedirect("/user/login");  
	   return false;
	  }
	  return true;
	 }
	 */
	/*@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		System.out.println("pre handle..........................");
		UserinfoVO vo = new UserinfoVO();
		
		vo.setU_id(request.getParameter("u_id"));
		System.out.println("id : " + vo.getU_id());
		if (vo.getU_id() == null) {
			return true;
		} else {
			System.out.println("test");
			vo.setU_pass(request.getParameter("u_pass1"));
			vo.setU_name(request.getParameter("u_name"));
			vo.setU_gender(request.getParameter("u_gender"));
			String birth = (request.getParameter("u_year") + "-" + request.getParameter("u_month") + "-"
					+ request.getParameter("u_day"));
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date to = transFormat.parse(birth);
			vo.setU_birth(to);

			vo.setU_email(request.getParameter("u_email1") + "@" + request.getParameter("u_email2"));
			vo.setU_tel(request.getParameter("u_tel1") + "-" + request.getParameter("u_tel2") + "-"
					+ request.getParameter("u_tel3"));
			vo.setU_addr(request.getParameter("u_addr1") + " " + request.getParameter("u_addr2"));
			
		}
		request.setAttribute("userinfoVO", vo);
		return true;

	}*/
}
