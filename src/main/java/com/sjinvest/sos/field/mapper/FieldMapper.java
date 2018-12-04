package com.sjinvest.sos.field.mapper;

import java.util.List;

import com.sjinvest.sos.field.domain.Field;

public interface FieldMapper {
	public Field readByNumber(int fieldNumber);	
	public Field readByName(String fieldName);	
	public List<Field> list();	
	public List<String> findField(String term);
}
