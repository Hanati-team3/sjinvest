package com.sjinvest.sos.trading.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "Trading")
public class Trading {
	private int tradingSeq;
	private int userSeq;
	private int companySeq;
	private String companyName;
	private int tradingType;
	private String tradingTime;
	private int tradingPrice;
	private int tradingAmount;
}