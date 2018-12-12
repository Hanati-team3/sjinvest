package com.sjinvest.sos.wall.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.comment.domain.Comment;
import com.sjinvest.sos.comment.service.CommentService;
import com.sjinvest.sos.feed.domain.Feed;
import com.sjinvest.sos.feed.domain.SearchParam;
import com.sjinvest.sos.feed.service.FeedService;
import com.sjinvest.sos.follow.domain.Follow;
import com.sjinvest.sos.follow.service.FollowService;
import com.sjinvest.sos.user.domain.User;
import com.sjinvest.sos.user.service.UserService;
import com.sjinvest.sos.wall.domain.Wall;
import com.sjinvest.sos.wall.service.WallService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/wall/*")
@AllArgsConstructor
public class WallController {

	private UserService userService;
	private WallService service;
	
	@ResponseBody
	@PostMapping(value = "/write", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> write(HttpSession session, Wall wall, HttpServletRequest request) {
		if(session.getAttribute("user") != null) {
//			System.out.println("네이버 로그인?");
			wall.setWriterUserSeq(((User)session.getAttribute("user")).getUserSeq());
			/*System.out.println(feed.getFeedContent());*/
			if(wall.getWallContent() != "") {
				service.write(wall);
			}
		}
		return listAll(wall.getUserSeq());
	}
	
	@ResponseBody
	@GetMapping(value = "/list/{userSeq}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> listAll(@PathVariable("userSeq")int userSeq) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		List<User> userList = new ArrayList<User>();
		List<Wall> wallList = service.listByUser(1, 10, userSeq);
		for (Wall wall : wallList) {
			userList.add(userService.readBySeq(wall.getWriterUserSeq()));
			
		}
		returnData.put("wallList", wallList);
		returnData.put("userList", userList);
		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}

	@PostMapping(value ="/delete/{userSeq}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> delte(@PathVariable("userSeq")int userSeq, int wallSeq) {
		service.delete(wallSeq);
		return listAll(userSeq);
	}
}
