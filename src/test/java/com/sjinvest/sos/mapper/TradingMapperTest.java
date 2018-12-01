package com.sjinvest.sos.mapper;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sjinvest.sos.trading.domain.Trading;
import com.sjinvest.sos.trading.mapper.TradingMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TradingMapperTest {

	@Inject
	private TradingMapper mapper;
	
//	@Test
	public void testCreate() throws SQLException {
		Trading trading = new Trading();
		trading.setUserSeq(2);
		trading.setTradingType(2);
		trading.setTradingPrice(3000);
		trading.setTradingAmount(1000);
		trading.setCompanyNumber("090430");
		trading.setCompanyName("아모레퍼시픽");
		mapper.create(trading);
	}
//	@Test
	public void testList() throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userSeq", 2);
//		map.put("tradingType", 2);
		map.put("startDate", "2018-11-28");
		map.put("endDate", "2018-11-30");
		map.put("startNum", 1);
		map.put("endNum", 2);
		mapper.listByUser(map);
	}
	@Test
	public void testCount() throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userSeq", 2);
//		map.put("tradingType", 2);
		map.put("startDate", "2018-11-28");
		map.put("endDate", "2018-11-30");
		map.put("startNum", 1);
		map.put("endNum", 2);
		log.info(mapper.countByUser(map));
	}
//	@Test
	public void testTop() throws SQLException{
		mapper.earningRatio(5);
	}

}