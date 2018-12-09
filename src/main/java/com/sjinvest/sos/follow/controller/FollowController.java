package com.sjinvest.sos.follow.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	// follow 추가 여기부터 시작!!!
	/*@GetMapping("/add")	
	public String add(String userSeq, HttpServletRequest request) {

		log.info("add : " + userSeq);
		
		// 수정시작
		Follow follow = new Follow();
		//System.out.println("받아온 user 정보: "+user);
		
		String userId = (String) request.getAttribute("userId");
		boolean result = service.create(follow);
		//System.out.println("수정된 user 결과: "+ result);

		return "redirect:/sns/newfeed";
	}
	*/
	@ResponseBody
	@GetMapping(value = "/add", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> add(String followUserId, int userSeq) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		
		
		System.out.println("팔로잉 추가할 유저아이디: "+followUserId);
		
		Follow follow = new Follow();
		
		int followUserSeq = userService.readById(followUserId).getUserSeq();
		
		System.out.println("나의 seq: "+userSeq);
		System.out.println("너의 seq: "+followUserSeq);
		
		follow.setFollowUserSeq(followUserSeq);
		follow.setUserSeq(userSeq);
		
		returnData.put("addResult", service.create(follow));
		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
	
	
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
	
	@ResponseBody
	@GetMapping(value = "/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> delete(String followUserId, int userSeq) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		
		
		System.out.println("팔로잉 삭제할 유저아이디: "+followUserId);
		
		Follow follow = new Follow();
		
		int followUserSeq = userService.readById(followUserId).getUserSeq();
		
		//System.out.println("나의 seq: "+userSeq);
		//System.out.println("너의 seq: "+followUserSeq);
		
		follow.setFollowUserSeq(followUserSeq);
		follow.setUserSeq(userSeq);
		
		//System.out.println("팔로잉 삭제 결과: "+ service.deleteFollow(follow));

		returnData.put("deleteResult", service.deleteFollow(follow));
		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
	
	
	
	
	
	
	
	

}
