package com.sjinvest.sos;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjinvest.sos.feed.service.FeedService;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private FeedService service;
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
		
		return "index";
	}
	
	
	/**
	 * SNS, USER 관련 start by 형철
	 */
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile() {
		logger.info("profile.");
		
		return "profile";
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
	
	@RequestMapping(value = "/sns/mypage_information", method = RequestMethod.GET)
	public String mypage_information() {
		logger.info("mypage_information.");
		
		return "/sns/mypage_information";
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
	
	@RequestMapping(value = "/sns/mypage_sns", method = RequestMethod.GET)
	public String mypage_sns() {
		logger.info("mypage_sns.");
		
		return "/sns/mypage_sns";
	}
	
	@RequestMapping(value = "/sns/mypage_stock", method = RequestMethod.GET)
	public String mypage_stock() {
		logger.info("mypage_stock.");
		
		return "/sns/mypage_stock";
	}
	
	@RequestMapping(value = "/sns/mypage_point", method = RequestMethod.GET)
	public String mypage_point() {
		logger.info("mypage_point.");
		
		return "/sns/mypage_point";
	}
	
	@RequestMapping(value = "/sns/user_profile", method = RequestMethod.GET)
	public String user_profile() {
		logger.info("user_profile.");
		
		return "/sns/user_profile";
	}
	
	@RequestMapping(value = "/stock/interest1", method = RequestMethod.GET)
	public String interest() {
		logger.info("stock-interest.");
		
		return "/stock/stock-interest";
	}


	
	/**
	 * stock 관련 start by 예겸
	 */

	@RequestMapping(value = "/icon", method = RequestMethod.GET)
	public String icon() {
		logger.info("icon ");
		
		return "/temp/icon";
	}
	
}
