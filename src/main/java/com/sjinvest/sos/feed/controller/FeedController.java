package com.sjinvest.sos.feed.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@PostMapping("/writting")
	public String writing(Feed feed, RedirectAttributes rttr) {
		rttr.addAttribute("result", service.write(feed));
		return "redirect:/sns/newsfeed";
	}
	
//	@GetMapping("/list")
//	public String writing(Feed feed, RedirectAttributes rttr) {
//		service.write(feed);
//		return "redirect:/feed/list";
//	}
}
