package com.sjinvest.sos.setting.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjinvest.sos.setting.domain.Setting;
import com.sjinvest.sos.setting.service.SettingService;
import com.sjinvest.sos.user.domain.User;
import com.sjinvest.sos.user.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/setting/*")
@AllArgsConstructor
public class SettingController {

	private SettingService service;
	private UserService userService;
	
	@ResponseBody
	@GetMapping(value = "/read", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> read(int userSeq) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		System.out.println("sns setting 유저번호: "+userSeq);
		
		String setFeedNotice = null;
		String setTradeNotice = null;
		String setPrivacy = null;
		String setView = null;
		
		if(service.read(userSeq).getSetFeedNotice() == 1) {
			setFeedNotice = "ON";
		}
		if(service.read(userSeq).getSetTradeNotice() == 1) {
			setTradeNotice = "ON";
		}
		if(service.read(userSeq).getSetPrivacy() == 1) {
			setPrivacy = "ON";
		}
		if(service.read(userSeq).getSetView() == 1) {
			setView = "ON";
		}
		
		returnData.put("setFeedNotice", setFeedNotice);
		returnData.put("setTradeNotice", setTradeNotice);
		returnData.put("setPrivacy", setPrivacy);
		returnData.put("setView", setView);

		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping(value = "/update", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> update(HttpSession session, String setFeedNotice, String setTradeNotice, String setPrivacy, String setView) {
		Map<String, Object> returnData = new HashMap<String, Object>();

		log.info("setting.sns.");
		System.out.println("sns setting 유저번호: "+session.getAttribute("user"));
		
		User user = (User)session.getAttribute("user");
		int userSeq = user.getUserSeq();
		
		Setting setting = new Setting();
		
		if(setFeedNotice == "ON") {
			setting.setSetFeedNotice(1);
		}else {
			setting.setSetFeedNotice(2);
		}

		if(setTradeNotice == "ON") {
			setting.setSetTradeNotice(1);			
		}else {
			setting.setSetTradeNotice(2);			
		}
		
		if(setPrivacy == "ON") {
			setting.setSetPrivacy(1);
		}else{
			setting.setSetPrivacy(2);
		}
		
		if(setView == "ON") {
			setting.setSetView(1);
		}else {
			setting.setSetView(2);
		}
		
		setting.setUserSeq(userSeq);
		service.update(setting);
		
		System.out.println("setting업데이트확인 : "+setting);
		
		returnData.put("setFeedNotice", setFeedNotice);
		returnData.put("setTradeNotice", setTradeNotice);
		returnData.put("setPrivacy", setPrivacy);
		returnData.put("setView", setView);

		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
	
	@PostMapping("/reset")	
	public String reset(String password, HttpServletRequest request) {
		
		log.info("setting.stock.");
		
		String userId = (String) request.getAttribute("userId");
		User user = userService.readById(userId);

		if(user.getUserPw().equals(password)) {
			
			user.setUserMoney(50000000);
			userService.updateUser(user);
		}
		
		return "redirect:/sns/mypage_index";
	}
	

	
}
