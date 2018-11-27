package com.sjinvest.sos.interest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjinvest.sos.interest.domain.Interest;
import com.sjinvest.sos.interest.mapper.InterestMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class InterestServiceImpl implements InterestService {

	@Autowired
	private InterestMapper mapper;

	@Override
	public boolean Create(Interest interest) {
		try {
			mapper.create(interest);
		}catch(Exception e) {
			return false;
		}
		return true;
	}
}
