package com.sjinvest.sos.user.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.company.domain.Company;
import com.sjinvest.sos.stock.domain.News;
import com.sjinvest.sos.user.domain.User;
import com.sjinvest.sos.user.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {

	private UserService service;
	
	@PostMapping("/regist")
	public String regist(User user, RedirectAttributes rttr) {
		
		log.info("regist : "+ user);
		
		user.setUserAuthority("user");
		
		boolean result = service.regist(user);
		System.out.println("회원가입결과: "+ result);
		
		return "redirect:/sns/newsfeed";
	}
	
	@ResponseBody
	@PostMapping(value = "/login", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> login(String userId, String userPw) {
		
		log.info("login : "+ userId);
		log.info("login : "+ userPw);
		System.out.println("login : "+ userId);
		System.out.println("login : "+ userPw);
		
		
		Map<String, Object> returnData = new HashMap<String, Object>();
		
		User user = service.certify(userId, userPw);
		System.out.println(user);
		
		// 로그인 성공
		if(user != null) {
			returnData.put("userId", userId);
			return new ResponseEntity<>(returnData,HttpStatus.OK);
		}
		// 로그인 실패
		else {
			returnData.put("message","loginFail");
			return new ResponseEntity<>(returnData,HttpStatus.OK);
		}
		
	}
	
	@PostMapping("/update")	
	public String update(User user, RedirectAttributes rttr) {
		
		log.info("regist : "+ user);
		boolean result = service.updateUser(user);
		System.out.println("정보수정결과: "+ result);
		
		return "redirect:/sns/mypage_index";
	}
	
	@ResponseBody
	@PostMapping(value = "/information", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> userInformation(String userId) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		System.out.println("유저들어오는지 확인: "+userId);
		returnData.put("user", service.readById(userId));

		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
	
	

	/*
	// model and view로 
	@GetMapping("/company/{companyNumber}")
	public String company(@PathVariable("companyNumber") String companyNumber, Model model) {
		Company company = companyService.readByNumber(companyNumber);
		List<News> news= service.getNewsList(company.getCompanyName()); 
		model.addAttribute("company", company);
		model.addAttribute("news", news);
		return "stock/stock-company";
	}
	// Ajax로
	@ResponseBody
	@PostMapping(value = "/company/getdata", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> getData(String companyNumber, String companyName) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		returnData.put("stockInfo", service.getStockInfo(companyNumber, companyName));
		returnData.put("askingPrice", service.getAskingPrice(companyNumber));
		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
	*/
	
}
