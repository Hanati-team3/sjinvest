package com.sjinvest.sos.comment.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.comment.domain.Comment;
import com.sjinvest.sos.comment.service.CommentService;
import com.sjinvest.sos.feed.controller.FeedController;
import com.sjinvest.sos.feed.service.FeedService;
import com.sjinvest.sos.user.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/comment/*")
@AllArgsConstructor
public class CommentController {
	
	private CommentService service;
	private FeedController feedController;
	private FeedService feedService;
	
	@PostMapping("/writing")
	public ResponseEntity<Map<String,Object>> writing(HttpServletRequest request, Comment comment) {
		log.info("register : "+comment);
		service.Write(comment);
		/*return "redirect:/comment/list";*/
		return feedController.listAll();
	}
	
	@PostMapping("/delete")
	public ResponseEntity<Map<String,Object>> delete(HttpServletRequest request, Comment comment) {
		/*System.out.println(comment.getCommentSeq());*/
		service.deleteComment(comment);
		/*return "redirect:/comment/list";*/
		return feedController.listAll();
	}
}
