package com.sjinvest.sos.feed.service;

import java.util.List;
import java.util.Map;

import com.sjinvest.sos.feed.domain.Feed;
import com.sjinvest.sos.feed.domain.SearchParam;

public interface FeedService {
	public boolean write(Feed feed);
	public boolean deleteFeed(int feedSeq);
	public boolean updateFeed(Feed feed);
	public boolean increaseShare(int feedSeq);
	public List<Feed> listAll();
	public List<Feed> listBySearchPage(Map<String, Object> map);
	public List<Feed> listBySearchPage(SearchParam searchParam);
}
