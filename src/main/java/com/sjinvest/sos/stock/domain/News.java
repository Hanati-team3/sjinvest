package com.sjinvest.sos.stock.domain;
import lombok.Data;
@Data
public class News {
	private String title;
	private String headLine;
	private String source;
	private String link;
	private String date;
}