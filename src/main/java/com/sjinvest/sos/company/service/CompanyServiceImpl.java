package com.sjinvest.sos.company.service;

import java.util.List;

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
	private CompanyMapper companyMapper;

	@Override
	public Company readByNumber(String companyNumber) {
		return companyMapper.readByNumber(companyNumber);
	}

	@Override
	public Company readByName(String companyName) {
		return companyMapper.readByName(companyName);
	}

	@Override
	public List<Company> list() {
		return companyMapper.list();
	}

	@Override
	public List<Company> readByFieldName(String fieldName) {
		return companyMapper.readByFieldName(fieldName);
	}

	@Override
	public List<Company> readByFieldNumber(int fieldNumber) {
		return companyMapper.readByFieldNumber(fieldNumber);
	}

	@Override
	public List<Company> search(String keyword) {
		return companyMapper.search(keyword);
	}
	@Override
	public List<String> findCompany(String term){
		return companyMapper.findCompany(term);
	}
}
