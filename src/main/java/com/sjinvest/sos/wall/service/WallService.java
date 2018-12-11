package com.sjinvest.sos.wall.service;

import java.util.List;

import com.sjinvest.sos.wall.domain.Wall;

public interface WallService {
	// 담벼락 쓰기
	public void write(Wall wall);
	// 피드 검색(유저 리스트로 검색)
	public List<Wall> listByUser(int startNum, int endNum, int userSeq);
}
