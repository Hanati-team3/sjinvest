package com.sjinvest.sos.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.comment.domain.Comment;
import com.sjinvest.sos.comment.service.CommentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/comment/*")
@AllArgsConstructor
public class CommentController {
	
	private CommentService service;
	
	@PostMapping("/writing")
	public String writing(Comment comment, RedirectAttributes rttr) {
		log.info("register : "+comment);
		service.Create(comment);
		return "redirect:/comment/list";
	}
	
}
