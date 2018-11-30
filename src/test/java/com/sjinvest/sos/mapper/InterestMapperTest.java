package com.sjinvest.sos.mapper;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sjinvest.sos.interest.domain.Interest;
import com.sjinvest.sos.interest.mapper.InterestMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InterestMapperTest {

	@Inject
	private InterestMapper mapper;
	
//	@Test
	public void testCreate() throws SQLException {
		Interest interest = new Interest();
		interest.setUserSeq(6);
		interest.setCompanyName("토니모리");
		interest.setCompanyNumber("214420");
		mapper.add(interest);
	}
//	@Test
	public void testDelete() throws SQLException {
		mapper.delete(4);
	}
	
//	@Test
	public void testList() throws SQLException {
		mapper.listByUser(2);
	}
	@Test
	public void testCheck() throws SQLException {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("userSeq", 2);
		data.put("companyNumber", "051900");
		log.info(mapper.check(data).size());
	}
}