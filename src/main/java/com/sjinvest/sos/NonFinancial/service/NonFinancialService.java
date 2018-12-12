package com.sjinvest.sos.NonFinancial.service;

import java.util.List;

import com.sjinvest.sos.NonFinancial.domain.NonFinancial;

public interface NonFinancialService {
	public List<NonFinancial> readByCompanyNumber(String companyNumber);	
	public List<NonFinancial> readByCompanyName(String companyName);
}
