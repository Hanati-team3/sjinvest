package com.sjinvest.sos.like.mapper;

import java.util.List;

import com.sjinvest.sos.like.domain.Like;

public interface LikeMapper {
	public void add(Like like);	
	public int delete(Like like);
	public int deleteByUser(int userSeq);
	public int deleteByFeed(int feedSeq);
	public List<Like> listByUser(int userSeq);
	public Like check(Like like);
}