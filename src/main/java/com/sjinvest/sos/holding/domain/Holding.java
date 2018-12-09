package com.sjinvest.sos.holding.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias(value = "Holding")
@AllArgsConstructor
@NoArgsConstructor
public class Holding {
	private int holdingSeq;
	private String companyNumber;
	private String companyName;
	private String fieldName;
	private int userSeq;
	private int holdingAmount;
	private int holdingTotalMoney;
	private double holdingRateOfReturn;
	private int holdingReturn;
	private int realTimePrice;
}