package com.sjinvest.sos.setting.service;

import com.sjinvest.sos.setting.domain.Setting;


public interface SettingService {
	public boolean create(int userSeq);
	public Setting read(int userSeq);
	public boolean update(Setting setting);
}
