package com.sjinvest.sos.holding.mapper;

import java.util.List;

import com.sjinvest.sos.holding.domain.Holding;

public interface HoldingMapper {
	public void create(Holding holding);
	public int deleteHolding(int holdingSeq);
	public int deleteHoldingByUser(int userSeq);
	public List<Holding> listByUser(int userSeq);
	public List<Holding> checkByCompanyNumber(Holding holding);
	public int modificationHolding(Holding holding);
}