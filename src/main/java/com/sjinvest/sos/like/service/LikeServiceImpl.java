package com.sjinvest.sos.like.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjinvest.sos.feed.mapper.FeedMapper;
import com.sjinvest.sos.like.domain.Like;
import com.sjinvest.sos.like.mapper.LikeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LikeServiceImpl implements LikeService {

	@Inject
	private LikeMapper mapper;
	@Inject
	private FeedMapper feedMapper;
	
	@Transactional
	@Override
	public boolean add(Like like) {
		try {
			mapper.add(like);
			Map<String, Integer> data = new HashMap<String, Integer>();
			data.put("feedSeq", like.getFeedSeq());
			data.put("feedLikeCnt", 1);
			feedMapper.increaseLike(data);
		}catch (Exception e) {
			return false;
		}
		return true;
	}

	@Transactional
	@Override
	public boolean delete(Like like) {
		boolean result = (mapper.delete(like)>0);
		if(result) {
			Map<String, Integer> data = new HashMap<String, Integer>();
			data.put("feedSeq", like.getFeedSeq());
			data.put("feedLikeCnt", -1);
			feedMapper.increaseLike(data);
		}
		return result;
	}

	@Override
	public List<Like> listByUser(int userSeq) {
		return mapper.listByUser(userSeq);
	}

	@Override
	public boolean check(Like like) {
		return mapper.check(like) !=null;
	}

	@Override
	public int checkCount(int feedSeq) {
		return mapper.checkCount(feedSeq);
	}


}
