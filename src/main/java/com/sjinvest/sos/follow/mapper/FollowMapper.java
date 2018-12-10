package com.sjinvest.sos.follow.mapper;

import java.util.List;
import java.util.Map;

import com.sjinvest.sos.follow.domain.Follow;

public interface FollowMapper {
	public void create(Follow follow);
	public int deleteFollow(Follow follow);
	public int deleteFollowByUser(int userSeq);
	public List<Follow> listByUserFollow(int userSeq);
	public List<Follow> listByUserFollower(int userSeq);
	public List<Map<String, Object>> topFollow(int num);
	public int checkFollow(Follow follow);
}