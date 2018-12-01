package com.sjinvest.sos.stock.domain;
import lombok.Data;
@Data
public class AskingPrice {
	private int type;
	private int quantity;
	private int price;
}