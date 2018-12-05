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
		
		System.out.println("어떤 타입일까??"+service.read(userSeq).getSetFeedNotice());
		
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

	@GetMapping("/update")	
	public String update(Setting setting, RedirectAttributes rttr) {
		
		log.info("setting : "+ setting);
		boolean result = service.update(setting);
		System.out.println("정보수정결과: "+ result);
		
		return "redirect:/sns/mypage_index";
	}
}
