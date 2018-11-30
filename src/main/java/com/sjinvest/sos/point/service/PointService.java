package com.sjinvest.sos.point.service;

import java.util.List;

import com.sjinvest.sos.point.domain.Point;

public interface PointService {
	// 포인트 내역 만들기
	public boolean create(Point point);	
	// 특정 유저 포인트 내역 목록 가져오기
	public List<Point> listByUser(int userSeq);
}
