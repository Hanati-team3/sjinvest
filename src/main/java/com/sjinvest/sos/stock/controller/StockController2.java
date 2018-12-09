package com.sjinvest.sos.stock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.sjinvest.sos.company.domain.Company;
import com.sjinvest.sos.company.service.CompanyService;
import com.sjinvest.sos.field.service.FieldService;
import com.sjinvest.sos.holding.domain.Holding;
import com.sjinvest.sos.holding.service.HoldingService;
import com.sjinvest.sos.interest.domain.Interest;
import com.sjinvest.sos.interest.service.InterestService;
import com.sjinvest.sos.like.service.LikeService;
import com.sjinvest.sos.notice.service.NoticeService;
import com.sjinvest.sos.point.service.PointService;
import com.sjinvest.sos.setting.service.SettingService;
import com.sjinvest.sos.stock.dao.StockDao;
import com.sjinvest.sos.stock.params.HoldingListParams;
import com.sjinvest.sos.stock.params.IndexChartParams;
import com.sjinvest.sos.stock.params.IndexParams;
import com.sjinvest.sos.stock.domain.News;
import com.sjinvest.sos.stock.domain.Stock;
import com.sjinvest.sos.stock.domain.TimeSeries;
import com.sjinvest.sos.stock.service.StockService;
import com.sjinvest.sos.trading.service.TradingService;
import com.sjinvest.sos.user.domain.User;
import com.sjinvest.sos.user.service.UserService;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/stock/*")
@AllArgsConstructor
public class StockController2 {

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
	
	@GetMapping(value="/realtime", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Stock>> realtime() {
		return new ResponseEntity<>(service.stockRealtime(),HttpStatus.OK);
	}
	
	/** 주식 index 화면 요청*/
	@GetMapping(value="/index", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String index(Model model, HttpServletRequest request) {
		System.out.println("index....");
		System.out.println("user : " + request.getSession().getAttribute("user"));
		User user = (User)request.getSession().getAttribute("user");
		if(user == null) {
			System.out.println("user null. test user suhyeon");
			user = userService.readById("suhyeon");
		}
		request.setAttribute("user", user);
		
		List<Holding> holdingList = new ArrayList<>();					/* 보유자산 리스트 */
		List<String> interestCompanyNumberList = new ArrayList<>();		/* 관심종목에 있는 종목 번호 리스트 */
		Map<String, Object> interestMap = new Hashtable<>();	/* 관심종목 Stock리스트와 Chart데이터 */
		Map<String, Object> holdingWidgetMap = null;			/* 보유자산 total, stockTotal, cashTotal, Holding리스트 */
		Map<String, Object> map = null;							/* stock 서비스에서 한번에 받아올 정보 : realTime, topTab, 관심종목 Stock리스트, HoldingMap  */
		
		holdingList = holdingService.listByUser(user.getUserSeq());
		for (Interest interest : interestService.listByUser(user.getUserSeq())) {
			interestCompanyNumberList.add(interest.getCompanyNumber());
		}
		
		TimeSeries interestTimeSeries = service.getChartData(interestCompanyNumberList, 1, 1);
		interestMap.put("interestChart", interestTimeSeries);
		
		map = service.getForIndex(holdingList, interestCompanyNumberList, 1);
		
		System.out.println(2);
		System.out.println(3);
		// realtime
		model.addAttribute("realTime", map.get("realTime"));
		System.out.println(4);
		// 회사 목록
		model.addAttribute("companyList", companyService.list());
		System.out.println(5);
		// 업종별 거래량 카드
		model.addAttribute("fieldStock", service.stockFieldAmount());	// field될 때 수정(지금은 더미값)
		System.out.println(6);
		// 코스피 정보 카드
		model.addAttribute("kospiMap", service.getKospiChartDate(1));
		System.out.println(7);
		// 상승률 상위 5종목
		model.addAttribute("topTab", map.get("topTab"));
		System.out.println(8);
		// 주식 전체 뉴스
		//model.addAttribute("news", service.stockIndexNews());
		System.out.println(9);

		if(user != null) {
			// 관심종목 정보
			interestMap.put("interestList", map.get("interestList"));
			model.addAttribute("interestMap", interestMap);
			System.out.println(10);
			// 내 보유주식 위젯
			holdingWidgetMap = (Map<String, Object>) map.get("holdingWidget");
			System.out.println(11);
			holdingWidgetMap.put("chasTotal", user.getUserMoney());
			holdingWidgetMap.put("total", user.getUserMoney() + (Integer)holdingWidgetMap.get("stockTotal"));
			System.out.println(12);
			model.addAttribute("holdingWidget", holdingWidgetMap);
		}
		// 유저 프로필 위젯
		// 유저 랭킹 위젯
		// 관심종목카드
		System.out.println(map);
		return "stock/stock-index";
	}
	
	/** 주식 index Update 요청*/
	//@ResponseBody
	@PostMapping(value="/index/update", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> indexUpdate(@RequestBody IndexParams params) {
		System.out.println("indexUpdate params : " + params);
		Map<String, Object> map = service.getForIndex(params.getHoldingList(), 
				params.getInterestCompanyNumberList(), params.getTabOption());
		map.put("kospiStock", service.getKospiData());
		map.put("topTabOption", params.getTabOption());
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	/** 상위종목 tab Update 요청*/
	//@ResponseBody
	@PostMapping(value="/index/tab/{type}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Map<String, Object>>> tabUpdate(@PathVariable("type")int type) {
		System.out.println("tabUpdate type : " + type);
		return new ResponseEntity<>(service.stockTop(type+""), HttpStatus.OK);
	}
	
	/** index의 chart update 요청*/
	//@ResponseBody
	@PostMapping(value="/index/chart", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> chartUpdate(@RequestBody IndexChartParams params) {
		System.out.println("chartUpdate : params " + params);
		Map<String, Object> map = new HashMap<>();
		map.put("interestTimeSeries", service.getChartData(params.getInterestCompanyNumberList(), 1, 1));
		map.put("kospiMap", service.getKospiChartDate(params.getKospiOption()));
		return new ResponseEntity<>(map, HttpStatus.OK);
	}

	
	/** 주식 interest 화면 요청*/
	@GetMapping(value="/interest/list", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String interest(Model model, HttpServletRequest request) {
		System.out.println("interest list......");
		System.out.println("user : " + request.getSession().getAttribute("user"));
		User user = (User)request.getSession().getAttribute("user");
		// 원래는 user null이면 관심종목 못들어옴
		if(user == null) {
			System.out.println("user null. test user suhyeon");
			user = userService.readById("suhyeon");
		}
		request.setAttribute("user", user);
		
		List<String> interestCompanyNumberList = new ArrayList<>();		/* 관심종목에 있는 종목 번호 리스트 */
		Map<String, Object> map = null;
		
		for (Interest interest : interestService.listByUser(user.getUserSeq())) {
			interestCompanyNumberList.add(interest.getCompanyNumber());
		}
		map = service.getForSearchResult(interestCompanyNumberList);
		
		// 관심종목 주식 목록
		model.addAttribute("interestStockList", map.get("stockList"));
		// 관심종목 주식 목록
		model.addAttribute("interestNumberList", interestCompanyNumberList);
		// 실시간 순위
		model.addAttribute("realTime", map.get("realTime"));		
		// 회사 목록
		model.addAttribute("companyList", companyService.list());
		// 회사 목록
		//model.addAttribute("news", service.stockIndexNews());

		
		return "stock/stock-interest";
	}
	
	/** 주식 interest 화면 요청*/
	@GetMapping(value="/interest/update", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Stock>> interestUpdate(String[] interestCompanyNumberArray) {
		System.out.println("interestUpdate : array " + interestCompanyNumberArray[0]);
		List<String> interestCompanyNumberList = new ArrayList<>();		/* 관심종목에 있는 종목 번호 리스트 */
		Map<String, Object> map = new HashMap<>();
		for (String string : interestCompanyNumberArray) {
			interestCompanyNumberList.add(string);
		}
		map = service.getForSearchResult(interestCompanyNumberList);
		return new ResponseEntity<>( (List<Stock>)map.get("stockList"), HttpStatus.OK);
	}
	
	/** 주식 holding 리스트 화면 요청*/
	@GetMapping(value="/holding/list", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String holding(Model model, HttpServletRequest request) {
		System.out.println("holding list......");
		User user = (User)request.getSession().getAttribute("user");
		// 원래는 user null이면 관심종목 못들어옴
		if(user == null) {
			System.out.println("user null. test user suhyeon");
			user = userService.readById("suhyeon");
		}
		request.setAttribute("user", user);
		
		List<Holding> holdingList = null;				/* 보유자산 리스트 */
		Map<String, Object> map = null;					/* 서비스의 getHolding이 반환하는 맵을 담을 객체 */
		Map<String, Object> holdingMap = null;			/* 보유자산 total, stockTotal, cashTotal, Holding리스트  담을 맵 */

		
		holdingList = holdingService.listByUser(user.getUserSeq());
		System.out.println("holding 1");
		map = service.getHolding(holdingList);			/* realtime, holdingWidgetMap 들어있는 map반환 */
		System.out.println("holding 에서 받은 맵 : " + map);
		System.out.println("holding 2");
		holdingMap = (Map<String, Object>)map.get("holdingWidget");
		holdingMap.put("cashTotal", user.getUserMoney());
		holdingMap.put("total", user.getUserMoney() + (Integer)holdingMap.get("stockTotal"));
		System.out.println("holding 3");
		model.addAttribute("holdingMap", holdingMap);
		// realtime
		model.addAttribute("realTime", map.get("realTime"));
		// 회사 목록
		model.addAttribute("companyList", companyService.list());
		// 유저 프로필 위젯
		// 유저 랭킹 위젯
		return "stock/stock-holding-list";
	}	
	
	/** 주식 holding 업데이트 요청 */
	@PostMapping(value="/holding/update", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> holdingUpdate(@RequestBody List<Holding> holdingList) {
		System.out.println("holdingUpdate List :  " + holdingList);
		Map<String, Object> map = null;					 /* 서비스의 getHolding이 반환하는 맵을 담을 객체 */ 
		
/*		List<Holding> holdingList = new ArrayList<>();		 관심종목에 있는 종목 번호 리스트 
		for (Holding holding : HoldingArray) {
			holdingList.add(holding);
		}*/
		
		map = service.getHolding(holdingList);			/* realtime, holdingWidgetMap 들어있는 map반환 */
		System.out.println("holdingUpdate 에서 받은 맵 : " + map);
		return new ResponseEntity<>( map, HttpStatus.OK);
	}
}
