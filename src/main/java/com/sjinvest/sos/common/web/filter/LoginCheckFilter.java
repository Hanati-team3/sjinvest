package com.sjinvest.sos.common.web.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;

import lombok.extern.log4j.Log4j;


/**
 * 사용자 로그인 여부 체크 필터
 */
@Log4j
public class LoginCheckFilter implements Filter {
	
	private Logger logger = Logger.getLogger(LoginCheckFilter.class);
	
//	private String loginPage = "/user/login.jsp";
	private String loginPage;

    @Override
	public void init(FilterConfig filterConfig) throws ServletException {
    	loginPage = filterConfig.getInitParameter("loginPage");
	}

    @Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	boolean isLogin = false;
		Cookie[] cookies = ((HttpServletRequest)request).getCookies();
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals("userIdC")) {
					isLogin = true;
					request.setAttribute("userIdC", cookie.getValue());
					log.info(cookie.getValue());
					break;
				}
			}
		}
		chain.doFilter(request, response);
//		else {
//			if(loginPage == null) {
//				throw new ServletException("LoginCheckFilter에 loginPage가 설정되어 있지 않습니다.");
//			}
//			request.setAttribute("uri", ((HttpServletRequest)request).getRequestURI());
//			request.getServletContext().getRequestDispatcher(loginPage).forward(request, response);
//		}
	}
    
    @Override
	public void destroy() {}

}
