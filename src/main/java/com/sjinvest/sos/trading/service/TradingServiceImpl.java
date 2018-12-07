package com.sjinvest.sos.trading.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjinvest.sos.holding.domain.Holding;
import com.sjinvest.sos.holding.mapper.HoldingMapper;
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
	@Autowired
	private HoldingMapper holdingMapper;

	@Transactional
	@Override
	public boolean create(Trading trading) {
		try {
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("userSeq", trading.getUserSeq());
			Holding holding = new Holding();
			holding.setCompanyName(trading.getCompanyName());
			holding.setCompanyNumber(trading.getCompanyNumber());
			holding.setUserSeq(trading.getUserSeq());
			if(trading.getTradingType()==1) {
				data.put("userMoney", -(trading.getTradingAmount()*trading.getTradingPrice()));
				holding.setHoldingAmount(trading.getTradingAmount());
				holding.setHoldingTotalMoney(trading.getTradingAmount()*trading.getTradingPrice());
			}else {
				holding.setHoldingAmount(-trading.getTradingAmount());
				holding.setHoldingTotalMoney(-(trading.getTradingAmount()*trading.getTradingPrice()));
				data.put("userMoney", (trading.getTradingAmount()*trading.getTradingPrice()));
				Holding existHolding = holdingMapper.checkByCompanyNumber(holding).get(0);
				double perSharePrice = existHolding.getHoldingTotalMoney()/existHolding.getHoldingAmount();
				double tradingEarningsRatio = (((trading.getTradingPrice()-perSharePrice)/perSharePrice)*100);
				trading.setTradingEarningsRatio(tradingEarningsRatio);
				userMapper.updateUserMargin(trading.getUserSeq());
			}
			userMapper.addUserMoney(data);
			if(holdingMapper.checkByCompanyNumber(holding).size()>0) {
				holdingMapper.modificationHolding(holding);
			}else {
				holdingMapper.create(holding);
			}
			mapper.create(trading);
		}catch(Exception e) {
			log.info(e);
			return false;
		}
		return true;
	}

	@Override
	public List<Trading> listByUser(int userSeq, int tradingType, String startDate, String endDate, int startNum, int endNum) {
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
		if(startNum != 0 && endNum != 0) {
			map.put("startNum", startNum);
			map.put("endNum", endNum);
		}
		return mapper.listByUser(map);
	}

	@Override
	public List<Map<String, Object>> earningRatio(int num) {
		return mapper.earningRatio(num);
	}

	
}
