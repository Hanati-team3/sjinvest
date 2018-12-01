package com.sjinvest.sos.stock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.company.domain.Company;
import com.sjinvest.sos.company.service.CompanyService;
import com.sjinvest.sos.stock.service.StockService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/stock/*")
@AllArgsConstructor
public class StockController {

	private StockService service;
	private CompanyService companyService;
	
	@GetMapping("/company/{companyNumber}")
	public String writing(@PathVariable("companyNumber") String companyNumber, RedirectAttributes rttr) {
//		rttr.addAttribute("company", companyService.readByNumber(companyNumber));
		return "/stock/index";
	}
	
	@GetMapping("/search")
	public ResponseEntity<List<Company>> search(@RequestParam String keyword) {
		List<Company> companyList= companyService.search(keyword);
		return new ResponseEntity<>(companyList, HttpStatus.OK);
	}
	
//	@GetMapping("/trade-list")
//	public ResponseEntity<List<Company>> list(@RequestParam String keyword) {
//		List<Company> companyList= companyService.search(keyword);
//		return new ResponseEntity<>(companyList, HttpStatus.OK);
//	}
//	@GetMapping("/list")
//	public String writing(Feed feed, RedirectAttributes rttr) {
//		service.write(feed);
//		return "redirect:/feed/list";
//	}
}
