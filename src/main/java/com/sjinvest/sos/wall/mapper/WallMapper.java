package com.sjinvest.sos.wall.mapper;

import java.util.List;
import java.util.Map;

import com.sjinvest.sos.wall.domain.Wall;

public interface WallMapper {
	public void write(Wall wall);	
	public int deleteWall(int wallSeq);
	public int deleteWallByUser(int userSeq);
	public int updateWall();
	public List<Wall> listByUser(Map<String, Object> map);
}