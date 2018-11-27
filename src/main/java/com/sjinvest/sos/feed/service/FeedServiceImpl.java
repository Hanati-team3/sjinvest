package com.sjinvest.sos.feed.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjinvest.sos.feed.domain.Feed;
import com.sjinvest.sos.feed.mapper.FeedMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FeedServiceImpl implements FeedService {

	@Autowired
	private FeedMapper mapper;

	@Override
	public boolean Create(Feed feed) {
		try {
			mapper.create(feed);
		}catch(Exception e) {
			return false;
		}
		return true;
	}
}
