package com.sjinvest.sos.field.service;

import java.util.List;

import com.sjinvest.sos.field.domain.Field;

public interface FieldService {
	// 업종 번호로 업종 가져오기
	public Field readByNumber(int fieldNumber);
	// 업종 이름으로 업종 가져오기
	public Field readByName(String fieldName);
	// 업종 전체 리스트 가져오기
	public List<Field> list();
	// 업종 검색 (자동완성을 위한)
	public List<String> findField(String term);
}
