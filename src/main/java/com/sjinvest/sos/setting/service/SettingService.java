package com.sjinvest.sos.setting.service;

import com.sjinvest.sos.setting.domain.Setting;


public interface SettingService {
	// 설정 가져오기
	public Setting read(int userSeq);
	// 설정 변경
	public boolean update(Setting setting);
}
