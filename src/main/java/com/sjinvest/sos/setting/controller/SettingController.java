package com.sjinvest.sos.setting.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.setting.domain.Setting;
import com.sjinvest.sos.setting.service.SettingService;
import com.sjinvest.sos.user.domain.User;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/setting/*")
@AllArgsConstructor
public class SettingController {

	private SettingService service;
	
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

	// call stack size 오류.. 
	@GetMapping("/update")	
	public String update(String setFeedNotice, String setTradeNotice, String setPrivacy, String setView, int userSeq, Setting setting) {
		
		log.info("setting.");
		
		System.out.println("sns setting 유저번호?????: "+userSeq);
		
		int setFeedNotice2 = 2;
		int setTradeNotice2 = 2;
		int setPrivacy2 = 2;
		int setView2 = 2;
		
		
		if(setFeedNotice == "ON") {
			setFeedNotice2 = 1;
		}
		
		if(setTradeNotice == "ON") {
			setTradeNotice2 = 1;
		}
		
		if(setPrivacy == "ON") {
			setPrivacy2 = 1;
		}
		
		if(setView == "ON") {
			setView2 = 1;
		}
		
		setting.setSetFeedNotice(setFeedNotice2);
		setting.setSetFeedNotice(setTradeNotice2);
		setting.setSetFeedNotice(setPrivacy2);
		setting.setSetFeedNotice(setView2);
		
		service.update(setting);
		System.out.println("result qqqq"+ service.update(setting));
		
		return "redirect:/sns/mypage_index";
	}
	

	
}
