package com.sjinvest.sos.stock.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjinvest.sos.company.domain.Company;
import com.sjinvest.sos.company.service.CompanyService;
import com.sjinvest.sos.field.service.FieldService;
import com.sjinvest.sos.holding.service.HoldingService;
import com.sjinvest.sos.interest.domain.Interest;
import com.sjinvest.sos.interest.service.InterestService;
import com.sjinvest.sos.notice.service.NoticeService;
import com.sjinvest.sos.point.service.PointService;
import com.sjinvest.sos.setting.service.SettingService;
import com.sjinvest.sos.stock.domain.News;
import com.sjinvest.sos.stock.domain.Stock;
import com.sjinvest.sos.stock.domain.TimeSeries;
import com.sjinvest.sos.stock.service.StockService;
import com.sjinvest.sos.trading.domain.Trading;
import com.sjinvest.sos.trading.service.TradingService;
import com.sjinvest.sos.user.domain.User;
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
	public String company(@PathVariable("companyNumber") String companyNumber, Model model, HttpServletRequest request) {
		Company company = companyService.readByNumber(companyNumber);
		List<News> news= service.getNewsList(company.getCompanyName()); 
		String userId = (String)request.getAttribute("userId");
		if(userId != null) {
			User user = userService.readById(userId);
			model.addAttribute("userSeq", user.getUserSeq());
			model.addAttribute("isInterest",interestService.check(user.getUserSeq(), companyNumber));
		}else {
			model.addAttribute("isInterest",false);
		}
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
		return new ResponseEntity<>(service.getCompanyData(companyNumber, 1),HttpStatus.OK);
//		return new ResponseEntity<>(returnData,HttpStatus.OK);

	}	
	@ResponseBody
	@PostMapping(value = "/company/getchartdata", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<TimeSeries> getChartData(String companyNumber, String type) {
		return new ResponseEntity<>(service.getTimeSeries(companyNumber, type),HttpStatus.OK);
	}
	@ResponseBody
	@PostMapping(value = "/getStocklist", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> getStockDataList(String[] companyNumberList) {
		ArrayList<String> companyList = new ArrayList<String>(Arrays.asList(companyNumberList));
		return new ResponseEntity<>(service.getForSearchResult(companyList),HttpStatus.OK);
	}
	@RequestMapping(value="/search" , method = {RequestMethod.GET, RequestMethod.POST})
	public String search(String keyword, Model model, HttpServletRequest request) {
		String userId = (String)request.getAttribute("userId");
		if(userId != null) {
			User user = userService.readById(userId);
			model.addAttribute("interestList",interestService.listByUser(user.getUserSeq()));
		}
		model.addAttribute("companyList", companyService.search(keyword));
		return "stock/stock-search-result";
	}
	@RequestMapping(value="/trade-list" , method = {RequestMethod.GET, RequestMethod.POST})
	public String tradeList(String userId, Model model) {
		User user = userService.readById("suhyeon");
		int count = tradingService.countByUser(user.getUserSeq(), 0, null, null, 0, 0);
		model.addAttribute("tradingList", tradingService.listByUser(user.getUserSeq(), 0, null, null, 0, 0));
		return "stock/stock-trade-list";
	}
	@ResponseBody
	@PostMapping(value = "/company/addInterest", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> addInterest(String companyNumber, String companyName, HttpServletRequest request) {
		User user = userService.readById((String)request.getAttribute("userId"));
		Interest interest = new Interest();
		interest.setCompanyName(companyName);
		interest.setCompanyNumber(companyNumber);
		interest.setUserSeq(user.getUserSeq());
		boolean result = interestService.add(interest);
		Map<String, Object> returnValue = new HashMap<String, Object>();
		returnValue.put("message", ""+result);
		return new ResponseEntity<>(returnValue, HttpStatus.OK);
	}
	@ResponseBody
	@PostMapping(value = "/company/removeInterest", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> removeInterest(String companyNumber, String companyName, HttpServletRequest request) {
		User user = userService.readById((String)request.getAttribute("userId"));
		Interest interest = new Interest();
		interest.setCompanyName(companyName);
		interest.setCompanyNumber(companyNumber);
		interest.setUserSeq(user.getUserSeq());
		boolean result = interestService.delete(interest);
		Map<String, Object> returnValue = new HashMap<String, Object>();
		returnValue.put("message", ""+result);
		return new ResponseEntity<>(returnValue, HttpStatus.OK);
	}
	@ResponseBody
	@PostMapping(value = "/company/purchase", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> purchase(int userSeq, String companyNumber, String companyName, int tradingAmount, int tradingPrice) {
		Trading trading = new Trading();
		trading.setCompanyName(companyName);
		trading.setCompanyNumber(companyNumber);
		trading.setTradingAmount(tradingAmount);
		trading.setTradingPrice(tradingPrice);
		trading.setTradingType(1);
		trading.setUserSeq(userSeq);
		boolean result = tradingService.create(trading);
		Map<String, Object> returnValue = new HashMap<String, Object>();
		returnValue.put("message", ""+result);
		return new ResponseEntity<>(returnValue, HttpStatus.OK);
	}
	
	// 여기서부터 예겸이 작업 go
	
}
