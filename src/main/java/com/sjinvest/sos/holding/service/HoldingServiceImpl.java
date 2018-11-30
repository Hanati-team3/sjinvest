package com.sjinvest.sos.holding.service;

import java.util.List;

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
	public boolean modification(Holding holding) {
		try {
			if(mapper.checkByCompanyNumber(holding).size()>0) {
				mapper.modificationHolding(holding);
			}else {
				mapper.create(holding);
			}
		}catch (Exception e) {
			return false;
		}
		return true;
	}
	@Override
	public boolean deleteHolding(int holdingSeq) {
		return (mapper.deleteHolding(holdingSeq)==1);
	}
	@Override
	public List<Holding> listByUser(int userSeq) {
		return mapper.listByUser(userSeq);
	}

}
