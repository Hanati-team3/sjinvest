package com.sjinvest.sos.stock.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
@Data
public class Kospi {
	private double price;
	private double high;
	private double low;
	private double lastPrice;
	private int volume;
}