package com.sjinvest.sos.holding.service;

import java.util.List;

import com.sjinvest.sos.holding.domain.Holding;

public interface HoldingService {
	//주식 삭제
	public boolean deleteHolding(int holdingSeq);
	//특정 유저 보유 주식 목록
	public List<Holding> listByUser(int userSeq);
}
