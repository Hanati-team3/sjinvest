package com.sjinvest.sos.like.service;

import java.util.List;

import com.sjinvest.sos.like.domain.Like;

public interface LikeService {
	public boolean add(Like like);
	public boolean delete(Like like);
	public List<Like> listByUser(int userSeq);
	public boolean check(Like like);
}
