package com.sjinvest.sos.point.mapper;

import java.util.List;

import com.sjinvest.sos.point.domain.Point;

public interface PointMapper {
	public void create(Point point);	
	public List<Point> listByUser(int userSeq);
	public int deleteByUser(int userSeq);
}