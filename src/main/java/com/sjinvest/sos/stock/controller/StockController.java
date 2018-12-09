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

import org.apache.commons.codec.binary.Base64;
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
import org.springframework.web.servlet.ModelAndView;

import com.sjinvest.sos.company.domain.Company;
import com.sjinvest.sos.company.service.CompanyService;
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
	public String company(@PathVariable("companyNumber") String companyNumber, Model model,
			HttpServletRequest request) {
		Company company = companyService.readByNumber(companyNumber);
		List<News> news = service.getNewsList(company.getCompanyName());
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			model.addAttribute("isInterest", interestService.check(user.getUserSeq(), companyNumber));
		} else {
			model.addAttribute("isInterest", false);
		}
		model.addAttribute("company", company);
		model.addAttribute("news", news);
		model.addAttribute("chartData", service.getTimeSeries(companyNumber, ""));
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
		User user = (User) request.getSession().getAttribute("userId");
		if (user != null) {
			model.addAttribute("interestList", interestService.listByUser(user.getUserSeq()));
		}
		model.addAttribute("companyList", companyService.search(keyword));
		return "stock/stock-search-result";
	}

	@RequestMapping(value = "/trade-list", method = { RequestMethod.GET, RequestMethod.POST })
	public String tradeList(Model model, HttpServletRequest request) {
//		User user = (User)request.getSession().getAttribute("user");
		User user = userService.readBySeq(2);
		int type = 0;
		if (request.getParameter("type") != null) {
			type = Integer.parseInt(request.getParameter("type"));
		}
		int count = tradingService.countByUser(user.getUserSeq(), type, null, null, 0, 0);
		int amount = 10;
		int page = 0;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			System.out.println(page);
		}
		int pageTotalNum = (int) Math.ceil((1.0 * count) / (1.0 * 10));
		model.addAttribute("thisPage", page);
		model.addAttribute("pageTotalNum", pageTotalNum);
		model.addAttribute("type", type);
		model.addAttribute("tradingList", tradingService.listByUser(user.getUserSeq(), type, null, null,
				((page - 1) * amount) + 1, page * amount));
		model.addAttribute("user", user);
		return "stock/stock-trade-list";
	}

	@ResponseBody
	@PostMapping(value = "/company/addInterest", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String, Object>> addInterest(String companyNumber, String companyName,
			HttpServletRequest request) {
		User user = userService.readById((String) request.getAttribute("userId"));
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
	public ResponseEntity<Map<String, Object>> purchase(int userSeq, String companyNumber, String companyName,
			int tradingAmount, int tradingPrice) {
		Trading trading = new Trading();
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
		notice.setNoticeContent(companyNumber + " " + tradingAmount + "주가 " + tradingPrice + "원에 구매되었습니다.");
		noticeService.create(notice);
		Map<String, Object> returnValue = new HashMap<String, Object>();
		returnValue.put("message", "" + result);
		return new ResponseEntity<>(returnValue, HttpStatus.OK);
	}

	@ResponseBody
	@PostMapping(value = "/convertToImage")
	public ModelAndView htmlToImage(HttpServletRequest request) {
		String binaryData = request.getParameter("imgSrc");
		FileOutputStream stream = null;
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		try {
			System.out.println("binary file " + binaryData);
			if (binaryData == null || binaryData == "") {
				throw new Exception();
			}
			binaryData = binaryData.replaceAll("data:image/png;base64,", "");
			byte[] file = Base64.decodeBase64(binaryData);
			System.out.println("file :::::::: " + file + " || " + file.length);
			String fileName = UUID.randomUUID().toString();
			stream = new FileOutputStream("d:\\test2\\" + fileName + ".png");
			stream.write(file);
			stream.close();
			System.out.println("파일 작성 완료");
			mav.addObject("msg", "ok");
		} catch (Exception e) {
			System.out.println("파일이 정상적으로 넘어오지 않았습니다");
			mav.addObject("msg", "no");
			return mav;
		} finally {
			try {
				stream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return mav;
	}
	// 여기서부터 예겸이 작업 go

}
