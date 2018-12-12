package com.sjinvest.sos.feed.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
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
import com.sjinvest.sos.like.domain.Like;
import com.sjinvest.sos.user.domain.User;
import com.sjinvest.sos.user.service.UserService;
import com.sjinvest.sos.wall.domain.Wall;

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
			
//			해시태그 추출하기
			/*String content = feed.getFeedContent();
		    Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)"); 
		    Matcher m = p.matcher(content);
		    String extractHashTag = null;
		    while(m.find()) {
		    	extractHashTag = sepcialCharacter_replace(m.group());
		    	content = content.replace("#"+extractHashTag, "<a src=\\\"\\\" style=\\\"color:black\\\"><span class=\"hashtag\">#"+extractHashTag+"</span></a>");
//		    	if(extractHashTag != null) {
//		    		System.out.println("최종 추출 해시태그 : "+ extractHashTag);
//		    	}
		    }
		    p = Pattern.compile("\\@([0-9a-zA-Z가-힣]*)"); 
		    m = p.matcher(content);
		    while(m.find()) {
		    	extractHashTag = sepcialCharacter_replace(m.group());
		    	content = content.replace("@"+extractHashTag, "<a src=\"\" style=\"color:black\"><span class=\"hashtag\">@"+extractHashTag+"</span></a>");
		    }
		    p = Pattern.compile("\\$([0-9a-zA-Z가-힣]*)"); 
		    m = p.matcher(content);
		    while(m.find()) {
		    	extractHashTag = sepcialCharacter_replace(m.group());
		    	content = content.replace("$"+extractHashTag, "<a src=\\\"\\\" style=\\\"color:black\\\"><span class=\"hashtag\">$"+extractHashTag+"</span></a>");
		    }
		    if(content != "") {
		    	feed.setFeedContent(content);
		    }
		    System.out.println(feed);*/
			/*System.out.println(feed.getFeedContent());
			System.out.println(feed.getFeedContent().replaceAll("\n", "<br>"));
			feed.setFeedContent(feed.getFeedContent().replaceAll("\r\n", "<br>"));*/
		    feedService.write(feed);
		}
		return listAll();
	}
		
	public String sepcialCharacter_replace(String str) {
	    str = StringUtils.replaceChars(str, "-_+=!@#$%^&*()[]{}|\\;:'\"<>,.?/~`） ","");
	    if(str.length() < 1) {
	    	return null;
	    }
	    return str;
	}
	
	@ResponseBody
	@GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> listAll() {
		Map<String, Object> returnData = new HashMap<String, Object>();
		List<User> userList = new ArrayList<User>();
		List<User> replyUser = new ArrayList<User>();
		
		SearchParam searchParam = new SearchParam();
		searchParam.setStartNum(1);
		searchParam.setEndNum(10);
		
//		더보기 어떻게 할까....
		
		List<Feed> feedList = feedService.listBySearchPage(searchParam);
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
	@GetMapping(value = "/listmore", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> listMore(int startNum) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		List<User> userList = new ArrayList<User>();
		List<User> replyUser = new ArrayList<User>();
		
		SearchParam searchParam = new SearchParam();
		searchParam.setStartNum(1);
		searchParam.setEndNum(startNum+9);
		
		List<Feed> feedList = feedService.listBySearchPage(searchParam);
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
		if(text.charAt(0) == '$' || text.charAt(0) == '@' ) {
			List<String> list = new ArrayList<>();
			list.add(text);
			searchParam.setKeywords(list);
			feedList = feedService.listBySearchPage(searchParam);
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
	
	@PostMapping("/updateImage")	
	public String updateImage(HttpServletRequest request, HttpSession session) {

		log.info("updateImage : ");
		
		User user = (User)session.getAttribute("user");
		int userSeq = user.getUserSeq();
		String feedImage = request.getParameter("file2");

		Feed feed = new Feed();
		
		feed.setUserSeq(userSeq);
		feed.setFeedPicture(feedImage);
		
		boolean result = feedService.updateFeed(feed);
		
/*		session.removeAttribute("user");
		session.setAttribute("user", user);
*/
		return "redirect:/sns/newfeed";
	}

}
