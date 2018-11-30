package com.sjinvest.sos.follow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjinvest.sos.follow.domain.Follow;
import com.sjinvest.sos.follow.mapper.FollowMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FollowServiceImpl implements FollowService {

	@Autowired
	private FollowMapper mapper;

	@Override
	public boolean create(Follow follow) {
		try {
			mapper.create(follow);
		}catch(Exception e) {
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteFollow(Follow follow) {
		return (mapper.deleteFollow(follow)==1);
	}

	@Override
	public List<Follow> listByUserFollow(int userSeq) {
		return mapper.listByUserFollow(userSeq);
	}

	@Override
	public List<Follow> listByUserFollower(int userSeq) {
		return mapper.listByUserFollower(userSeq);
	}
}
