package com.sjinvest.sos.sns.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.HomeController;
import com.sjinvest.sos.company.service.CompanyService;
import com.sjinvest.sos.field.service.FieldService;
import com.sjinvest.sos.user.domain.User;
import com.sjinvest.sos.user.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/sns/*")
@AllArgsConstructor
public class SnsController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	private UserService userService;
	private CompanyService companyService;
	private FieldService fieldService;

	@GetMapping(value = "/newsfeed")
	public String newsfeed(HttpSession session, Model model, HttpServletRequest request) {
		
		System.out.println("첫홈페이지 user :"+session.getAttribute("user"));
		
		logger.info("newsfeed.");

		return "/sns/newsfeed";
	}
	
	@GetMapping(value = "/personal/{id}")
	public String personal(@PathVariable("id")String id, Model model) {
		System.out.println(id);
		logger.info("personal.");
		model.addAttribute("onlyOne",userService.readById(id));
		return "/sns/personal";
	}
	
	@GetMapping(value = "/mypage_index")
	public String mypageIndex(Model model, HttpServletRequest request) {
		logger.info("mypageIndex.");
		System.out.println("mypage 메인 컨트롤러입니다.");

		
		
		// 쿠키확인 후 user 보내주는 부분
		Cookie[] cookies = request.getCookies();

		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("userIdC")) {
				String userId = null;

				userId = cookies[i].getValue();
				//System.out.println(userId);
				User user = userService.readById(userId);

				model.addAttribute("user", user);
				//System.out.println("user제발나와라" + user);
			} else {
				//System.out.println("쿠키없을시 그냥 홈페이지 ㄱㄱ");

			}

		}

		return "/sns/mypage_index";
	}
	

//	검색 - 자동 완성기능 (hojin)
	@ResponseBody
	@GetMapping(value = "/searchAuto", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<String>> searchAutoComplete(String term) {
		logger.info("newsfeed.");
//		System.out.println(term);
		List<String> searchList = null;
		if (term == "") {
			System.out.println("전체검색");
			searchList = userService.findUser("");
		} else if (term.charAt(0) == '$') {
//			System.out.println("캐시태그 검색");
			searchList = companyService.findCompany(term.substring(1));
		} else if (term.charAt(0) == '@') {
//			System.out.println("업종태그 검색");
			searchList = fieldService.findField(term.substring(1));
		} else {
			searchList = userService.findUser(term);
		}
		return new ResponseEntity<>(searchList, HttpStatus.OK);
	}

}
