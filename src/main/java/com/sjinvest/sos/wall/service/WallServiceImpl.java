package com.sjinvest.sos.wall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sjinvest.sos.feed.domain.Feed;
import com.sjinvest.sos.wall.domain.Wall;
import com.sjinvest.sos.wall.mapper.WallMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class WallServiceImpl implements WallService {

	@Inject
	private WallMapper wallMapper;

	@Override
	public void write(Wall wall) {
		System.out.println("wall은"+wall);
		wallMapper.write(wall);
		return;
	}

	@Override
	public List<Wall> listByUser(int startNum, int endNum, int userSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userSeq", userSeq);
		return wallMapper.listByUser(map);
	}

}
