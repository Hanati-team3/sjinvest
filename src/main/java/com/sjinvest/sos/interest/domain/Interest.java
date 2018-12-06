package com.sjinvest.sos.interest.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "Interest")
public class Interest {
	private int userSeq;
	private String companyNumber;
	private String companyName;
	private String fieldName;
}