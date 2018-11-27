package com.sjinvest.sos.point.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjinvest.sos.point.domain.Point;
import com.sjinvest.sos.point.mapper.PointMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PointServiceImpl implements PointService {

	@Autowired
	private PointMapper mapper;

	@Override
	public boolean Create(Point point) {
		try {
			mapper.create(point);
		}catch(Exception e) {
			return false;
		}
		return true;
	}
}
