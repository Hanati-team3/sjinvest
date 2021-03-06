package com.sjinvest.sos.follow.service;

import java.util.List;
import java.util.Map;

import com.sjinvest.sos.follow.domain.Follow;

public interface FollowService {
	// 팔로우 쓰기
	public boolean create(Follow follow);
	// 팔로우 삭제
	public boolean deleteFollow(Follow follow);
	// 유저가 팔로우 한 리스트
	public List<Follow> listByUserFollow(int userSeq);
	// 유저를 팔로우 한 리스트
	public List<Follow> listByUserFollower(int userSeq);
	// top 팔로우 리스트 user_seq, count_num
	public List<Map<String, Object>> topFollow(int num);
	// 팔로우 존재
	public int checkFollow(Follow follow);
	
}
