package com.sjinvest.sos.stock.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
@Data
public class Rank {
	private String stockCode;
	private String stockName;
	private double stockValue;
}