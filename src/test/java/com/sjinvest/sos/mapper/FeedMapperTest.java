package com.sjinvest.sos.mapper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sjinvest.sos.feed.domain.Feed;
import com.sjinvest.sos.feed.mapper.FeedMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FeedMapperTest {

	@Inject
	private FeedMapper mapper;//	@Test
	
//	@Test
	public void testWrite() throws SQLException {
		log.info(mapper);
		Feed feed = new Feed();
		feed.setUserSeq(2);
		feed.setFeedContent("mapper 테스트 합니다.");
		mapper.write(feed);
	}
//	@Test
	public void testDelete() throws SQLException {
		log.info(mapper);
		int result = mapper.deleteFeed(10);
		log.info(result);
	}	
//	@Test
	public void testUpdate() throws SQLException {
		log.info(mapper);
		Feed feed = new Feed();
		feed.setFeedSeq(7);
		feed.setFeedLikeCnt(0);
		feed.setFeedContent("업데이트 테스트");
		int result = mapper.updateFeed(feed);
		log.info(result);
	}	
//	@Test
	public void testIncrease() throws SQLException {
		log.info(mapper);
		Map<String, Integer> data = new HashMap<String, Integer>();
		data.put("feedSeq", 7);
		data.put("feedLikeCnt", 1);
		int result = mapper.increaseLike(data);
		log.info(result);
	}
//	@Test
	public void testList() throws SQLException {
		log.info(mapper);
		log.info(mapper.listAll());
	}	
//	@Test
	public void testListSearchingPaging() throws SQLException {
		log.info(mapper);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("startNum", 1);
		data.put("endNum", 10);
		data.put("userSeq", 2);
		List<String> keywords = new ArrayList<String>(); 
		keywords.add("테스트");
		keywords.add("졸림");
		data.put("keywords", keywords);
		log.info(mapper.listBySearchPage(data));
	}
}