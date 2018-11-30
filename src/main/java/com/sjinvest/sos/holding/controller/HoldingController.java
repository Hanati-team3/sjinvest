package com.sjinvest.sos.holding.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.holding.domain.Holding;
import com.sjinvest.sos.holding.service.HoldingService;

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
}
