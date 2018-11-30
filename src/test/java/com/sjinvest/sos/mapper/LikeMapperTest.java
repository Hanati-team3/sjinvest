package com.sjinvest.sos.mapper;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sjinvest.sos.like.domain.Like;
import com.sjinvest.sos.like.mapper.LikeMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LikeMapperTest {

	@Inject
	private LikeMapper mapper;
	
//	@Test
	public void testCreate() throws SQLException {
		Like like = new Like();
		like.setUserSeq(2);
		like.setFeedSeq(8);
		mapper.add(like);
	}
//	@Test
	public void testDelete() throws SQLException {
		Like like = new Like();
		like.setUserSeq(2);
		like.setFeedSeq(8);
//		mapper.delete(like);
		mapper.deleteByUser(2);
	}
	
//	@Test
	public void testList() throws SQLException {
		mapper.listByUser(2);
	}
	@Test
	public void testCheck() throws SQLException {
		Like like = new Like();
		like.setFeedSeq(11);
		like.setUserSeq(3);
		mapper.check(like);
	}
}