package com.sjinvest.sos.trading.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjinvest.sos.trading.domain.Trading;
import com.sjinvest.sos.trading.mapper.TradingMapper;
import com.sjinvest.sos.user.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class TradingServiceImpl implements TradingService {

	@Autowired
	private TradingMapper mapper;
	@Autowired
	private UserMapper userMapper;

	@Transactional
	@Override
	public boolean create(Trading trading) {
		try {
			mapper.create(trading);
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("userSeq", trading.getUserSeq());
			if(trading.getTradingType()==1) {
				data.put("userMoney", -(trading.getTradingAmount()*trading.getTradingPrice()));
			}else {
				data.put("userMoney", (trading.getTradingAmount()*trading.getTradingPrice()));
			}
			userMapper.addUserMoney(data);
		}catch(Exception e) {
			log.info(e);
			return false;
		}
		return true;
	}

	@Override
	public List<Trading> listByUser(int userSeq, int tradingType, String startDate, String endDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(userSeq != 0) {
			map.put("userSeq", userSeq);
		}
		if(tradingType != 0) {
			map.put("tradingType", tradingType);
		}
		if(startDate != null && endDate != null) {
			map.put("startDate", startDate);
			map.put("endDate", endDate);
		}
		return mapper.listByUser(map);
	}

	
}
