package com.sjinvest.sos.interest.mapper;

import java.util.List;
import java.util.Map;

import com.sjinvest.sos.interest.domain.Interest;

public interface InterestMapper {
	public void add(Interest interest);
	public int delete(Interest interest);
	public List<Interest> listByUser(int userSeq);
	public int deleteByUser(int userSeq);
	public List<Interest> check(Map<String, Object> map);
}