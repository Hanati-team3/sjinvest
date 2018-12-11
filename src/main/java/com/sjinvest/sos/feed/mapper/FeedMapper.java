package com.sjinvest.sos.feed.mapper;

import java.util.List;
import java.util.Map;

import com.sjinvest.sos.feed.domain.Feed;

public interface FeedMapper {
	public void write(Feed feed);
	public int deleteFeed(int feedSeq);
	public int updateFeed(Feed feed);
	public int increaseLike(Map<String, Integer> map);
	public int increaseReply(Map<String, Integer> map);
	public int increaseShare(Map<String, Integer> map);
	public List<Feed> listAll();
	public List<Feed> listBySearchPage(Map<String, Object> map);
	public List<Feed> listBySearchPageByUser(Map<String, Object> map);
	public boolean decreaseReply(int feedSeq);
}