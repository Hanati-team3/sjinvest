package com.sjinvest.sos.NonFinancial.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjinvest.sos.NonFinancial.domain.NonFinancial;
import com.sjinvest.sos.NonFinancial.mapper.NonFinancialMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NonFinancialServiceImpl implements NonFinancialService {
	@Autowired
	private NonFinancialMapper mapper;
	
	@Override
	public List<NonFinancial> readByCompanyNumber(String companyNumber) {
		return mapper.readByCompanyNumber(companyNumber);
	}

	@Override
	public List<NonFinancial> readByCompanyName(String companyName) {
		return mapper.readByCompanyName(companyName);
	}

}
