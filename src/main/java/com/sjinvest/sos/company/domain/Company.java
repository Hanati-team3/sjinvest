package com.sjinvest.sos.company.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "Company")
public class Company {
	private String companyNumber;
	private String companyName;
	private int fieldNumber;
	private String fieldName;
	private int companyTotalStock;
	private String companyDetail;
}