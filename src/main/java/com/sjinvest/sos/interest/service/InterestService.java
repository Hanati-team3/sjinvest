package com.sjinvest.sos.interest.service;

import java.util.List;
import java.util.Map;

import com.sjinvest.sos.interest.domain.Interest;

public interface InterestService {
	public boolean add(Interest interest);
	public boolean delete(int interestSeq);
	public List<Interest> listByUser(int userSeq);
	public List<Interest> check(int userSeq, String companyNumber);
}
