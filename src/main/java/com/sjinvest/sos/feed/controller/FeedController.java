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
	
	@PostMapping(value = "/write")
	public String write(Feed feed, RedirectAttributes rttr) {
		
		service.write(feed);
		System.out.println("아직 유저때문에 !!! "+service.write(feed));
		
		return "redirect:/sns/newsfeed";
	}
	
	@ResponseBody
	@GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> list() {
		Map<String, Object> returnData = new HashMap<String, Object>();
		
		returnData.put("feedList", service.listAll());
		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
	
	@GetMapping(value = "/delete")
	public String delete(int feedSeq, RedirectAttributes rttr) {
		
		service.deleteFeed(feedSeq);
		System.out.println("아직 유저때문에 !!! "+service.deleteFeed(feedSeq));
		
		return "redirect:/sns/newsfeed";
	}
	
}
