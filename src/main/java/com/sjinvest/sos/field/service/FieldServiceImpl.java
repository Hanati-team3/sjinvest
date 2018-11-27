package com.sjinvest.sos.field.service;

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
	public boolean Create(Field field) {
		try {
			mapper.create(field);
		}catch(Exception e) {
			return false;
		}
		return true;
	}
}
