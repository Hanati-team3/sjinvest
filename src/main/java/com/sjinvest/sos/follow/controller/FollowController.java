package com.sjinvest.sos.follow.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjinvest.sos.follow.domain.Follow;
import com.sjinvest.sos.follow.service.FollowService;
import com.sjinvest.sos.user.domain.User;
import com.sjinvest.sos.user.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/follow/*")
@AllArgsConstructor
public class FollowController {

	private FollowService service;
	private UserService userService;
	
	@ResponseBody
	@GetMapping(value = "/followList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> followList(String userSeq) {

		//System.out.println("팔로잉 유저번호: "+ userSeq);
		Map<String, Object> returnData = new HashMap<String, Object>();
		if(userSeq != "") {
			List<Follow> followList = service.listByUserFollow(Integer.parseInt(userSeq));
			List<Integer> userSeqList = new ArrayList<Integer>();
			if(followList.size() != 0) {
				for(Follow follow : followList) {
					userSeqList.add(follow.getFollowUserSeq());
				}
				List<User> userList = userService.readBySeqList(userSeqList);
				
				returnData.put("followList", userList);
				return new ResponseEntity<>(returnData,HttpStatus.OK);
			}
		}
		returnData.put("fail", "");
		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping(value = "/followerList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> followerList(String userSeq) {

		//System.out.println("팔로워 유저번호: "+userSeq);
		Map<String, Object> returnData = new HashMap<String, Object>();
		if(userSeq != "") {
			List<Follow> followerList = service.listByUserFollower(Integer.parseInt(userSeq));
			List<Integer> userSeqList = new ArrayList<Integer>();
			if(followerList.size() != 0) {
				for(Follow follower : followerList) {
					userSeqList.add(follower.getUserSeq());
				}
				List<User> userList = userService.readBySeqList(userSeqList);
				
				returnData.put("followerList", userList);
				return new ResponseEntity<>(returnData,HttpStatus.OK);
			}
		}
		returnData.put("fail", "");
		return new ResponseEntity<>(returnData,HttpStatus.OK);
		
	}
	
	// 아직 완성xxx
	@ResponseBody
	@GetMapping(value = "/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> delete(Follow follow, String followUserId) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		System.out.println("팔로잉 삭제할 유저아이디: "+followUserId);
		
		//returnData.put("delete", service.deleteFollow(follow));

		return null;
				//new ResponseEntity<>(returnData,HttpStatus.OK);
	}

}
