package com.sjinvest.sos.stock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.swing.text.html.HTMLEditorKit.InsertHTMLTextAction;

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
import com.sjinvest.sos.notice.domain.Notice;
import com.sjinvest.sos.notice.service.NoticeService;
import com.sjinvest.sos.point.service.PointService;
import com.sjinvest.sos.setting.service.SettingService;
import com.sjinvest.sos.stock.dao.StockDao;
import com.sjinvest.sos.stock.params.HoldingListParams;
import com.sjinvest.sos.stock.params.IndexChartParams;
import com.sjinvest.sos.stock.params.IndexParams;
import com.sjinvest.sos.stock.domain.News;
import com.sjinvest.sos.stock.domain.Rank;
import com.sjinvest.sos.stock.domain.Stock;
import com.sjinvest.sos.stock.domain.TimeSeries;
import com.sjinvest.sos.stock.service.StockService;
import com.sjinvest.sos.trading.domain.Trading;
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
		
		System.out.println("index : " + 0);
		List<Holding> holdingList = new ArrayList<>();					 /* 보유자산 리스트 */
		List<String> interestCompanyNumberList = new ArrayList<>();		 /* 관심종목에 있는 종목 번호 리스트  */
		Map<String, Object> interestMap = new Hashtable<>();	 /* 관심종목 Stock리스트와 Chart데이터  */
		Map<String, Object> holdingWidgetMap = null;			 /* 보유자산 total, stockTotal, cashTotal, Holding리스트  */
		Map<String, Object> map = null;							 /* stock 서비스에서 한번에 받아올 정보 : realTime, topTab, 관심종목 Stock리스트, HoldingMap  */ 
		
		//new Thread(new InterestChartThread(interestMap, interestCompanyNumberList)).start();
		
		System.out.println("index : " + 1);
		if(user != null) {
			holdingList = holdingService.listByUser(user.getUserSeq());
			for (Interest interest : interestService.listByUser(user.getUserSeq())) {
				interestCompanyNumberList.add(interest.getCompanyNumber());
			}
			
			TimeSeries interestTimeSeries = service.getChartData(interestCompanyNumberList, 1, 1);
			interestMap.put("interestChart", interestTimeSeries);
		}

		
		map = service.getForIndex(holdingList, interestCompanyNumberList, 1);
		
		System.out.println("index : " + 2);
		// realtime
		model.addAttribute("realTime", map.get("realTime"));
		// 회사 목록
		model.addAttribute("companyList", companyService.list());
		// 업종별 거래량 카드
		System.out.println("index : " + 3);
		model.addAttribute("fieldStock", service.getField());
		System.out.println("index : " + 4);
		// 코스피 정보 카드
		model.addAttribute("kospiMap", service.getKospiChartDate(1));
		// 상승률 상위 5종목
		model.addAttribute("topTab", map.get("topTab"));
		// 주식 전체 뉴스
		//model.addAttribute("news", service.stockIndexNews());

		System.out.println("index : " + 5);
		if(user != null) {
			// 관심종목 정보
			interestMap.put("interestList", map.get("interestList"));
			model.addAttribute("interestMap", interestMap);
			// 내 보유주식 위젯
			holdingWidgetMap = (Map<String, Object>) map.get("holdingWidget");
			holdingWidgetMap.put("chasTotal", user.getUserMoney());
			holdingWidgetMap.put("total", user.getUserMoney() + (Integer)holdingWidgetMap.get("stockTotal"));
			model.addAttribute("holdingWidget", holdingWidgetMap);
		}
		// 유저 프로필 위젯
		// 유저 랭킹 위젯
		// 관심종목카드
		//System.out.println(map);
		return "stock/stock-index";
	}
	
	/** 주식 index 화면 요청(모델 없이 화면만 전달)*/
	@GetMapping(value="/indexs", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String indexSimple(HttpServletRequest request, Model model) {
		// 관심종목 슬라이드 세팅을 위해 관심종목 길이만 전달
		User user = (User)request.getSession().getAttribute("user");
		if(user != null) {
			model.addAttribute("interestList", interestService.listByUser(user.getUserSeq()));
		}
		return "temp/stock-index-test";
	}
	
	/** 주식 index 화면에 필요한 초기 데이터 요청*/
	@GetMapping(value="/indexs/first", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> indexSimpleFirst(HttpServletRequest request) {
		
		System.out.println("index....");
		System.out.println("user : " + request.getSession().getAttribute("user"));
		User user = (User)request.getSession().getAttribute("user");
		
		System.out.println("index : " + 0);
		List<Holding> holdingList = new ArrayList<>();					 /* 보유자산 리스트 */
		List<String> interestCompanyNumberList = new ArrayList<>();		 /* 관심종목에 있는 종목 번호 리스트  */
		Map<String, Object> interestMap = new Hashtable<>();	 /* 관심종목 Stock리스트와 Chart데이터  */
		Map<String, Object> holdingWidgetMap = null;			 /* 보유자산 total, stockTotal, cashTotal, Holding리스트  */
		Map<String, Object> map = null;							 /* stock 서비스에서 한번에 받아올 정보 : realTime, topTab, 관심종목 Stock리스트, HoldingMap  */
		Map<String, Object> returnMap = new HashMap<String,Object>();
		Thread chartThread = null;
		Thread forIndexThread = null;
		Thread fieldThread = null;
		
		System.out.println("index : " + 1);
		returnMap.put("companyList", companyService.list());
		returnMap.put("kospiMap", service.getKospiChartDate(1));
		System.out.println("index : " + 2);
		
		if(user != null) {
			System.out.println("index : " + 2.1);
			holdingList = holdingService.listByUser(user.getUserSeq());
			for (Interest interest : interestService.listByUser(user.getUserSeq())) {
				interestCompanyNumberList.add(interest.getCompanyNumber());
			}
		}
		
		chartThread = new Thread(new ChartThread(interestMap, interestCompanyNumberList, returnMap));
		chartThread.start();
		System.out.println("index : " + 3);
		
		forIndexThread = new Thread(new ForIndexThreadS(returnMap, map, holdingList, interestCompanyNumberList,interestMap, holdingWidgetMap, user));
		System.out.println("index : " + 3.5);
		fieldThread = new Thread(new FieldThreadS(returnMap));
		
		
		System.out.println("index : " + 4);
		forIndexThread.start();
		System.out.println("index : " + 5);
		fieldThread.start();
		System.out.println("index : " + 6);
		
		try {
			fieldThread.join();
			System.out.println("index : " + 7);
			forIndexThread.join();
			System.out.println("index : " + 8);
			chartThread.join();
			System.out.println("index : " + 9);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("index : " + 8);
		
		// 모델에 다 들어감
		System.out.println("returnMap : " + returnMap);
		
		
		return new ResponseEntity<>(returnMap, HttpStatus.OK);
	}
	
	/** 관심종목의 차트를 interestChartMap에 담는 쓰레드 */
	private class ChartThread implements Runnable {	
		Map<String, Object> interestMap;	 
		List<String> interestCompanyNumberList;
		Map<String, Object> resultMap;
		
		@Override
		public void run(){
			if(interestCompanyNumberList.size() == 0) {
				interestMap.put("interestChart", new TimeSeries());
			}
			else {
				Map<String, Object> chartMap = service.getChartDataWithKospi(interestCompanyNumberList, 1);
				interestMap.put("interestChart", chartMap.get("chart"));
				resultMap.put("kospiChart", chartMap.get("kospiChart"));
			}
			System.out.println("InterestChartThread END...");
		}
		public ChartThread(Map<String, Object> interestMap, List<String> interestCompanyNumberList, Map<String, Object> resultMap ) {
			this.interestMap = interestMap;
			this.interestCompanyNumberList = interestCompanyNumberList;
			this.resultMap = resultMap;
		}
	}
	
	/** 업종정보 쓰레드 */
	private class FieldThreadS implements Runnable {
		Map<String, Object> returnMap;
		
		@Override
		public void run(){
			returnMap.put("fieldStock", service.getField());
			System.out.println("FieldThread END...");
			System.out.println("FieldThread returnMap : " + returnMap);
		}
		public FieldThreadS(Map<String, Object> map) {
			this.returnMap = map;
		}
	}
	
	/** 관심종목의 차트를 interestChartMap에 담는 쓰레드 */
	private class ForIndexThreadS implements Runnable {	
		Map<String, Object> returnMap;
		Map<String, Object> map = null;
		List<Holding> holdingList = new ArrayList<>();					 /* 보유자산 리스트 */
		List<String> interestCompanyNumberList = new ArrayList<>();		 /* 관심종목에 있는 종목 번호 리스트  */
		Map<String, Object> interestMap = new Hashtable<>();	 /* 관심종목 Stock리스트와 Chart데이터  */
		Map<String, Object> holdingWidgetMap = null;			 /* 보유자산 total, stockTotal, cashTotal, Holding리스트  */
		User user;
		
		@Override
		public void run(){
			System.out.println("ForIndexThreadS 1");
			map = service.getForIndex(holdingList, interestCompanyNumberList, 1);
			returnMap.put("realTime", map.get("realTime"));
			returnMap.put("topTab", map.get("topTab"));

			System.out.println("ForIndexThreadS 2");
			if(user != null) {
				System.out.println("ForIndexThreadS 3");
				interestMap.put("interestList", map.get("interestList"));
				returnMap.put("interestMap",interestMap);
				
				holdingWidgetMap = (Map<String, Object>) map.get("holdingWidget");
				holdingWidgetMap.put("chasTotal", user.getUserMoney());
				holdingWidgetMap.put("total", user.getUserMoney() + (Integer)holdingWidgetMap.get("stockTotal"));
				returnMap.put("holdingWidget", holdingWidgetMap);
				System.out.println("ForIndexThreadS 4");
			}
			
			System.out.println("ForIndexThread returnMap : " + returnMap);
			System.out.println("ForIndexThread END...");
			
		}
		public ForIndexThreadS(Map<String, Object> returnMap, Map<String, Object> map, List<Holding> holdingList, List<String> interestCompanyNumberList,Map<String, Object> interestMap, Map<String, Object> holdingWidgetMap, User user) {
			this.returnMap = returnMap;
			this.map = map;
			this.holdingList = holdingList;
			this.interestCompanyNumberList = interestCompanyNumberList;
			this.interestMap = interestMap;
			this.holdingWidgetMap = holdingWidgetMap;
			this.user = user;
		}
	}
	
	/** 관심종목의 차트를 interestChartMap에 담는 쓰레드 */
	private class InterestChartThread implements Runnable {	
		Map<String, Object> interestMap;	 
		List<String> interestCompanyNumberList;
		
		@Override
		public void run(){
			TimeSeries interestTimeSeries = service.getChartData(interestCompanyNumberList, 1, 1);
			interestMap.put("interestChart", interestTimeSeries);
			System.out.println("InterestChartThread END...");
		}
		public InterestChartThread(Map<String, Object> interestMap, List<String> interestCompanyNumberList) {
			this.interestMap = interestMap;
			this.interestCompanyNumberList = interestCompanyNumberList;
		}
	}

	/** 업종정보 쓰레드 */
	private class FieldThread implements Runnable {
		Model model;
		
		@Override
		public void run(){
			model.addAttribute("fieldStock", service.getField());
			System.out.println("FieldThread END...");
			System.out.println("FieldThread model : " + model);
		}
		public FieldThread(Model model) {
			this.model = model;
		}
	}
	
	/** 관심종목의 차트를 interestChartMap에 담는 쓰레드 */
	private class ForIndexThread implements Runnable {	
		Model model = null;
		Map<String, Object> map = null;
		List<Holding> holdingList = new ArrayList<>();					 /* 보유자산 리스트 */
		List<String> interestCompanyNumberList = new ArrayList<>();		 /* 관심종목에 있는 종목 번호 리스트  */
		Map<String, Object> interestMap = new Hashtable<>();	 /* 관심종목 Stock리스트와 Chart데이터  */
		Map<String, Object> holdingWidgetMap = null;			 /* 보유자산 total, stockTotal, cashTotal, Holding리스트  */
		User user;
		
		@Override
		public void run(){
			map = service.getForIndex(holdingList, interestCompanyNumberList, 1);
			model.addAttribute("realTime", map.get("realTime"));
			model.addAttribute("topTab", map.get("topTab"));
			
			if(user != null) {
				interestMap.put("interestList", map.get("interestList"));
				model.addAttribute("interestMap",interestMap);
				
				holdingWidgetMap = (Map<String, Object>) map.get("holdingWidget");
				holdingWidgetMap.put("chasTotal", user.getUserMoney());
				holdingWidgetMap.put("total", user.getUserMoney() + (Integer)holdingWidgetMap.get("stockTotal"));
				model.addAttribute("holdingWidget", holdingWidgetMap);
			}
			
			System.out.println("ForIndexThread model : " + model);
			System.out.println("ForIndexThread END...");
			
		}
		public ForIndexThread(Map<String, Object> map, List<Holding> holdingList, List<String> interestCompanyNumberList,Map<String, Object> interestMap, Map<String, Object> holdingWidgetMap, User user, Model model) {
			this.map = map;
			this.holdingList = holdingList;
			this.interestCompanyNumberList = interestCompanyNumberList;
			this.interestMap = interestMap;
			this.holdingWidgetMap = holdingWidgetMap;
			this.user = user;
			this.model = model;
		}
	}
	
	/** 주식 index 화면 요청 멀티스레드*/
	@GetMapping(value="/indexm", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String indexM(Model model, HttpServletRequest request) {
		System.out.println("index....");
		System.out.println("user : " + request.getSession().getAttribute("user"));
		User user = (User)request.getSession().getAttribute("user");
		
		System.out.println("index : " + 0);
		List<Holding> holdingList = new ArrayList<>();					 /* 보유자산 리스트 */
		List<String> interestCompanyNumberList = new ArrayList<>();		 /* 관심종목에 있는 종목 번호 리스트  */
		Map<String, Object> interestMap = new Hashtable<>();	 /* 관심종목 Stock리스트와 Chart데이터  */
		Map<String, Object> holdingWidgetMap = null;			 /* 보유자산 total, stockTotal, cashTotal, Holding리스트  */
		Map<String, Object> map = null;							 /* stock 서비스에서 한번에 받아올 정보 : realTime, topTab, 관심종목 Stock리스트, HoldingMap  */
		Thread interestChartThread = null;
		Thread forIndexThread = null;
		Thread fieldThread = null;
		
		System.out.println("index : " + 1);
		model.addAttribute("companyList", companyService.list());
		model.addAttribute("kospiMap", service.getKospiChartDate(1));
		
		if(user != null) {
			holdingList = holdingService.listByUser(user.getUserSeq());
			for (Interest interest : interestService.listByUser(user.getUserSeq())) {
				interestCompanyNumberList.add(interest.getCompanyNumber());
			}
			interestChartThread= new Thread(new InterestChartThread(interestMap, interestCompanyNumberList));
			//new Thread(new InterestChartThread(interestMap, interestCompanyNumberList)).start();
		}
		
		forIndexThread = new Thread(new ForIndexThread(map, holdingList, interestCompanyNumberList,interestMap, holdingWidgetMap, user, model));
		fieldThread = new Thread(new FieldThread(model));
		
		interestChartThread.start();
		System.out.println("index : " + 2);
		forIndexThread.start();
		System.out.println("index : " + 3);
		fieldThread.start();
		System.out.println("index : " + 4);
		
		try {
			fieldThread.join();
			System.out.println("index : " + 5);
			forIndexThread.join();
			System.out.println("index : " + 6);
			interestChartThread.join();
			System.out.println("index : " + 7);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("index : " + 8);

		return "stock/stock-index";
	}
	
	/** 주식 index 화면 요청*/
	@GetMapping(value="/index/first", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>>  indexFirst(Model model, HttpServletRequest request) {
		System.out.println("index....");
		System.out.println("user : " + request.getSession().getAttribute("user"));
		User user = (User)request.getSession().getAttribute("user");
		
		System.out.println("index : " + 0);
		List<Holding> holdingList = new ArrayList<>();					/* 보유자산 리스트 */
		List<String> interestCompanyNumberList = new ArrayList<>();		/* 관심종목에 있는 종목 번호 리스트 */
		Map<String, Object> interestMap = new Hashtable<>();			/* 관심종목 Stock리스트와 Chart데이터 */
		Map<String, Object> holdingWidgetMap = null;					/* 보유자산 total, stockTotal, cashTotal, Holding리스트 */
		Map<String, Object> map = null;									/* stock 서비스에서 한번에 받아올 정보 : realTime, topTab, 관심종목 Stock리스트, HoldingMap  */
		
		System.out.println("indexFirst : " + 1);
		if(user != null) {
			holdingList = holdingService.listByUser(user.getUserSeq());
			for (Interest interest : interestService.listByUser(user.getUserSeq())) {
				interestCompanyNumberList.add(interest.getCompanyNumber());
			}
			
			TimeSeries interestTimeSeries = service.getChartData(interestCompanyNumberList, 1, 1);
			interestMap.put("interestChart", interestTimeSeries);
		}

		// map : realTime, topTab, interestList, holdingWidget
		map = service.getForIndex(holdingList, interestCompanyNumberList, 1);
		// 회사 목록
		map.put("companyList", companyService.list());
		// 업종별 거래량 카드
		map.put("fieldStock", service.getField());
		// 코스피 정보 카드
		map.put("kospiMap", service.getKospiChartDate(1));
		// 주식 전체 뉴스
		map.put("news", service.stockIndexNews());
		System.out.println("index : " + 3);
		
		if(user != null) {
			// 관심종목 정보
			interestMap.put("interestList", map.get("interestList"));
			map.put("interestMap", interestMap);
			map.remove("interestList");
			
			// 내 보유주식 위젯
			holdingWidgetMap = (Map<String, Object>) map.get("holdingWidget");
			holdingWidgetMap.put("chasTotal", user.getUserMoney());
			holdingWidgetMap.put("total", user.getUserMoney() + (Integer)holdingWidgetMap.get("stockTotal"));
			map.remove("holdingWidget");
			map.put("holdingWidget", holdingWidgetMap);
		}
		// 유저 프로필 위젯
		// 유저 랭킹 위젯
		// 관심종목카드
		System.out.println(map);
		return new ResponseEntity<>(map, HttpStatus.OK);
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
	public ResponseEntity<List<Rank>> tabUpdate(@PathVariable("type")int type) {
		System.out.println("tabUpdate type : " + type);
		return new ResponseEntity<>(service.getRanking(type), HttpStatus.OK);
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
	
	/** index의 업종별 거래량 update 요청*/
	//@ResponseBody
	@GetMapping(value="/index/field", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<String[]>> fieldUpdate() {
		System.out.println("fieldUpdate .. ");
		return new ResponseEntity<>(service.getField(), HttpStatus.OK);
	}

	
	/** 주식 interest 화면 요청*/
	@GetMapping(value="/interest/list", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String interest(Model model, HttpServletRequest request) {
		System.out.println("interest list......");
		System.out.println("user : " + request.getSession().getAttribute("user"));
		User user = (User)request.getSession().getAttribute("user");
		// user null이면 관심종목 못들어옴
		if(user == null) {
			System.out.println("user null");
			return "sns/newsfeed";
		}
		//request.setAttribute("user", user);
		
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
	
	/** 주식 interest 업데이트 요청*/
	@GetMapping(value="/interest/update", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Stock>> interestUpdate(String[] interestCompanyNumberArray) {
		System.out.println("interestUpdate : array[0] " + interestCompanyNumberArray[0]);
		List<String> interestCompanyNumberList = new ArrayList<>();		/* 관심종목에 있는 종목 번호 리스트 */
		Map<String, Object> map = new HashMap<>();
		for (String string : interestCompanyNumberArray) {
			interestCompanyNumberList.add(string);
		}
		map = service.getForSearchResult(interestCompanyNumberList);
		return new ResponseEntity<>( (List<Stock>)map.get("stockList"), HttpStatus.OK);
	}
	
	/** 주식 interest 뉴스 요청*/
	@GetMapping(value="/interest/news", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<News>> interestNews(String[] interestCompanyNumberArray) {
		System.out.println("interestNews : array[0] " + interestCompanyNumberArray[0]);
		List<String> interestCompanyNumberList = new ArrayList<>();		/* 관심종목에 있는 종목 번호 리스트 */
		List<News> newsList = null;
		for (String string : interestCompanyNumberArray) {
			interestCompanyNumberList.add(string);
		}
		newsList = service.getEachCompanyNews(interestCompanyNumberList);
		return new ResponseEntity<>( newsList, HttpStatus.OK);
	}
	
	/** 주식 interest 화면 요청*/
	@PostMapping(value="/interest/remove", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Boolean> interestRemove(@RequestBody Interest interest) {
		System.out.println("interestRemove : interest " + interest);
		return new ResponseEntity<>( interestService.delete(interest), HttpStatus.OK);
	}
	
	/** 주식 holding 리스트 화면 요청*/
	@GetMapping(value="/holding/list", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String holding(Model model, HttpServletRequest request) {
		System.out.println("holding list......");
		User user = (User)request.getSession().getAttribute("user");
		// user null이면 관심종목 못들어옴
		if(user == null) {
			System.out.println("user null");
			return "sns/newsfeed";
		}
		//request.setAttribute("user", user);
		
		List<Holding> holdingList = null;				/* 보유자산 리스트 */
		Map<String, Object> map = null;					/* 서비스의 getHolding이 반환하는 맵을 담을 객체 */
		Map<String, Object> holdingMap = null;			/* 보유자산 total, stockTotal, cashTotal, Holding리스트  담을 맵 */

		
		holdingList = holdingService.listByUser(user.getUserSeq());
		map = service.getHolding(holdingList);			/* realtime, holdingWidgetMap 들어있는 map반환 */
		System.out.println("holding 에서 받은 맵 : " + map);
		
		holdingMap = (Map<String, Object>)map.get("holdingWidget");
		holdingMap.put("cashTotal", user.getUserMoney());
		holdingMap.put("total", user.getUserMoney() + (Integer)holdingMap.get("stockTotal"));
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
		System.out.println("holdingUpdate 에서 받은 holdingWidgetMap : " + map.get("holdingWidget"));
		return new ResponseEntity<>( map, HttpStatus.OK);
	}
	
	/** 주식 holding 업데이트 요청 */
	@PostMapping(value="/holding/sell", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> holdingSell(String companyNumber, String companyName,
			int tradingAmount, int tradingPrice, HttpServletRequest request) {
		System.out.println("holdingSell :  " + companyNumber + "," + companyName + "," + tradingAmount + "," + tradingPrice);
		Trading trading = new Trading();
		User user = (User)request.getSession().getAttribute("user");
		int userSeq = user.getUserSeq();
		trading.setCompanyName(companyName);
		trading.setCompanyNumber(companyNumber);
		trading.setTradingAmount(tradingAmount);
		trading.setTradingPrice(tradingPrice);
		trading.setTradingType(2);
		trading.setUserSeq(userSeq);
		boolean result = tradingService.create(trading);
		Notice notice = new Notice();
		notice.setUserSeq(userSeq);
		notice.setNoticeType(2);
		notice.setNoticeLink("/stock/trade-list");
		notice.setNoticeContent(companyNumber + " " + tradingAmount + "주가 " + tradingPrice + "원에 판매되었습니다.");
		noticeService.create(notice);
		Map<String, Object> returnValue = new HashMap<String, Object>();
		returnValue.put("message", "" + result);
		request.getSession().removeAttribute("user");
		User newUser = userService.readBySeq(user.getUserSeq());
		request.getSession().setAttribute("user", newUser);
		return new ResponseEntity<>(returnValue, HttpStatus.OK);
	}

}
