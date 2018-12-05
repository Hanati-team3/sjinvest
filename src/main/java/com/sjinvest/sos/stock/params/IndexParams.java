package com.sjinvest.sos.stock.params;

import java.util.List;

import com.sjinvest.sos.holding.domain.Holding;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class IndexParams {
	private String userId;
	private Integer fieldOption;	/** 1: 거래량 2: 전일대비 */
	private Integer kospiOption;	/** 1일, 1개월 등등 */ 
	private String tabOption;
	private List<Holding> holdingList;
	private Integer cashTotal;
	private List<String> interestCompanyNameList;
}
