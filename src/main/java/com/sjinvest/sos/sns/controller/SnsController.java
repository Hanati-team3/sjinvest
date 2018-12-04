package com.sjinvest.sos.sns.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjinvest.sos.HomeController;
import com.sjinvest.sos.company.mapper.CompanyMapper;
import com.sjinvest.sos.field.mapper.FieldMapper;
import com.sjinvest.sos.user.mapper.UserMapper;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class SnsController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	UserMapper userMapper;
	@Autowired
	CompanyMapper companyMapper;
	@Autowired
	FieldMapper fieldMapper;
	
	@GetMapping(value = "/sns/newsfeed")
	public String newsfeed() {
		logger.info("newsfeed.");
		System.out.println("여기는 홈컨트롤러입니다.");
		//model.addAttribute("feedList", service.listAll());
		return "/sns/newsfeed";
	}
	
//	검색 - 자동 완성기능 (hojin)
	@ResponseBody
	@GetMapping(value = "/sns/searchAuto", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<String>> searchAutoComplete(String term) {
		logger.info("newsfeed.");
//		System.out.println(term);
		List<String> searchList = null;
		if (term == "") {
			System.out.println("전체검색");
			searchList = userMapper.findUser("");
		}else if(term.charAt(0) == '$') {
//			System.out.println("캐시태그 검색");
			searchList = companyMapper.findCompany(term.substring(1));
		}
		else if(term.charAt(0) == '@') {
//			System.out.println("업종태그 검색");
			searchList = fieldMapper.findField(term.substring(1));
		}
		else {
			searchList = userMapper.findUser(term);
		}
        return new ResponseEntity<>(searchList,HttpStatus.OK);
    }
	
//	검색
	@ResponseBody
	@PostMapping(value = "/sns/search", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<String>> searchFeed(String text) {
		
		System.out.println(text);
//		if(text.charAt(0) == '$') {
////			System.out.println("캐시태그 검색");
//			searchList = companyMapper.findCompany(term.substring(1));
//		}
//		else if(text.charAt(0) == '@') {
////			Stem.out.println(term.substring(1));
//			searchList = fieldMapper.findField(term.substring(1));
//		}
//		else {
//			searchList = userMapper.findUser(term);
//		}
		
		return null;
//        return new ResponseEntity<>(searchList,HttpStatus.OK);
    }

}
