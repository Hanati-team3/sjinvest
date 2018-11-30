package com.sjinvest.sos.holding.service;

import java.util.List;

import com.sjinvest.sos.holding.domain.Holding;

public interface HoldingService {
	public boolean modification(Holding holding);
	public boolean deleteHolding(int holdingSeq);
	public List<Holding> listByUser(int userSeq);
}
