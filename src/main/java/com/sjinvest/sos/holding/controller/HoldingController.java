package com.sjinvest.sos.holding.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.holding.domain.Holding;
import com.sjinvest.sos.holding.service.HoldingService;
import com.sjinvest.sos.interest.domain.Interest;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/holding/*")
@AllArgsConstructor
public class HoldingController {

	private HoldingService service;
	
	@PostMapping("/regist")
	public String regist(Holding holding, RedirectAttributes rttr) {
		log.info("register : "+ holding);
//		service.modification(holding);
		return "redirect:/holding/list";
	}
	
	/** 주식 interest 화면 요청*/
	@GetMapping(value="/list", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> list(String userSeq) {
		Map<String, Object> returnData = new Hashtable<String, Object>();
		if(userSeq != "") {
			List<Holding> list = service.listByUser(Integer.parseInt(userSeq));
			
			//System.out.println("관심종목: "+list);
			returnData.put("holdingList", list);
			return new ResponseEntity<>(returnData, HttpStatus.OK);
		}else {
			returnData.put("fail", "");
			return new ResponseEntity<>(returnData,HttpStatus.OK);
		}
	}
}
