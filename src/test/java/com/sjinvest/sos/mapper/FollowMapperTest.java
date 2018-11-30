package com.sjinvest.sos.mapper;

import java.sql.SQLException;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sjinvest.sos.follow.domain.Follow;
import com.sjinvest.sos.follow.mapper.FollowMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FollowMapperTest {

	@Inject
	private FollowMapper mapper;//	@Test
	
//	@Test
	public void testWrite() throws SQLException {
		log.info(mapper);
		Follow follow = new Follow();
		follow.setUserSeq(2);
		follow.setFollowUserSeq(7);
		mapper.create(follow);
	}
//	@Test
	public void testDelete() throws SQLException {
		log.info(mapper);
		Follow follow = new Follow();
		follow.setUserSeq(2);
		follow.setFollowUserSeq(7);
		mapper.deleteFollow(follow);
	}
//	@Test
	public void testDeleteByUser() throws SQLException {
		log.info(mapper);
		mapper.deleteFollowByUser(2);
	}
	@Test
	public void uestList() throws SQLException{
		mapper.listByUserFollow(2);
		mapper.listByUserFollower(2);
	}
}