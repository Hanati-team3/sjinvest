package com.sjinvest.sos.feed.controller;

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

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/feed/*")
@AllArgsConstructor
public class FeedController {

	private FeedService feedService;
	private UserService userService;
	private CommentService commentService;
	private FollowService service;
	
	@ResponseBody
	@PostMapping(value = "/write", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> write(HttpSession session, Feed feed, HttpServletRequest request) {
		if(session.getAttribute("user") != null) {
//			System.out.println("네이버 로그인?");
			feed.setUserSeq(((User)session.getAttribute("user")).getUserSeq());
			/*System.out.println(feed.getFeedContent());*/
			if(feed.getFeedContent() != "") {
				feedService.write(feed);
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
	@ResponseBody
	@GetMapping(value = "/follow", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> listFollow(HttpServletRequest request) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		List<User> userList = new ArrayList<User>();
		List<User> replyUser = new ArrayList<User>();
		List<Feed> feedList = new ArrayList<Feed>();
		List<Comment> commentList = new ArrayList<Comment>();
		SearchParam searchParam = new SearchParam();
		searchParam.setStartNum(1);
		searchParam.setEndNum(10);
		
		if(request.getAttribute("userId") != null) {
			int userSeq = userService.readById((String)request.getAttribute("userId")).getUserSeq();
			List<Follow> followList = service.listByUserFollow(userSeq);
			List<Integer> tempList = new ArrayList<Integer>();
			if(followList.size() != 0) {
				for (Follow follow : followList) {
					tempList.add(follow.getUserSeq());
				}
				feedList = feedService.listBySearchPageByFieldName(1, 10, tempList);
			}
			for (Feed feed : feedList) {
				userList.add(userService.readBySeq(feed.getUserSeq()));
				List<Comment> comments = commentService.listByFeed(feed.getFeedSeq());
				for (Comment comment : comments) {
					commentList.add(comment);
					replyUser.add(userService.readBySeq(comment.getUserSeq()));
				}
			}
		}
		returnData.put("feedList", feedList);
		returnData.put("userList", userList);
		returnData.put("replyList", commentList);
		returnData.put("replyUser", replyUser);
		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}

	@ResponseBody
	@GetMapping(value = "/own", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> listOwn(HttpServletRequest request) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		List<User> userList = new ArrayList<User>();
		List<User> replyUser = new ArrayList<User>();
		List<Feed> feedList = new ArrayList<Feed>();
		List<Comment> commentList = new ArrayList<Comment>();
		SearchParam searchParam = new SearchParam();
		searchParam.setStartNum(1);
		searchParam.setEndNum(10);
//		System.out.println((String)request.getAttribute("userId"));
		
		if(request.getAttribute("userId") != null) {
			searchParam.setUserSeq(userService.readById((String)request.getAttribute("userId")).getUserSeq());
			feedList = feedService.listBySearchPage(searchParam);
			for (Feed feed : feedList) {
				userList.add(userService.readBySeq(feed.getUserSeq()));
				List<Comment> comments = commentService.listByFeed(feed.getFeedSeq());
				for (Comment comment : comments) {
					commentList.add(comment);
					replyUser.add(userService.readBySeq(comment.getUserSeq()));
				}
			}
		}
		returnData.put("feedList", feedList);
		returnData.put("userList", userList);
		returnData.put("replyList", commentList);
		returnData.put("replyUser", replyUser);
		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
	
	@PostMapping(value ="/edit", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String edit(int feedSeq, RedirectAttributes rttr) {
		
		
		return "redirect:/sns/newsfeed";
	}
	
	@PostMapping(value ="/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> delte(int feedSeq, RedirectAttributes rttr) {
		if(commentService.listByFeed(feedSeq).size() != 0) {
			System.out.println(commentService.listByFeed(feedSeq));
			commentService.deleteCommentByFeed(feedSeq);
		}
		feedService.deleteFeed(feedSeq);
		return listAll();
	}
	
//	검색
	@ResponseBody
	@PostMapping(value = "/search", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> searchFeed(String text) {
		List<Feed> feedList = null;
		List<User> userList = new ArrayList<User>();
		List<User> replyUser = new ArrayList<User>();
		List<Comment> commentList = new ArrayList<Comment>();
		Map<String,Object> map = new Hashtable<>();
		SearchParam searchParam = new SearchParam();
		searchParam.setStartNum(1);
		searchParam.setEndNum(10);
		if(text.charAt(0) == '$') {
//			searchList = companyMapper.findCompany(term.substring(1));
		}
		else if(text.charAt(0) == '@') {
//			searchList = fieldMapper.findField(term.substring(1));
		}
		else {
			searchParam.setUserSeq(userService.searchUser(text));
			feedList = feedService.listBySearchPage(searchParam);
		}
		for (Feed feed : feedList) {
			userList.add(userService.readBySeq(feed.getUserSeq()));
			List<Comment> comments = commentService.listByFeed(feed.getFeedSeq());
			for (Comment comment : comments) {
				commentList.add(comment);
				replyUser.add(userService.readBySeq(comment.getUserSeq()));
			}
		}
		
//		System.out.println(feedList);
//		System.out.println(userList);
		map.put("feedList", feedList);
		map.put("userList", userList);
		map.put("replyList", commentList);
		map.put("replyUser", replyUser);
        return new ResponseEntity<>(map,HttpStatus.OK);
    }

}
