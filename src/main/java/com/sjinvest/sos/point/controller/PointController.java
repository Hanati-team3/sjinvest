package com.sjinvest.sos.point.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.point.domain.Point;
import com.sjinvest.sos.point.service.PointService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/point/*")
@AllArgsConstructor
public class PointController {

	private PointService service;
	
	@ResponseBody
	@GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> pointList(int userSeq) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		System.out.println("포인트 유저번호: "+userSeq);
		returnData.put("pointList", service.listByUser(userSeq));

		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
}
