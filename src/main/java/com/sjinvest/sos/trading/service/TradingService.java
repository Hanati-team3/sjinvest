package com.sjinvest.sos.trading.service;

import java.util.List;
import java.util.Map;

import com.sjinvest.sos.trading.domain.Trading;

public interface TradingService {
	public boolean create(Trading trading);	
	public List<Trading> listByUser(int userSeq, int tradingType, String startDate, String endDate);
}
