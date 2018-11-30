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
	public boolean create(int userSeq) {
		try{
			mapper.create(userSeq);
		}catch (Exception e) {
			return false;
		}
		return true;
	}

	@Override
	public Setting read(int userSeq) {
		return mapper.read(userSeq);
	}

	@Override
	public boolean update(Setting setting) {
		return (mapper.update(setting)==1);
	}

}
