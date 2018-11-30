package com.sjinvest.sos.setting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjinvest.sos.setting.domain.Setting;
import com.sjinvest.sos.setting.mapper.SettingMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class SettingServiceImpl implements SettingService {

	@Autowired
	private SettingMapper mapper;

	@Override
	public boolean Create(Setting setting) {
		try {
			mapper.create(2);
		}catch(Exception e) {
			return false;
		}
		return true;
	}
}
