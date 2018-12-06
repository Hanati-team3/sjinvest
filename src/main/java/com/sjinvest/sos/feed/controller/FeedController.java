package com.sjinvest.sos.feed.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
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

import com.sjinvest.sos.comment.domain.Comment;
import com.sjinvest.sos.comment.service.CommentService;
import com.sjinvest.sos.feed.domain.Feed;
import com.sjinvest.sos.feed.domain.SearchParam;
import com.sjinvest.sos.feed.mapper.FeedMapper;
import com.sjinvest.sos.feed.service.FeedService;
import com.sjinvest.sos.user.domain.User;
import com.sjinvest.sos.user.mapper.UserMapper;
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
	
	@PostMapping(value = "/write")
	public String write(Feed feed, RedirectAttributes rttr) {
//		해당 유저의 정보(seq가 필요함)
//		feed.setUserSeq(userService.readById("").getUserSeq());
		feed.setUserSeq(2);
		feedService.write(feed);
//		System.out.println("아직 유저때문에 !!! "+service.write(feed));
		
		return "redirect:/sns/newsfeed";
	}
	
	@ResponseBody
	@GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> list() {
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
	
	@GetMapping(value = "/delete")
	public String delete(int feedSeq, RedirectAttributes rttr) {
		
		feedService.deleteFeed(feedSeq);
		System.out.println("아직 유저때문에 !!! "+feedService.deleteFeed(feedSeq));
		
		return "redirect:/sns/newsfeed";
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
