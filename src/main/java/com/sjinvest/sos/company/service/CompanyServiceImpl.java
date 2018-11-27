package com.sjinvest.sos.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjinvest.sos.company.domain.Company;
import com.sjinvest.sos.company.mapper.CompanyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyMapper mapper;

	@Override
	public boolean Create(Company company) {
		try {
			mapper.create(company);
		}catch(Exception e) {
			return false;
		}
		return true;
	}
}
