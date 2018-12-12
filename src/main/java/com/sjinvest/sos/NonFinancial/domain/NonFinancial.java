package com.sjinvest.sos.NonFinancial.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "NonFinancial")
public class NonFinancial {
	private String nonFinancialTitle;
	private String companyNumber;
	private String companyName;
	private int nonFinancialContent;
}