package com.sjinvest.sos.company.mapper;

import java.util.List;

import com.sjinvest.sos.company.domain.Company;

public interface CompanyMapper {
	public Company readByNumber(String companyNumber);	
	public Company readByName(String companyName);	
	public List<Company> list();	
	public List<Company> readByFieldName(String fieldName);	
	public List<Company> readByFieldNumber(int fieldNumber);	
	public List<Company> search(String keyword);
	public List<String> findCompany(String term);
}