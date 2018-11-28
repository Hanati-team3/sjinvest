package com.sjinvest.sos;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info(locale+"에서 홈페이지 요청 들어옴..");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	/**
	 * SNS, USER 관련 start by 형철
	 */
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile() {
		logger.info("profile.");
		
		return "profile";
	}
	
	@RequestMapping(value = "/sns/newsfeed", method = RequestMethod.GET)
	public String newsfeed() {
		logger.info("newsfeed.");
		
		return "/sns/newsfeed";
	}
	
	@RequestMapping(value = "/widgets", method = RequestMethod.GET)
	public String widgets() {
		logger.info("widgets.");
		
		return "widgets/widgets";
	}
	
	@RequestMapping(value = "/tempnews", method = RequestMethod.GET)
	public String tempnews() {
		logger.info("tempnews.");
		
		return "temp/origin-newsfeed";
	}

	@RequestMapping(value = "/sns/login", method = RequestMethod.GET)
	public String login() {
		logger.info("login.");
		
		return "/sns/login";
	}
	
	@RequestMapping(value = "/sns/naverLogin", method = RequestMethod.GET)
	public String naverLogin() {
		logger.info("naverLogin.");
		
		return "/sns/naverLogin";
	}
	
	@RequestMapping(value = "/sns/naverLoginCallback", method = RequestMethod.GET)
	public String naverLoginCallback() {
		logger.info("naverLoginCallback.");
		
		return "/sns/naverLoginCallback";
	}
	
	@RequestMapping(value = "/sns/googleLogin", method = RequestMethod.GET)
	public String googleLogin() {
		logger.info("googleLogin.");
		
		return "/sns/googleLogin";	
	}
	
	@RequestMapping(value = "/sns/googleLoginCallback", method = RequestMethod.GET)
	public String googleLoginCallback() {
		logger.info("googleLoginCallback.");
		
		return "/sns/googleLoginCallback";	
	}
	
	@RequestMapping(value = "/sns/signup", method = RequestMethod.GET)
	public String signup() {
		logger.info("signup.");
		
		return "/sns/signup";
	}
	
	@RequestMapping(value = "/sns/mypage_index", method = RequestMethod.GET)
	public String mypage_index() {
		logger.info("mypage_index.");
		
		return "/sns/mypage_index";
	}
	
	@RequestMapping(value = "/sns/mypage_follow", method = RequestMethod.GET)
	public String mypage_follow() {
		logger.info("mypage_follow.");
		
		return "/sns/mypage_follow";
	}
	
	@RequestMapping(value = "/sns/mypage_follow2", method = RequestMethod.GET)
	public String mypage_follow2() {
		logger.info("mypage_follow2.");
		
		return "/sns/mypage_follow2";
	}
	
	/**
	 * stock 관련 start by 예겸
	 */

	@RequestMapping(value = "/stock/index", method = RequestMethod.GET)
	public String stock() {
		logger.info("stock index ");
		
		return "/stock/stock-index";
	}
	
}
