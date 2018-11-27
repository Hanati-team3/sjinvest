package com.sjinvest.sos.trading.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjinvest.sos.trading.domain.Trading;
import com.sjinvest.sos.trading.mapper.TradingMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class TradingServiceImpl implements TradingService {

	@Autowired
	private TradingMapper mapper;

	@Override
	public boolean Create(Trading trading) {
		try {
			mapper.create(trading);
		}catch(Exception e) {
			return false;
		}
		return true;
	}
}
