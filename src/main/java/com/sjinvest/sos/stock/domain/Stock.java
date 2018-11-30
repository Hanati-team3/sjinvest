package com.sjinvest.sos.stock.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
@Data
public class Stock {
	private String stockCode;
	private String stockName;
	private int stockPrice;
	private int stockChange;
	private double stockDiff;
	private int stockVolume;
	private int stockHigh;
	private int stockLow;
	private double per;
}