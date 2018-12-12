package com.sjinvest.sos.stock.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.sjinvest.sos.feed.domain.Feed;
import com.sjinvest.sos.feed.service.FeedService;
import com.sjinvest.sos.field.service.FieldService;
import com.sjinvest.sos.holding.service.HoldingService;
import com.sjinvest.sos.interest.domain.Interest;
import com.sjinvest.sos.interest.service.InterestService;
import com.sjinvest.sos.notice.domain.Notice;
import com.sjinvest.sos.notice.service.NoticeService;
import com.sjinvest.sos.point.service.PointService;
import com.sjinvest.sos.setting.service.SettingService;
import com.sjinvest.sos.stock.domain.News;
import com.sjinvest.sos.stock.domain.TimeSeries;
import com.sjinvest.sos.stock.service.StockService;
import com.sjinvest.sos.trading.domain.Trading;
import com.sjinvest.sos.trading.service.TradingService;
import com.sjinvest.sos.user.domain.User;
import com.sjinvest.sos.user.service.UserService;
import com.sjinvest.sos.wall.domain.Wall;
import com.sjinvest.sos.wall.service.WallService;

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
	private WallService wallService;
	private FeedService feedService;

	// company, search, trade-list 남수현

	@GetMapping("/company/{companyNumber}")
	public String company(@PathVariable("companyNumber") String companyNumber, Model model,
			HttpServletRequest request) {
		Company company = companyService.readByNumber(companyNumber);
		List<String> companyNumberList = new ArrayList<String>();
		companyNumberList.add(companyNumber);
		List<News> news = service.getEachCompanyNews(companyNumberList);
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			model.addAttribute("isInterest", interestService.check(user.getUserSeq(), companyNumber));
		} else {
			model.addAttribute("isInterest", false);
		}
		model.addAttribute("company", company);
		model.addAttribute("news", news);
		model.addAttribute("chartData", service.getChartData(companyNumberList, 1, 0));
		return "stock/stock-company";
	}

	@ResponseBody
	@PostMapping(value = "/company/getdata", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> getData(String companyNumber, String companyName) {
		return new ResponseEntity<>(service.getCompanyData(companyNumber), HttpStatus.OK);

	}

	@ResponseBody
	@PostMapping(value = "/company/getchartdata", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<TimeSeries> getChartData(String companyNumber, int type) {
		List<String> companyNumberList = new ArrayList<String>();
		companyNumberList.add(companyNumber);
		return new ResponseEntity<>(service.getChartData(companyNumberList, type, 1), HttpStatus.OK);
	}

	@ResponseBody
	@PostMapping(value = "/getStocklist", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> getStockDataList(String[] companyNumberList) {
		ArrayList<String> companyList = new ArrayList<String>(Arrays.asList(companyNumberList));
		return new ResponseEntity<>(service.getForSearchResult(companyList), HttpStatus.OK);
	}

	@RequestMapping(value = "/search", method = { RequestMethod.GET, RequestMethod.POST })
	public String search(String keyword, Model model, HttpServletRequest request) {
		if(keyword.substring(0, 1).equals("$")) {
			return "redirect:company/"+companyService.readByName(keyword.substring(1)).getCompanyNumber();
		}else if(keyword.substring(0,1).equals("@")) {
			List<Company> companyList = companyService.readByFieldName(keyword.substring(1));
			model.addAttribute(companyList);
		}else {
			model.addAttribute("companyList", companyService.search(keyword));
		}
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			List<Interest> interestList = interestService.listByUser(user.getUserSeq());
			model.addAttribute("interestList", interestList);
		}
		return "stock/stock-search-result";
	}

	@RequestMapping(value = "/trade-list", method = { RequestMethod.GET, RequestMethod.POST })
	public String tradeList(Model model, HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute("user");
		int type = 0;
		if (request.getParameter("type") != null) {
			type = Integer.parseInt(request.getParameter("type"));
		}
		String getDate = request.getParameter("date");
		String startDate = null;
		String endDate = null;
		if(getDate != null) {
			String[] date = getDate.split(" - ");
			String[] startDates = date[0].split("/");
			String[] endDates = date[1].split("/");
			startDate = startDates[2]+"-"+startDates[0]+"-"+startDates[1];
			endDate = endDates[2]+"-"+endDates[0]+"-"+endDates[1];
		}
		int count = tradingService.countByUser(user.getUserSeq(), type, startDate, endDate, 0, 0);
		int amount = 10;
		int page = 0;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int pageTotalNum = (int) Math.ceil((1.0 * count) / (1.0 * 10));
		model.addAttribute("thisPage", page);
		model.addAttribute("pageTotalNum", pageTotalNum);
		model.addAttribute("type", type);
		model.addAttribute("tradingList", tradingService.listByUser(user.getUserSeq(), type, startDate, endDate,
				((page - 1) * amount) + 1, page * amount));
		model.addAttribute("user", user);
		model.addAttribute("getDate",getDate);
		return "stock/stock-trade-list";
	}

	@ResponseBody
	@PostMapping(value = "/company/addInterest", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> addInterest(String companyNumber, String companyName,
			HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute("user");
		Interest interest = new Interest();
		interest.setCompanyName(companyName);
		interest.setCompanyNumber(companyNumber);
		interest.setUserSeq(user.getUserSeq());
		boolean result = interestService.add(interest);
		Map<String, Object> returnValue = new HashMap<String, Object>();
		returnValue.put("message", "" + result);
		return new ResponseEntity<>(returnValue, HttpStatus.OK);
	}

	@ResponseBody
	@PostMapping(value = "/capture", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> capture(String image){
		String fileName = UUID.randomUUID().toString();
		FileOutputStream stream = null;
		fileName = "c:\\captures\\" + fileName + ".jpeg";
		try {
			stream = new FileOutputStream(fileName);
			stream.write(Base64Utils.decodeBase64ToBytes(image));
			stream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fileName", fileName);
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping(value = "/write-wall", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> writeWall(HttpSession session, String imageLocation, String content, String target){
		System.out.println("담벼락 쓰기");
		Wall wall = new Wall();
		User thisUser = ((User)session.getAttribute("user"));
		User targetUser = userService.readByNickname(target);
		wall.setUserSeq(targetUser.getUserSeq());
		wall.setWallContent(content);
		wall.setWallPicture(imageLocation);
		wall.setWriterUserSeq(thisUser.getUserSeq());
		wallService.write(wall);
		Map<String, Object> map = new HashMap<String, Object>();
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	@ResponseBody
	@PostMapping(value = "/write-feed", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> writeFeed(HttpSession session, String imageLocation, String content){
		System.out.println("피드 쓰기");
		Feed feed = new Feed();
		User thisUser = ((User)session.getAttribute("user"));
		feed.setUserSeq(thisUser.getUserSeq());
		feed.setFeedContent(content);
		feed.setFeedPicture(imageLocation);
		feedService.write(feed);
		System.out.println(feed);
		Map<String, Object> map = new HashMap<String, Object>();
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	@ResponseBody
	@PostMapping(value = "/company/removeInterest", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> removeInterest(String companyNumber, String companyName,
			HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		Interest interest = new Interest();
		interest.setCompanyName(companyName);
		interest.setCompanyNumber(companyNumber);
		interest.setUserSeq(user.getUserSeq());
		boolean result = interestService.delete(interest);
		Map<String, Object> returnValue = new HashMap<String, Object>();
		returnValue.put("message", "" + result);
		return new ResponseEntity<>(returnValue, HttpStatus.OK);
	}

	@ResponseBody
	@PostMapping(value = "/company/purchase", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> purchase(String companyNumber, String companyName,
			int tradingAmount, int tradingPrice, HttpServletRequest request) {
		Trading trading = new Trading();
		User user = (User)request.getSession().getAttribute("user");
		int userSeq = user.getUserSeq();
		trading.setCompanyName(companyName);
		trading.setCompanyNumber(companyNumber);
		trading.setTradingAmount(tradingAmount);
		trading.setTradingPrice(tradingPrice);
		trading.setTradingType(1);
		trading.setUserSeq(userSeq);
		boolean result = tradingService.create(trading);
		Notice notice = new Notice();
		notice.setUserSeq(userSeq);
		notice.setNoticeType(2);
		notice.setNoticeLink("/stock/trade-list");
		notice.setNoticeContent(companyName + " " + tradingAmount + "주가 " + tradingPrice + "원에 구매되었습니다.");
		noticeService.create(notice);
		Map<String, Object> returnValue = new HashMap<String, Object>();
		returnValue.put("message", "" + result);
		request.getSession().removeAttribute("user");
		User newUser = userService.readBySeq(user.getUserSeq());
		request.getSession().setAttribute("user", newUser);
		return new ResponseEntity<>(returnValue, HttpStatus.OK);
	}
	
//	검색 - 자동 완성기능 (hojin)
	@ResponseBody
	@GetMapping(value = "/searchAuto", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<String>> searchAutoComplete(String term) {
//		System.out.println(term);
		List<String> searchList = null;
		if (term.charAt(0) == '$') {
//			System.out.println("캐시태그 검색");
			searchList = companyService.findCompany(term.substring(1));
		}else if (term.charAt(0) == '@') {
//			System.out.println("업종태그 검색");
			searchList = fieldService.findField(term.substring(1));
		} 
		return new ResponseEntity<>(searchList, HttpStatus.OK);
	}
	// 여기서부터 예겸이 작업 go

}
