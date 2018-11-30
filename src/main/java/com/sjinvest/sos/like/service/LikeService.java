package com.sjinvest.sos.like.service;

import java.util.List;

import com.sjinvest.sos.like.domain.Like;

public interface LikeService {
	// 좋아요 추가
	public boolean add(Like like);
	// 좋아요 취소
	public boolean delete(Like like);
	// 유저 좋아요 목록 가져오기
	public List<Like> listByUser(int userSeq);
	// 좋아요 여부 확인
	public boolean check(Like like);
}
