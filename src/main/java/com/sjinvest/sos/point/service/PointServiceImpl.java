package com.sjinvest.sos.point.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjinvest.sos.point.domain.Point;
import com.sjinvest.sos.point.mapper.PointMapper;
import com.sjinvest.sos.user.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PointServiceImpl implements PointService {

	@Autowired
	private PointMapper mapper;
	@Autowired
	private UserMapper userMapper;
	
	@Transactional
	@Override
	public boolean create(Point point) {
		try {
			mapper.create(point);
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("userSeq", point.getUserSeq());
			data.put("userPoint", point.getPointAmount());
			userMapper.addUserPoint(data);
		}catch(Exception e) {
			return false;
		}
		return true;
	}

	@Override
	public List<Point> listByUser(int userSeq) {
		return mapper.listByUser(userSeq);
	}
	
}
