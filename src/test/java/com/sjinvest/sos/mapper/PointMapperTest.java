package com.sjinvest.sos.mapper;

import java.sql.SQLException;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sjinvest.sos.point.domain.Point;
import com.sjinvest.sos.point.mapper.PointMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PointMapperTest {

	@Inject
	private PointMapper mapper;
	
//	@Test
	public void testCreate() throws SQLException {
		Point point = new Point();
		point.setPointAmount(100);
		point.setPointContent("테스트");
		point.setUserSeq(6);
		mapper.create(point);
	}
//	@Test
	public void testList() throws SQLException {
		mapper.listByUser(2);
	}
	
	@Test
	public void testdelete() throws SQLException {
		mapper.deleteByUser(6);
	}
}