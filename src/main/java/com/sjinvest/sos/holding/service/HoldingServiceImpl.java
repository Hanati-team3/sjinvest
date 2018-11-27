package com.sjinvest.sos.holding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjinvest.sos.holding.domain.Holding;
import com.sjinvest.sos.holding.mapper.HoldingMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class HoldingServiceImpl implements HoldingService {

	@Autowired
	private HoldingMapper mapper;

	@Override
	public boolean Create(Holding holding) {
		try {
			mapper.create(holding);
		}catch(Exception e) {
			return false;
		}
		return true;
	}
}
