package com.sjinvest.sos.interest.service;

import java.util.List;
import java.util.Map;

import com.sjinvest.sos.interest.domain.Interest;

public interface InterestService {
	// 관심 목록 추가
	public boolean add(Interest interest);
	// 관심 목록에서 제거
	public boolean delete(Interest interest);
	// 유저 관심 목록 가져오기
	public List<Interest> listByUser(int userSeq);
	// 관심 여부 확인
	public boolean check(int userSeq, String companyNumber);
}
