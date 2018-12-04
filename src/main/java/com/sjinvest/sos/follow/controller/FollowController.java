package com.sjinvest.sos.follow.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.follow.domain.Follow;
import com.sjinvest.sos.follow.service.FollowService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/follow/*")
@AllArgsConstructor
public class FollowController {

	private FollowService service;
	
	@ResponseBody
	@GetMapping(value = "/followList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> followList(int userSeq) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		System.out.println("팔로잉 유저번호: "+ userSeq);
		returnData.put("followList", service.listByUserFollow(userSeq));

		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping(value = "/followerList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> followerList(int userSeq) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		System.out.println("팔로워 유저번호: "+userSeq);
		returnData.put("followerList", service.listByUserFollower(userSeq));

		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
	
	// 아직 완성xxx
	@ResponseBody
	@GetMapping(value = "/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> delete(Follow follow) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		System.out.println("팔로잉 삭제할 유저번호: "+follow.getFollowUserSeq());
		returnData.put("delete", service.deleteFollow(follow));

		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}

}
