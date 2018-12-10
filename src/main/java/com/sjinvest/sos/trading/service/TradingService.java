package com.sjinvest.sos.trading.service;

import java.util.List;
import java.util.Map;

import com.sjinvest.sos.trading.domain.Trading;

public interface TradingService {
	// 거래 목록 생성
	public boolean create(Trading trading);	
	// 해당 유저 거래 목록 가져오기
	public List<Trading> listByUser(int userSeq, int tradingType, String startDate, String endDate, int startNum, int endNum);
	// 실현 수익률 top 5 유저 목록 및 수익률 가져오기 user_seq, earnings_ratio
	public List<Map<String, Object>> earningRatio(int num);
	// 
	public int countByUser(int userSeq, int tradingType, String startDate, String endDate, int startNum, int endNum);
	//
	public boolean deleteTradingByUser(int userSeq);
}
