package com.sjinvest.sos.stock.controller;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public ResponseEntity<Map<String, Object>> index(String userId) {
		Map<String, Object> map = new Hashtable<String, Object>();
		// realtime
		map.put("realtime", service.stockRealtime());
		// 내 보유주식 위젯
		map.put("holdingWidget", holdingWidgetMethod(userId));
		// 유저 프로필 위젯
		// 유저 랭킹 위젯
		// 회사 목록
		map.put("companyNameList", companyService.list());
		// 업종별 거래량 카드
		map.put("fieldAmount", service.stockFieldAmount());
		// 관심종목카드
		map.put("interestCard", interestCardMethod(userId));
		// 코스피 정보 카드
		map.put("kospi", kospiMethod());
		// 상승률 상위 5종목
		map.put("risingTop", service.stockTop("Rising"));
		// 주식 전체 뉴스
		map.put("news", service.stockIndexNews());
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	/** 내 보유주식 위젯 요청*/
	@GetMapping(value="/holdingWidget", params= {"userId"}, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> holdingWidget(String userId) {
		return new ResponseEntity<>(holdingWidgetMethod(userId), HttpStatus.OK);
	}

	/** 내 보유주식 위젯 메소드*/
	private Map<String, Object> holdingWidgetMethod(String userId) {
		Map<String, Object> holdingWidgetMap = new Hashtable<String, Object>();
		User user = userService.readById(userId);
		List<Holding> holdingList = null;
		/** 실제 구현시 필요한 코드
		// holding 테이블에서 userSeq의 holding목록 가져오기
		holdingList = holdingService.listByUser(user.getUserSeq());
		// holdingList의 holding들에 대해 api연결하여 수익계산 필요
		 * */

		/** 테스트를 위해 임시 데이터 가져옴 */
		holdingList = service.stockMyHoldingWidget();
		int stockTotal = 0;
		for (Holding holding : holdingList) {
			stockTotal += holding.getHoldingTotalMoney();
		}
		holdingWidgetMap.put("total", user.getUserMoney() + stockTotal);
		holdingWidgetMap.put("stockTotal", stockTotal);
		holdingWidgetMap.put("cashTotal", user.getUserMoney());
		holdingWidgetMap.put("holdingList", holdingList);
		return holdingWidgetMap;
	}
	
	/** 업종별 거래량 */
	@GetMapping(value="/stockFieldAmount", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Map<String, Object>>> stockFieldAmount() {
		List<Map<String, Object>> list = service.stockFieldAmount();
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	/** 관심종목카드 */
	@GetMapping(value="/interestCard", params= {"userId"}, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> interestCard(String userId) {
		return new ResponseEntity<>(interestCardMethod(userId), HttpStatus.OK);
	}
	
	/** 관심종목카드 메소드 */
	private Map<String, Object> interestCardMethod(String userId) {
		Map<String, Object> interestCardMap = new Hashtable<String, Object>();
		User user = userService.readById(userId);
		List<Interest> interestList = interestService.listByUser(user.getUserSeq());
		List<String> companyNameList = new ArrayList<>();
		for (Interest interest : interestList) {
			companyNameList.add(interest.getCompanyName());
		}
		List<Stock> stockList = service.getStockList(companyNameList);
		List<TimeSeries> timeSeriesList = service.getTimeSeriesList(companyNameList, "stock");
		interestCardMap.put("stockList", stockList);
		interestCardMap.put("chartList", timeSeriesList);
		return interestCardMap;
	}
	
	/** 코스피 정보 */
	@GetMapping(value="/kospi", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> kospi() {
		return new ResponseEntity<>(kospiMethod(), HttpStatus.OK);
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
	
	/** 상승률 상위 5개 정보 */
	@GetMapping(value="/risingTop", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Map<String, Object>>> risingTop() {
		List<Map<String, Object>> risingList = service.stockTop("Rising");
		return new ResponseEntity<>(risingList, HttpStatus.OK);
	}
	
	/** 하락률 상위 5개 정보 */
	@GetMapping(value="/fallingTop", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Map<String, Object>>> fallingTop() {
		List<Map<String, Object>> fallingList = service.stockTop("Falling");
		return new ResponseEntity<>(fallingList, HttpStatus.OK);
	}
	
	/** 외국인순매수 상위 5개 정보 */
	@GetMapping(value="/foreignTop", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Map<String, Object>>> foreignTop() {
		List<Map<String, Object>> foreignList = service.stockTop("Foreign");
		return new ResponseEntity<>(foreignList, HttpStatus.OK);
	}
	
	/** 기관순매수 상위 5개 정보 */
	@GetMapping(value="/institutionTop", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Map<String, Object>>> institutionTop() {
		List<Map<String, Object>> institutionList = service.stockTop("Institution");
		return new ResponseEntity<>(institutionList, HttpStatus.OK);
	}
	
	/** 상위 거래량 상위 20개 정보 */
	@GetMapping(value="/tradeAmountTop", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Map<String, Object>>> tradeAmountTop() {
		List<Map<String, Object>> tradeAmountList = service.stockTop("TradeAmount");
		return new ResponseEntity<>(tradeAmountList, HttpStatus.OK);
	}
	
	/** 시가총액 상위 20개 정보 */
	@GetMapping(value="/totalValueTop", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Map<String, Object>>> totalValueTop() {
		List<Map<String, Object>> totalValueList = service.stockTop("totalValue");
		return new ResponseEntity<>(totalValueList, HttpStatus.OK);
	}
	
	/** 인덱스 뉴스 */
	@GetMapping(value="/indexNews", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<News>> indexNews() {
		List<News> news = service.stockIndexNews();
		return new ResponseEntity<>(news, HttpStatus.OK);
	}
	
	
	/** 주식 interest 화면 요청*/
	@GetMapping(value="/interest", params= {"userId"}, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> interest(String userId) {
		Map<String, Object> map = new Hashtable<String, Object>();
		// realtime
		map.put("realtime", service.stockRealtime());
		// 내 보유주식 위젯
		map.put("holdingWidget", holdingWidgetMethod(userId));
		// 유저 프로필 위젯
		// 유저 랭킹 위젯
		// 회사 목록
		map.put("companyNameList", companyService.list());
		
		// 업종별 거래량 카드
		map.put("fieldAmount", service.stockFieldAmount());
		// 관심종목카드
		map.put("interestCard", interestCardMethod(userId));
		// 코스피 정보 카드
		map.put("kospi", kospiMethod());
		// 상승률 상위 5종목
		map.put("risingTop", service.stockTop("Rising"));
		// 주식 전체 뉴스
		map.put("news", service.stockIndexNews());
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
}
