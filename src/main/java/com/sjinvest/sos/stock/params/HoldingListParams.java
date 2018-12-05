package com.sjinvest.sos.stock.params;

import java.util.List;

import com.sjinvest.sos.holding.domain.Holding;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HoldingListParams {
	private List<Holding> holdingList;
	private Integer cashTotal;
}
