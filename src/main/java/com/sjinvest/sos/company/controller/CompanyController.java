package com.sjinvest.sos.company.controller;

import java.awt.PageAttributes.MediaType;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.company.domain.Company;
import com.sjinvest.sos.company.service.CompanyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/company/*")
@AllArgsConstructor
public class CompanyController {

	private CompanyService service;
	
	@PostMapping("/regist")
	public String regist(Company company, RedirectAttributes rttr) {
		log.info("register : "+company);
		return "redirect:/company/list";
	}
	
	@GetMapping("/list" )
	public ResponseEntity<List<Company>> list() {
		log.info("company list");
		return new ResponseEntity<>(service.list(),HttpStatus.OK);
	}

}
