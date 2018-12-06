package com.sjinvest.sos.interest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public boolean add(Interest interest) {
		try {
			mapper.add(interest);
		}catch (Exception e) {
			log.info(e);
			return false;
		}
		return true;
	}

	@Override
	public boolean delete(Interest interest) {
		return (mapper.delete(interest)==1);
	}

	@Override
	public List<Interest> listByUser(int userSeq) {
		return mapper.listByUser(userSeq);
	}

	@Override
	public boolean check(int userSeq, String companyNumber) {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("userSeq", userSeq);
		data.put("companyNumber", companyNumber);
		return (mapper.check(data).size()>0);
	}


}
