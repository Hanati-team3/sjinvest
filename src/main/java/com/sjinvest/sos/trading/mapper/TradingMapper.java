package com.sjinvest.sos.trading.mapper;

import java.util.List;
import java.util.Map;

import com.sjinvest.sos.trading.domain.Trading;

public interface TradingMapper {
	public void create(Trading trading);	
	public List<Trading> listByUser(Map<String, Object> map);
	public List<Map<String, Object>> earningRatio(int num);
}