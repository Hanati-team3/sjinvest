package com.sjinvest.sos.point.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.point.domain.Point;
import com.sjinvest.sos.point.service.PointService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/point/*")
@AllArgsConstructor
public class PointController {

	private PointService service;
	
	@PostMapping("/create")
	public String create(Point point, RedirectAttributes rttr) {
		log.info("register : "+ point);
		service.Create(point);
		return "redirect:/point/list";
	}
}
