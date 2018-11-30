package com.sjinvest.sos.follow.service;

import java.util.List;

import com.sjinvest.sos.follow.domain.Follow;

public interface FollowService {

	public boolean create(Follow follow);
	public boolean deleteFollow(Follow follow);
	public boolean deleteFollowByUser(int userSeq);
	public List<Follow> listByUserFollow(int userSeq);
	public List<Follow> listByUserFollower(int userSeq);
}
