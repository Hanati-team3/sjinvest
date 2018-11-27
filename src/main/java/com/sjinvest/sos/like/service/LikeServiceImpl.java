package com.sjinvest.sos.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjinvest.sos.like.domain.Like;
import com.sjinvest.sos.like.mapper.LikeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LikeServiceImpl implements LikeService {

	@Autowired
	private LikeMapper mapper;

	@Override
	public boolean Create(Like like) {
		try {
			mapper.create(like);
		}catch(Exception e) {
			return false;
		}
		return true;
	}
}
