package com.sjinvest.sos.field.service;

import java.util.List;

import com.sjinvest.sos.field.domain.Field;

public interface FieldService {
	public Field readByNumber(int fieldNumber);
	public Field readByName(String fieldName);
	public List<Field> list();
}
