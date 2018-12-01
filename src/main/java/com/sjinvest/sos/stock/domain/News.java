package com.sjinvest.sos.stock.domain;
import lombok.Data;
@Data
public class News {
	private String Title;
	private String HeadLine;
	private String source;
	private String link;
	private String Date;
}