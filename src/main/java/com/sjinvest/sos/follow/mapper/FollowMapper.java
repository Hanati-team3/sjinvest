package com.sjinvest.sos.follow.mapper;

import java.util.List;

import com.sjinvest.sos.follow.domain.Follow;

public interface FollowMapper {
	public void create(Follow follow);
	public int deleteFollow(Follow follow);
	public int deleteFollowByUser(int userSeq);
	public List<Follow> listByUserFollow(int userSeq);
	public List<Follow> listByUserFollower(int userSeq);
}