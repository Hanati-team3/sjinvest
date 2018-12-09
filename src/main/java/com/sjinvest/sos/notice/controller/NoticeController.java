package com.sjinvest.sos.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.notice.domain.Notice;
import com.sjinvest.sos.notice.service.NoticeService;
import com.sjinvest.sos.user.domain.User;
import com.sjinvest.sos.user.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {

	private NoticeService service;
	private UserService userService;

	@PostMapping("/add")
	public String add(Notice notice, RedirectAttributes rttr) {
		log.info("register : " + notice);
		service.create(notice);
		return "redirect:/notice/list";
	}

	@ResponseBody
	@GetMapping(value = "/snsList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> snsList(String userId, HttpServletRequest request) {
		Map<String, Object> returnData = new HashMap<String, Object>();

		// System.out.println("notice 유저번호: "+userSeq);
		// System.out.println("notice: "+service.listByUser(userSeq));
		
		List<Notice> snsList = new ArrayList<>();
		List<Notice> snsList2 = new ArrayList<>();

		if (userId != "") {
			User user = userService.readById(userId);
			int userSeq = user.getUserSeq();

			snsList = service.listByUser(userSeq);

			for (int i = 0; i < snsList.size(); i++) {
				if (snsList.get(i).getNoticeType() == 1) {
					snsList2.add(snsList.get(i));
				}
			}
			returnData.put("snsList", snsList2);
		}else{
			returnData.put("fail", "notUser");
		}
		
		
		return new ResponseEntity<>(returnData, HttpStatus.OK);

	}

	@ResponseBody
	@GetMapping(value = "/stockList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> stockList(String userId, HttpServletRequest request) {
		Map<String, Object> returnData = new HashMap<String, Object>();

		// System.out.println("notice 유저번호: "+userSeq);
		// System.out.println("notice: "+service.listByUser(userSeq));

		List<Notice> stockList2 = new ArrayList<>();
		List<Notice> stockList = new ArrayList<>();
		if (userId != "") {
			User user = userService.readById(userId);
			int userSeq = user.getUserSeq();

			stockList = service.listByUser(userSeq);

			for (int i = 0; i < stockList.size(); i++) {
				if (stockList.get(i).getNoticeType() == 2) {
					stockList2.add(stockList.get(i));
				}
			}

			returnData.put("stockList", stockList2);
		}else{
			returnData.put("fail", "notUser");
		}
		
		return new ResponseEntity<>(returnData, HttpStatus.OK);
	}
}
