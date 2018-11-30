package com.sjinvest.sos.company.service;

import java.util.List;

import com.sjinvest.sos.company.domain.Company;

public interface CompanyService {
	// 종목 번호로 회사 가져오기
	public Company readByNumber(String companyNumber);
	// 회사 이름으로 회사 객체 가져오기
	public Company readByName(String companyName);
	// 회사 전체 리스트
	public List<Company> list();
	// 업종 명으로 해당 회사 목록 가져오기
	public List<Company> readByFieldName(String fieldName);
	// 업종 번호로 해당 회사 목록 가져오기
	public List<Company> readByFieldNumber(int fieldNumber);
	// 회사 검색
	public List<Company> search(String keyword);
}
