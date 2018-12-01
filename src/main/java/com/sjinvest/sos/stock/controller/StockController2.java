package com.sjinvest.sos.stock.controller;

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
import com.sjinvest.sos.interest.service.InterestService;
import com.sjinvest.sos.like.service.LikeService;
import com.sjinvest.sos.notice.service.NoticeService;
import com.sjinvest.sos.point.service.PointService;
import com.sjinvest.sos.setting.service.SettingService;
import com.sjinvest.sos.stock.dao.StockDao;
import com.sjinvest.sos.stock.domain.Stock;
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
	
	//userseq 1 넘어온다고 가정(원래는 GET일때는 비로그인)
	@GetMapping(value="/index", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity index() {
		Map map = new Hashtable();
		List<Stock> realtime = service.stockRealtime();
		
		map.put("realtime", realtime);
		
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	//userseq 1 넘어온다고 가정(원래는 GET일때는 비로그인)
	@GetMapping(value="/holdingWidget", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity holdingWidget(String id) {
		return new ResponseEntity<>(holdingWidgetMethod(id), HttpStatus.OK);
	}

	private Map holdingWidgetMethod(String userId) {
		Map holdingWidgetMap = new Hashtable();
		User user = userService.readById(userId);
		List<Holding> holdingList = holdingService.listByUser(user.getUserSeq());
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
}
