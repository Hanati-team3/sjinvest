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
	private String fieldName;
	private double stockDiff;
	private int stockVolume;
	private int stockHigh;
	private int stockLow;
	private int stockVolumeBefore;
	private double per;
	private int total;
	private int stockClosingPrice;
	private int listing;
	private String listdate;
	private int fwdvl;
	private int ftradmdcha;
	private double ftradmddiff;
	private int fwsvl;
	private int ftradmscha;
	private double ftradmsdiff;
	private int bfsales;
	private int bfnetincome;
	private double salert;
	private double netrt;
}