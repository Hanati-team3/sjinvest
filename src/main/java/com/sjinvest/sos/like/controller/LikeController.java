package com.sjinvest.sos.like.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	
	@PostMapping("/handle")
	public ResponseEntity<Integer> add(int userSeq, int feedSeq, RedirectAttributes rttr, RedirectAttributes reAttributes) {
		System.out.println(userSeq);
		Like like = new Like();
		like.setFeedSeq(feedSeq);
		like.setUserSeq(userSeq);
//		유저 아닐 때 처리하는 거 없음
		if(service.check(like)){
			service.delete(like);
		}else {
			service.add(like);
		}
		int likeList = service.checkCount(feedSeq);
		return new ResponseEntity<>(likeList,HttpStatus.OK);
	}
}
