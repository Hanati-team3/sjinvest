package com.sjinvest.sos.point.service;

import java.util.List;

import com.sjinvest.sos.point.domain.Point;

public interface PointService {
	public boolean create(Point point);	
	public List<Point> listByUser(int userSeq);
}
