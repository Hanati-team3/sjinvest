package com.sjinvest.sos.stock.params;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class IndexChartParams {
	private List<String> interestCompanyNumberList;
	private Integer kospiOption;	/** 1일, 1개월 등등 */ 
}
