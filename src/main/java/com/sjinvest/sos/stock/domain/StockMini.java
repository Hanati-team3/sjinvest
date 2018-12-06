package com.sjinvest.sos.stock.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
@Data
public class StockMini {
	private String stockCode;
	private String stockName;
	private int total;
	private double rate;
	private double forRate;
}