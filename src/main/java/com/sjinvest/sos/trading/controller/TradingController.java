package com.sjinvest.sos.trading.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.trading.domain.Trading;
import com.sjinvest.sos.trading.service.TradingService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/trading/*")
@AllArgsConstructor
public class TradingController {

	private TradingService service;
	
	@PostMapping("/regist")
	public String create(Trading trading, RedirectAttributes rttr) {
		log.info("register : "+ trading);
		service.create(trading);
		return "redirect:/trading/list";
	}
}
