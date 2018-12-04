package com.sjinvest.sos.feed.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.feed.domain.Feed;
import com.sjinvest.sos.feed.service.FeedService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/feed/*")
@AllArgsConstructor
public class FeedController {

	private FeedService service;
	
	@PostMapping("/write")
	public String write(Feed feed, RedirectAttributes rttr) {
		rttr.addAttribute("result", service.write(feed));
		return "sns/newsfeed";
	}
	
	@ResponseBody
	@GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> list() {
		Map<String, Object> returnData = new HashMap<String, Object>();
		
		returnData.put("feedList", service.listAll());
		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping(value = "/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> delete(@ModelAttribute("feedSeq") int feedSeq) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		
		System.out.println("삭제들어오냐?");
		returnData.put("feedDelete", service.deleteFeed(feedSeq));
		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
	
	
}
