package com.sjinvest.sos.NonFinancial.mapper;

import java.util.List;

import com.sjinvest.sos.NonFinancial.domain.NonFinancial;

public interface NonFinancialMapper {
	public List<NonFinancial> readByCompanyNumber(String companyNumber);	
	public List<NonFinancial> readByCompanyName(String companyName);
}