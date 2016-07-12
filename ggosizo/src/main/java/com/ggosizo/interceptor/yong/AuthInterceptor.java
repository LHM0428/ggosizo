package com.ggosizo.interceptor.yong;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session  = request.getSession();
		if(session.getAttribute("m_check") != null && session.getAttribute("m_check").equals(true)){
			logger.info("tuth test:...........");
			return true;
		}
		if(session.getAttribute("login") == null ){
			logger.info("current user is not logined");
			
			saveDest(request);
			
			response.sendRedirect("/user/login");
			return false;
		}
		return true;
	}
	private void saveDest(HttpServletRequest req){
		String uri = req.getRequestURI();
		String qurey = req.getQueryString();
		
		if(qurey == null || qurey.equals("null")){
			qurey = "";
		}else{
			qurey = "?" + qurey;
		}
		
		if(req.getMethod().equals("GET")){
			logger.info("dest : " + (uri + qurey));
			req.getSession().setAttribute("dest",  uri + qurey);
		}
	}
	

}
