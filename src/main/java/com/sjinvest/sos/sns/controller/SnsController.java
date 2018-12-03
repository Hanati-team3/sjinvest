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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjinvest.sos.HomeController;
import com.sjinvest.sos.user.mapper.UserMapper;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class SnsController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	UserMapper userMapper;
	
	@GetMapping(value = "/sns/newsfeed")
	public String newsfeed() {
		logger.info("newsfeed.");
		System.out.println("여기는 홈컨트롤러입니다.");
		//model.addAttribute("feedList", service.listAll());
		return "/sns/newsfeed";
	}
	
//	검색 - 자동 완성기능 (hojin)
	@ResponseBody
	@GetMapping(value = "/sns/search", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<String>> searchBook(String term) {
		logger.info("newsfeed.");
		System.out.println(term);
		List<String> searchList;
		Map<String,Object> userList = null;
		if (term == null) {
			searchList = userMapper.findUser("");
		}else {
			searchList = userMapper.findUser(term);
		}
		System.out.println(searchList);
//		userList.put("userList", (Object)searchList);
        return new ResponseEntity<>(searchList,HttpStatus.OK);
    }

}
