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
	
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile() {
		logger.info("profile.");
		
		return "profile";
	}
	
	@RequestMapping(value = "/newsfeed", method = RequestMethod.GET)
	public String newsfeed() {
		logger.info("newsfeed.");
		
		return "newsfeed";
	}
	
	@RequestMapping(value = "/newsfeed2", method = RequestMethod.GET)
	public String newsfeed2() {
		logger.info("newsfeed2.");
		
		return "newsfeed2";
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
	@RequestMapping(value = "/stock", method = RequestMethod.GET)
	public String stock() {
		logger.info("stock.");
		
		return "stock";
	}
	
	
}
