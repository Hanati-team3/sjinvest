package com.sjinvest.sos.field.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "Field")
public class Field {
	private int fieldNumber;
	private String fieldName;
	private String fieldDetail;
}