package com.sjinvest.sos.field.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjinvest.sos.field.domain.Field;
import com.sjinvest.sos.field.mapper.FieldMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FieldServiceImpl implements FieldService {

	@Autowired
	private FieldMapper mapper;

	@Override
	public Field readByNumber(int fieldNumber) {
		return mapper.readByNumber(fieldNumber);
	}

	@Override
	public Field readByName(String fieldName) {
		return mapper.readByName(fieldName);
	}

	@Override
	public List<Field> list() {
		return mapper.list();
	}


}
