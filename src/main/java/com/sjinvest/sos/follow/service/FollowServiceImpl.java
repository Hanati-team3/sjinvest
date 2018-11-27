package com.sjinvest.sos.follow.service;

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
	public boolean Create(Follow follow) {
		try {
			mapper.create(follow);
		}catch(Exception e) {
			return false;
		}
		return true;
	}
}
