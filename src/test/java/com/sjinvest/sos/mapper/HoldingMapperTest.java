package com.sjinvest.sos.mapper;

import java.sql.SQLException;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sjinvest.sos.holding.domain.Holding;
import com.sjinvest.sos.holding.mapper.HoldingMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class HoldingMapperTest {

	@Inject
	private HoldingMapper mapper;
	
//	@Test
	public void testCreate() throws SQLException {
		log.info(mapper);
		Holding holding = new Holding();
		holding.setCompanyNumber("051900");
		holding.setCompanyName("LG생활건강");
		holding.setHoldingAmount(1);
		holding.setHoldingTotalMoney(10000);
		holding.setUserSeq(2);
		mapper.create(holding);
	}
//	@Test
	public void testDelete() throws SQLException {
		log.info(mapper);
		mapper.deleteHolding(2);
		mapper.deleteHoldingByUser(2);
	}
//	@Test
	public void testList() throws SQLException {
		log.info(mapper);
		mapper.listByUser(2);
	}
	@Test
	public void testModification() throws SQLException {
		log.info(mapper);
		Holding holding = new Holding();
		holding.setHoldingSeq(7);
		holding.setCompanyNumber("051900");
		holding.setCompanyName("LG생활건강");
		holding.setHoldingAmount(1);
		holding.setHoldingTotalMoney(10000);
		holding.setUserSeq(2);
		mapper.modificationHolding(holding);
	}
}