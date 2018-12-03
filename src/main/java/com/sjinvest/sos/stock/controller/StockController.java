package com.sjinvest.sos.stock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjinvest.sos.company.domain.Company;
import com.sjinvest.sos.company.service.CompanyService;
import com.sjinvest.sos.field.service.FieldService;
import com.sjinvest.sos.holding.service.HoldingService;
import com.sjinvest.sos.interest.service.InterestService;
import com.sjinvest.sos.notice.service.NoticeService;
import com.sjinvest.sos.point.service.PointService;
import com.sjinvest.sos.setting.service.SettingService;
import com.sjinvest.sos.stock.domain.AskingPrice;
import com.sjinvest.sos.stock.domain.News;
import com.sjinvest.sos.stock.service.StockService;
import com.sjinvest.sos.trading.service.TradingService;
import com.sjinvest.sos.user.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/stock/*")
@AllArgsConstructor
public class StockController {

	private StockService service;
	private CompanyService companyService;
	private FieldService fieldService;
	private HoldingService holdingService;
	private InterestService interestService;
	private NoticeService noticeService;
	private PointService pointService;
	private SettingService settingService;
	private TradingService tradingService;
	private UserService userService;
	
    // company, search, trade-list 남수현

	@GetMapping("/company/{companyNumber}")
	public String company(@PathVariable("companyNumber") String companyNumber, Model model) {
		Company company = companyService.readByNumber(companyNumber);
		List<News> news= service.getNewsList(company.getCompanyName()); 
		model.addAttribute("company", company);
		model.addAttribute("news", news);
		model.addAttribute("chartData",service.getTimeSeries(companyNumber, ""));
		return "stock/stock-company";
	}
	@ResponseBody
	@PostMapping(value = "/company/getdata", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> getData(String companyNumber, String companyName) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		returnData.put("stockInfo", service.getStockInfo(companyNumber, companyName));
		returnData.put("askingPrice", service.getAskingPrice(companyNumber));
		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}	
	@GetMapping("/search")
	public ResponseEntity<List<Company>> search(@RequestParam String keyword) {
		List<Company> companyList= companyService.search(keyword);
		return new ResponseEntity<>(companyList, HttpStatus.OK);
	}
	
	
	// 여기서부터 예겸이 작업 go
	
}
