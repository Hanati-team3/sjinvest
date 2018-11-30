package com.sjinvest.sos.trading.service;

import java.util.List;
import java.util.Map;

import com.sjinvest.sos.trading.domain.Trading;

public interface TradingService {
	// 거래 목록 생성
	public boolean create(Trading trading);	
	// 해당 유저 거래 목록 가져오기
	public List<Trading> listByUser(int userSeq, int tradingType, String startDate, String endDate);
}
