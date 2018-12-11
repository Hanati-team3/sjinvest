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

	private FeedService feedService;
	private UserService userService;
	private CommentService commentService;
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
		return listAll();
	}
	
	@ResponseBody
	@GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> listAll() {
		Map<String, Object> returnData = new HashMap<String, Object>();
		List<User> userList = new ArrayList<User>();
		List<User> replyUser = new ArrayList<User>();
		List<Feed> feedList = feedService.listAll();
		List<Comment> commentList = new ArrayList<Comment>();
		for (Feed feed : feedList) {
			userList.add(userService.readBySeq(feed.getUserSeq()));
			List<Comment> comments = commentService.listByFeed(feed.getFeedSeq());
			for (Comment comment : comments) {
				commentList.add(comment);
				replyUser.add(userService.readBySeq(comment.getUserSeq()));
			}
		}
		returnData.put("feedList", feedList);
		returnData.put("userList", userList);
		returnData.put("replyList", commentList);
		returnData.put("replyUser", replyUser);
		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}

}
