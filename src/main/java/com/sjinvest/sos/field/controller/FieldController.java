package com.sjinvest.sos.field.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sjinvest.sos.field.domain.Field;
import com.sjinvest.sos.field.service.FieldService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/field/*")
@AllArgsConstructor
public class FieldController {

	private FieldService service;
	
	@PostMapping("/regist")
	public String regist(Field field, RedirectAttributes rttr) {
		log.info("register : "+ field);
		service.Create(field);
		return "redirect:/field/list";
	}

}
