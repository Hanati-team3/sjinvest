package com.sjinvest.sos.holding.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "Holding")
public class Holding {
	private int holdingSeq;
	private int companySeq;
	private String companyName;
	private int userSeq;
	private int holdingAmount;
	private int holdingTotalMoney;
}