package com.sjinvest.sos.stock.controller;

import java.util.ArrayList;
import java.util.Hashtable;
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
import com.sjinvest.sos.stock.domain.IndexParams;
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
@RequestMapping("/stock2/*")
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
	public String index(String userId, Model model) {
		// realtime
		model.addAttribute("realtime", service.stockRealtime());
		// 회사 목록
		model.addAttribute("companyList", companyService.list());
		// 업종별 거래량 카드
		model.addAttribute("fieldStock", service.stockFieldAmount());
		// 코스피 정보 카드
		model.addAttribute("kospi", kospiMethod());
		// 상승률 상위 5종목
		model.addAttribute("topTapJ", service.stockTop("Rising"));
		// 주식 전체 뉴스
		model.addAttribute("news", service.stockIndexNews());
		// 로그인중
		if(userId != null) {
			User user = userService.readById(userId);
			// 내 보유주식 위젯
			model.addAttribute("holdingWidget", holdingWidgetMethod(holdingService.listByUser(user.getUserSeq()), user.getUserMoney()));
			// 유저 프로필 위젯
			// 유저 랭킹 위젯
			// 관심종목카드
			List<String> companyNameList = new ArrayList<>();
			for (Interest interest : interestService.listByUser(user.getUserSeq())) {
				companyNameList.add(interest.getCompanyName());
			}
			model.addAttribute("interestCard", interestCardMethod(companyNameList));
		}
		return "stock/stock-index";
	}
	
	/** 주식 index Update 요청*/
	//@ResponseBody
	@PostMapping(value="/indexUpdate", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> indexUpdate(@RequestBody IndexParams params) {
		System.out.println("indexUpdate params : " + params);
		Map<String, Object> map = new Hashtable<String, Object>();
		// realtime
		map.put("realtime", service.stockRealtime());
		// 업종별 거래량 or 전일대비
		//map.put("fieldAmount", service.stockFieldStock(fieldOption));
		map.put("fieldStock", service.stockFieldAmount());
		// 코스피 정보 카드(원래는 옵션 보내야함)x
		//map.put("kospi",  kospiMethod(kospiOption));
		map.put("kospi", kospiMethod());
		// top 보여주는 탭 정보
		map.put("topTap", service.stockTop(params.getTabOption()));
		// 로그인중
		if(params.getUserId() != null) {
			// 내 보유주식 위젯
			map.put("holdingWidget", holdingWidgetMethod(params.getHoldingList(), params.getCashTotal()));
			// 유저 프로필 위젯
			// 유저 랭킹 위젯
			// 관심종목카드
			map.put("interestCard", interestCardMethod(params.getInterestCompanyNameList()));
		}
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	/** 상위종목 tab Update 요청*/
	//@ResponseBody
	@PostMapping(value="/index/tab/{type}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Map<String, Object>>> tabUpdate(@PathVariable("type")int type) {
		System.out.println("tabUpdate type : " + type);
		return new ResponseEntity<>(service.stockTop(type+""), HttpStatus.OK);
	}
	
	/** 코스피 정보 메소드 */
	private Map<String, Object> kospiMethod() {
		Map<String, Object> kospiMap = new Hashtable<String, Object>();
		Stock kospiStock = service.getStockKospiInfo();
		TimeSeries kospiTimeSeries = service.getStockKospiTimeSeries();
		kospiMap.put("kospiStock", kospiStock);
		kospiMap.put("kospiTimeSeries", kospiTimeSeries);
		return kospiMap;
	}
	
	/** 내 보유주식 위젯 메소드*/
	private Map<String, Object> holdingWidgetMethod(List<Holding> holdingList, int cashTotal) {
		Map<String, Object> holdingWidgetMap = new Hashtable<String, Object>();

		// holdingList의 holding들 수익률, 수익금액, 보유금액 다시 계산해달라고 요청
		// holdingList = service.stockMyHoldingWidget(holdingList);	
		/** 테스트를 위해 임시 데이터 가져옴 */
		holdingList = service.stockMyHoldingWidget();
		int stockTotal = 0;
		for (Holding holding : holdingList) {
			stockTotal += holding.getHoldingTotalMoney();
		}
		
		holdingWidgetMap.put("total", cashTotal + stockTotal);
		holdingWidgetMap.put("stockTotal", stockTotal);
		holdingWidgetMap.put("cashTotal", cashTotal);
		holdingWidgetMap.put("holdingList", holdingList);
		return holdingWidgetMap;
	}
	
	/** 관심종목카드 메소드 */
	private Map<String, Object> interestCardMethod(List<String> companyNameList) {
		Map<String, Object> interestCardMap = new Hashtable<String, Object>();
		List<Stock> stockList = service.getStockList(companyNameList);
		List<TimeSeries> timeSeriesList = service.getTimeSeriesList(companyNameList, "stock");
		interestCardMap.put("stockList", stockList);
		interestCardMap.put("chartList", timeSeriesList);
		return interestCardMap;
	}
	
	///////////////////////////////////테스트용 메소드
	/** 주식 index 화면 요청*/
	@GetMapping(value="/index-temp", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String indexTemp(String userId, Model model) {
		// realtime
		model.addAttribute("realtime", service.stockRealtime());
		// 회사 목록
		model.addAttribute("companyList", companyService.list());
		// 업종별 거래량 카드
		model.addAttribute("fieldStock", service.stockFieldAmount());
		// 코스피 정보 카드
		model.addAttribute("kospi", kospiMethod());
		// 상승률 상위 5종목
		model.addAttribute("topTapJ"
				+ "", service.stockTop("Rising"));
		// 주식 전체 뉴스
		model.addAttribute("news", service.stockIndexNews());
		// 로그인중
		if(userId != null) {
			User user = userService.readById(userId);
			// 내 보유주식 위젯
			model.addAttribute("holdingWidget", holdingWidgetMethod(holdingService.listByUser(user.getUserSeq()), user.getUserMoney()));
			// 유저 프로필 위젯
			// 유저 랭킹 위젯
			// 관심종목카드
			List<String> companyNameList = new ArrayList<>();
			for (Interest interest : interestService.listByUser(user.getUserSeq())) {
				companyNameList.add(interest.getCompanyName());
			}
			model.addAttribute("interestCard", interestCardMethod(companyNameList));
		}
		return "temp/stock-index-test";
	}
	
	/** 주식 index 테스트 ajax */
	@GetMapping(value="/testindex", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> testindex(String userId) {
		Map<String,Object> map = new Hashtable<>();
		// realtime
		map.put("realtime", service.stockRealtime());
		// 회사 목록
		map.put("companyList", companyService.list());
		// 업종별 거래량 카드
		map.put("fieldStock", service.stockFieldAmount());
		// 코스피 정보 카드
		map.put("kospi", kospiMethod());
		// 상승률 상위 5종목
		map.put("topTap", service.stockTop("Rising"));
		// 주식 전체 뉴스
		map.put("news", service.stockIndexNews());
		// 로그인중
		if(userId != null) {
			User user = userService.readById(userId);
			// 내 보유주식 위젯
			map.put("holdingWidget", holdingWidgetMethod(holdingService.listByUser(user.getUserSeq()), user.getUserMoney()));
			// 유저 프로필 위젯
			// 유저 랭킹 위젯
			// 관심종목카드
			List<String> wishNameList = new ArrayList<>();
			for (Interest interest : interestService.listByUser(user.getUserSeq())) {
				wishNameList.add(interest.getCompanyName());
			}
			map.put("wishNameList", wishNameList);
			map.put("interestCard", interestCardMethod(wishNameList));
		}
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
/*	
   //** 내 보유주식 위젯 요청*//*
	@GetMapping(value="/holdingWidget", params= {"userId"}, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> holdingWidget(String userId) {
		User user = userService.readById(userId);
		return new ResponseEntity<>(holdingWidgetMethod(user), HttpStatus.OK);
	}


	
	*//** 업종별 거래량 *//*
	@GetMapping(value="/stockFieldAmount", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Map<String, Object>>> stockFieldAmount() {
		List<Map<String, Object>> list = service.stockFieldAmount();
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	*//** 관심종목카드 *//*
	@GetMapping(value="/interestCard", params= {"userId"}, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> interestCard(String userId) {
		User user = userService.readById(userId);
		return new ResponseEntity<>(interestCardMethod(user), HttpStatus.OK);
	}
	
	
	*//** 코스피 정보 *//*
	@GetMapping(value="/kospi", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> kospi() {
		return new ResponseEntity<>(kospiMethod(), HttpStatus.OK);
	}
	
	*//** 상승률 상위 5개 정보 *//*
	@GetMapping(value="/risingTop", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Map<String, Object>>> risingTop() {
		List<Map<String, Object>> risingList = service.stockTop("Rising");
		return new ResponseEntity<>(risingList, HttpStatus.OK);
	}
	
	*//** 하락률 상위 5개 정보 *//*
	@GetMapping(value="/fallingTop", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Map<String, Object>>> fallingTop() {
		List<Map<String, Object>> fallingList = service.stockTop("Falling");
		return new ResponseEntity<>(fallingList, HttpStatus.OK);
	}
	
	*//** 외국인순매수 상위 5개 정보 *//*
	@GetMapping(value="/foreignTop", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Map<String, Object>>> foreignTop() {
		List<Map<String, Object>> foreignList = service.stockTop("Foreign");
		return new ResponseEntity<>(foreignList, HttpStatus.OK);
	}
	
	*//** 기관순매수 상위 5개 정보 *//*
	@GetMapping(value="/institutionTop", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Map<String, Object>>> institutionTop() {
		List<Map<String, Object>> institutionList = service.stockTop("Institution");
		return new ResponseEntity<>(institutionList, HttpStatus.OK);
	}
	
	*//** 상위 거래량 상위 20개 정보 *//*
	@GetMapping(value="/tradeAmountTop", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Map<String, Object>>> tradeAmountTop() {
		List<Map<String, Object>> tradeAmountList = service.stockTop("TradeAmount");
		return new ResponseEntity<>(tradeAmountList, HttpStatus.OK);
	}
	
	*//** 시가총액 상위 20개 정보 *//*
	@GetMapping(value="/totalValueTop", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Map<String, Object>>> totalValueTop() {
		List<Map<String, Object>> totalValueList = service.stockTop("totalValue");
		return new ResponseEntity<>(totalValueList, HttpStatus.OK);
	}
	
	*//** 인덱스 뉴스 *//*
	@GetMapping(value="/indexNews", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<News>> indexNews() {
		List<News> news = service.stockIndexNews();
		return new ResponseEntity<>(news, HttpStatus.OK);
	}
	
*/
	
	
	/** 주식 interest 화면 요청*/
	@GetMapping(value="/interest", params= {"userId"}, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> interest(String userId) {
		Map<String, Object> map = new Hashtable<String, Object>();

		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	/** 주식 holding 리스트 화면 요청*/
	@GetMapping(value="/holding/list", params= {"userId"}, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String holding(Model model, String userId) {
		// realtime
		model.addAttribute("realtime", service.stockRealtime());
		// 회사 목록
		model.addAttribute("companyList", companyService.list());
		User user = userService.readById(userId);
		// 내 보유주식 위젯
		model.addAttribute("holdingWidget", holdingWidgetMethod(holdingService.listByUser(user.getUserSeq()), user.getUserMoney()));
		// 유저 프로필 위젯
		// 유저 랭킹 위젯
		return "stock/stock-holding-list";
	}
	
	
	/** 주식 index Update 요청*/
	//@ResponseBody
	@PostMapping(value="/holding/update", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> holdingUpdate(ArrayList<Holding> holdingList, Integer cashTotal) {
		System.out.println("holdingUpdate params : " + holdingList + ", " + cashTotal);
		return new ResponseEntity<>(holdingWidgetMethod(holdingList, cashTotal), HttpStatus.OK);
	}
}
