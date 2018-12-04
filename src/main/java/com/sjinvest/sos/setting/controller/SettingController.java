package com.sjinvest.sos.setting.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.setting.domain.Setting;
import com.sjinvest.sos.setting.service.SettingService;
import com.sjinvest.sos.user.domain.User;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/setting/*")
@AllArgsConstructor
public class SettingController {

	private SettingService service;
	
	@ResponseBody
	@GetMapping(value = "/read", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> read(int userSeq) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		System.out.println("sns setting 유저번호: "+userSeq);
		returnData.put("snsSetting", service.read(userSeq));

		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
	
	/*@GetMapping("/update")
		Company company = companyService.readByNumber(companyNumber);
		List<News> news= service.getNewsList(company.getCompanyName()); 
		model.addAttribute("company", company);
		model.addAttribute("news", news);
		return "stock/stock-company";
	}*/
	
	
	@GetMapping("/update")	
	public String update(Setting setting, RedirectAttributes rttr) {
		
		log.info("setting : "+ setting);
		boolean result = service.update(setting);
		System.out.println("정보수정결과: "+ result);
		
		return "redirect:/sns/mypage_index";
	}
}
