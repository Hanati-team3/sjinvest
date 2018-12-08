package com.sjinvest.sos.user.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.sjinvest.sos.user.domain.KakaoLogin;
import com.sjinvest.sos.user.domain.NaverLogin;
//import com.sjinvest.sos.user.domain.NaverLogin;
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
	public ResponseEntity<Map<String,Object>> login(String userId, String userPw, HttpServletResponse response) {
		
		log.info("login : "+ userId);
		log.info("login : "+ userPw);
		
		Map<String, Object> returnData = new HashMap<String, Object>();
		
		User user = service.certify(userId, userPw);
		//System.out.println("user정보 :"+user);
		
		// 로그인 성공
		if(user != null) {

			Cookie cookie = new Cookie("userIdC", userId);
			cookie.setMaxAge(60 * 60 * 24);
			cookie.setPath("/");
			
			response.addCookie(cookie);
			
			returnData.put("user", user);
			return new ResponseEntity<>(returnData,HttpStatus.OK);
		}
		// 로그인 실패
		else {
			returnData.put("message","loginFail");
			return new ResponseEntity<>(returnData,HttpStatus.OK);
		}
		
	}
	
	@GetMapping(value = "/kakaologin")
	public String kakaoLogin(@RequestParam("code") String code , HttpServletRequest request, HttpServletResponse response, HttpSession session, RedirectAttributes reAttributes) throws Exception{
	  System.out.println("인증키"+code);
	  JsonNode token = KakaoLogin.getAccessToken(code);
	  
	  JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
	  Map<String, Object> returnData = new HashMap<String, Object>();
	  System.out.println("profile"+profile);
	  User user = KakaoLogin.changeData(profile);
	  
	  System.out.println(user);
	  if(user != null) {
		  user.setUserPw("kakao");
		  user.setUserEmail("kakao@kakao.com");
		  user.setUserAuthority("kakao");
		  user.setUserId(user.getUserId());
		  if(service.readById(user.getUserId()) == null) {
			  service.regist(user);
		  }
	
		  System.out.println(session);
		  session.setAttribute("login", user);
		  System.out.println(user.toString());
		  
			// 로그인 성공
			Cookie cookie = new Cookie("userIdC", user.getUserId());
			cookie.setMaxAge(60 * 60 * 24);
			cookie.setPath("/");
			
			response.addCookie(cookie);
			reAttributes.addFlashAttribute("user", user);
			
			return "redirect:/sns/newsfeed";
		}
		// 로그인 실패
		else {
			reAttributes.addFlashAttribute("message","loginFail");
			return "redirect:/sns/newsfeed";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {

		log.info("logout");

		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("userIdC")) {
					
					cookies[i].setMaxAge(0); // 유효시간을 0으로 설정
					cookies[i].setPath("/");
					response.addCookie(cookies[i]);
					//System.out.println("로그아웃 쿠키남으면 안돼 : " + cookies[i].getValue());
				}
			}
		}
		
		return "redirect:/sns/newsfeed";

	}
	
	@PostMapping("/update")	
	public String update(User user, HttpServletRequest request) {

		log.info("update : "+ user);
		
		//System.out.println("받아온 user 정보: "+user);
		
		String userId = (String) request.getAttribute("userId");
		User userUpdate = service.readById(userId);
		int userSeq = userUpdate.getUserSeq();
		
		user.setUserSeq(userSeq);
		
		boolean result = service.updateUser(user);
		//System.out.println("수정된 user 결과: "+ result);

		return "redirect:/sns/mypage_index";
	}
	
	@PostMapping("/updateImage")	
	public String updateImage(HttpServletRequest request) {

		log.info("updateImage : ");
		
		//System.out.println("파일 :"+request.getParameter("file"));

		String userId = (String) request.getAttribute("userId");
		User user = service.readById(userId);
		String userImage = request.getParameter("file");

		if(userImage == null) {
			userImage = "forum7.png";
		}
		
		user.setUserPicture(userImage);
		boolean result = service.updateUser(user);
		
		return "redirect:/sns/mypage_index";
	}
	
	/**
	 * mypage 개인정보 들어오는 컨트롤러
	 */
	@ResponseBody
	@PostMapping(value = "/information", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> userInformation(String userId) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		System.out.println("mypage 유저아이디: "+userId);
		returnData.put("user", service.readById(userId));

		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
	
	/**
	 * 각 유저 이름 클릭시 modal에 보여주기 위한 컨트롤러
	 */
	@ResponseBody
	@PostMapping(value = "/data", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> userData(String userId) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		System.out.println("유저 이름 클릭시 아이디: "+userId);
		returnData.put("userData", service.readById(userId));

		return new ResponseEntity<>(returnData,HttpStatus.OK);
	}
	
	
	/**
	 * newsfeed page 주식랭킹 Top5, 아직 완성xxxxxxxxxxxxxxxxxx
	 */
	@ResponseBody
	@GetMapping(value = "/ranking", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<String,Object>> userRanking() {
		
		int num=5;
		//System.out.println("주식랭킹 top5");		
		
		Map<String, Object> returnData = new HashMap<String, Object>();
		List<User> userList = service.totalMarginTop(num);
		
		//System.out.println(userList);
		returnData.put("userRanking",service.totalMarginTop(num));
		
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
	
	//로그인 첫 화면 요청 메소드
/*    @RequestMapping(value = "/naverlogin", method = { RequestMethod.GET, RequestMethod.POST })
    public ResponseEntity<Map<String,Object>> login(Model model, HttpSession session) {
    	Map<String, Object> returnData = new HashMap<String, Object>();
    	NaverLogin naverLogin = new NaverLogin();
        String naverAuthUrl = naverLogin.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        returnData.put("url", naverAuthUrl);
        return new ResponseEntity<>(returnData,HttpStatus.OK);
    }

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletResponse response, RedirectAttributes reAttributes)
            throws IOException {
    	
    	NaverLogin naverLogin = new NaverLogin();
        OAuth2AccessToken oauthToken;
        oauthToken = naverLogin.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        String apiResult = naverLogin.getUserProfile(oauthToken);
        System.out.println(apiResult);
        if(apiResult != null) {
        	ObjectMapper mapper = new ObjectMapper();
        	JsonNode jsonMap = mapper.readTree(apiResult.toString());
        	JsonNode userInfo = jsonMap.get("response");
        	User user = new User();
        	user.setUserId(userInfo.get("id").asText());
        	  user.setUserPw("naver");
	  		  user.setUserEmail(userInfo.get("email").asText());
	  		  user.setUserAuthority("naver");
	  		  user.setUserNickname(userInfo.get("nickname").asText());
	  		  user.setUserPicture(userInfo.get("profile_image").asText());
	  		  if(service.readById(user.getUserId()) == null) {
	  			  service.regist(user);
	  		  }
	  	
	  		  session.setAttribute("login", user);
  		  
  			// 로그인 성공
  			Cookie cookie = new Cookie("userIdC", user.getUserId());
  			cookie.setMaxAge(60 * 60 * 24);
  			cookie.setPath("/");
  			
  			response.addCookie(cookie);
  			reAttributes.addFlashAttribute("user", user);
        }else {
        	reAttributes.addFlashAttribute("message","loginFail");
        }
        return "redirect:/sns/newsfeed";
    }
	*/
}
