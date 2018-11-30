package com.sjinvest.sos.like.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.like.domain.Like;
import com.sjinvest.sos.like.service.LikeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/like/*")
@AllArgsConstructor
public class LikeController {

	private LikeService service;
	
	@PostMapping("/add")
	public String add(Like like, RedirectAttributes rttr) {
		log.info("register : "+ like);
		service.add(like);
		return "redirect:/interest/list";
	}
}
