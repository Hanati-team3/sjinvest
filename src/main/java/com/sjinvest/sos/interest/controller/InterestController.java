package com.sjinvest.sos.interest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.interest.domain.Interest;
import com.sjinvest.sos.interest.service.InterestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/interest/*")
@AllArgsConstructor
public class InterestController {

	private InterestService service;
	
	@PostMapping("/add")
	public ResponseEntity<String> add(Interest interest) {
		log.info("register : "+ interest);
		service.add(interest);
		return  new ResponseEntity<>("success",HttpStatus.OK);
	}
	
	@PostMapping("delete")
	public ResponseEntity<String> delete(Interest interest) {
		log.info("delete : "+ interest);
		service.delete(interest);
		return new ResponseEntity<>("success",HttpStatus.OK);
	}
}
