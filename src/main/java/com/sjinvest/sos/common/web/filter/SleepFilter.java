package com.sjinvest.sos.common.web.filter;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;

import com.sjinvest.sos.follow.mapper.FollowMapper;
import com.sjinvest.sos.holding.mapper.HoldingMapper;
import com.sjinvest.sos.interest.mapper.InterestMapper;
import com.sjinvest.sos.like.mapper.LikeMapper;
import com.sjinvest.sos.notice.mapper.NoticeMapper;
import com.sjinvest.sos.setting.mapper.SettingMapper;
import com.sjinvest.sos.user.mapper.UserMapper;
import com.sjinvest.sos.user.service.UserService;
import com.sjinvest.sos.user.service.UserServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


/**
 * 사용자 로그인 여부 체크 필터
 */
@Log4j
public class SleepFilter implements Filter {
	
//	private Logger logger = Logger.getLogger(LoginCheckFilter.class);
//	private String loginPage = "/user/login.jsp";
//	private String loginPage;
    @Override
	public void init(FilterConfig filterConfig) throws ServletException {
//    	String loginPage = filterConfig.getInitParameter("loginPage");
	}

    @Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	try {
			Thread.sleep(1000);
			System.out.println("지연됨");
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		chain.doFilter(request, response);
	}
    
    @Override
	public void destroy() {}

}
